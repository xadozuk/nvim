return {
  { import = "lazyvim.plugins.extras.editor.harpoon2" },
  {
    "ThePrimeagen/harpoon",
    opts = {},
    keys = function(_, keys)
      for i = 1, 5 do
        table.insert(keys, {
          "<M-" .. i .. ">",
          function()
            require("harpoon"):list():select(i)
          end,
          desc = "Harpoon to File " .. i,
        })
      end

      return keys
    end,
  },
}
