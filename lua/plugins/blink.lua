return {
  { import = "lazyvim.plugins.extras.coding.blink" },
  {
    "saghen/blink.compat",
    opts = {},
  },
  {
    "saghen/blink.cmp",
    opts = {
      appearance = {
        nerd_font_variant = "normal",
      },
      keymap = {
        preset = "enter",
        ["<C-y>"] = { "select_and_accept" },
      },
      completion = {
        list = {
          selection = {
            preselect = false,
          },
        },
        ghost_text = {
          enabled = false,
        },
      },
    },
  },
}
