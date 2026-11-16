-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

function Remove_qf_item()
  local current_qf_item = vim.fn.line(".")
  local qf_list = vim.fn.getqflist()

  if #qf_list == 0 then
    return
  end

  table.remove(qf_list, current_qf_item)
  vim.fn.setqflist(qf_list, "r")

  -- Reopen QF list to refresh
  vim.cmd("copen")

  -- If not at the end, keep pos otherwise go up
  local new_pos = current_qf_item < #qf_list and current_qf_item or math.max(current_qf_item - 1, 1)

  local win_id = vim.fn.win_getid()
  vim.api.nvim_win_set_cursor(win_id, { new_pos, 0 })
end

-- vim.api.nvim_create_autocmd({ "FileType" }, {
--   pattern = { "ps1" },
--   callback = function()
--     vim.b.autoformat = false
--   end,
-- })

vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = { "qf" },
  callback = function()
    vim.keymap.set("n", "dd", Remove_qf_item, { noremap = true, buffer = true })
  end,
})

vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = { "eruby.yaml" },
  callback = function()
    vim.bo.filetype = "yaml"
  end,
})

vim.api.nvim_create_user_command("ConformToggle", function()
  vim.g.disable_autoformat = not vim.g.disable_autoformat
  print("Conform " .. (vim.g.disable_autoformat and "disabled" or "enabled"))
end, {
  desc = "Toggle format on save",
})

function Yaml_add_crds(bufnr)
  bufnr = bufnr or 0
  local lines = vim.api.nvim_buf_get_lines(bufnr, 0, -1, false)
  local resources = {}
  local current = { line = nil }

  for i, line in ipairs(lines) do
    if line:match("^kind:") then
      current.kind = line:match("^kind:%s*(.+)")
      if not current.line then
        current.line = i
      end
    elseif line:match("^apiVersion:") then
      current.apiVersion = line:match("^apiVersion:%s*(.+)")
      if not current.line then
        current.line = i
      end
    elseif line:match("^%-%-%-") then
      if current.apiVersion and current.kind then
        -- Split apiVersion into group and version
        local group, version
        if current.apiVersion:find("/") then
          group, version = current.apiVersion:match("(.+)/(.+)")
        else
          group = ""
          version = current.apiVersion
        end

        table.insert(resources, {
          kind = current.kind,
          apiVersion = current.apiVersion,
          apiGroup = group,
          version = version,
          line = current.line,
        })
      end
      current = { line = nil }
    end
  end

  -- Don't forget to check the last section
  if current.apiVersion and current.kind then
    local group, version
    if current.apiVersion:find("/") then
      group, version = current.apiVersion:match("(.+)/(.+)")
    else
      group = ""
      version = current.apiVersion
    end

    table.insert(resources, {
      kind = current.kind,
      apiVersion = current.apiVersion,
      apiGroup = group,
      version = version,
      line = current.line,
    })
  end

  -- Define core Kubernetes API groups
  local core_api_groups = {
    [""] = true, -- core group (v1)
    ["apps"] = true,
    ["batch"] = true,
    ["autoscaling"] = true,
    ["networking.k8s.io"] = true,
    ["policy"] = true,
    ["rbac.authorization.k8s.io"] = true,
    ["storage.k8s.io"] = true,
  }

  -- Add comments before CRD resources
  local lines_to_add = {}
  for _, resource in ipairs(resources) do
    -- If the API group is not in core_api_groups, it's likely a CRD
    if resource.apiGroup ~= "" and not core_api_groups[resource.apiGroup] then
      -- Construct URL based on apiGroup and version
      local url = string.format(
        "https://raw.githubusercontent.com/datreeio/CRDs-catalog/main/%s/%s_%s.json",
        resource.apiGroup,
        resource.kind:lower(),
        resource.version
      )
      local modeline = string.format("# yaml-language-server: $schema=%s", url)
      -- Check if the modeline already exists in the previous line
      local prev_line = vim.api.nvim_buf_get_lines(bufnr, resource.line - 2, resource.line - 1, false)[1]
      if not prev_line or not prev_line:match("# yaml%-language%-server: %$schema=") then
        lines_to_add[resource.line] = modeline
      end
    end
  end

  -- Insert the comments
  local offset = 0
  for line_num, comment in pairs(lines_to_add) do
    vim.api.nvim_buf_set_lines(bufnr, line_num - 1 + offset, line_num - 1 + offset, false, { comment })
    offset = offset + 1
  end
end
