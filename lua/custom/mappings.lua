local M = {}

M.general = {
  n = {
    [";"] = { ":", "enter command mode", opts = { nowait = true } },
    ["<leader>nc"] = { "<cmd> NvCheatsheet <CR>", "Mapping cheatsheet" },
    -- DAP
    ["<leader>d0"] = { function () require("dap").step_out() end, desc = "Step out" },
    ["<leader>do"] = { function () require("dap").step_over() end, desc = "Step over" },
    ["<leader>da"] = { function () require("dap").continue() end, desc = "Run" },

  },
  v = {
    [">"] = { ">gv", "indent"},
  },
}

return M
