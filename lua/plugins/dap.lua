return {
  { import = "lazyvim.plugins.extras.dap.core" },
  {
    "mfussenegger/nvim-dap",
    keys = {
      {
        "<F5>",
        function()
          require("dap").continue()
        end,
        desc = "Continue",
      },
      {
        "<F8>",
        function()
          require("dap").step_into()
        end,
        desc = "Step into",
      },
      {
        "<F9>",
        function()
          require("dap").step_over()
        end,
        desc = "Step over",
      },
      {
        -- Shift-F8
        "<F20>",
        function()
          require("dap").step_out()
        end,
        desc = "Step out",
      },
    },
  },
}
