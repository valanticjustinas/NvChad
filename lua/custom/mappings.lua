local M = {}

M.general = {
  n = {
    [";"] = { ":", "enter command mode", opts = { nowait = true } },
    ["<leader>nc"] = { "<cmd> NvCheatsheet <CR>", "Mapping cheatsheet" },
    -- Terminal split
    ["<leader>tv"] = { function () require("nvterm.terminal").new "horizontal" end },
    ["<leader>th"] = { "<cmd> split <CR>" },

    -- DAP
    ["<leader>d0"] = { function () require("dap").step_out() end, "Step out" },
    ["<leader>do"] = { function () require("dap").step_over() end, "Step over" },
    ["<leader>da"] = { function () require("dap").continue() end, "Run" },
    ["<leader>du"] = { function () require("dapui").toggle() end, "Toggle DAP UI"},
    ["<leader>js"] = { "<cmd> w !node <CR>", "Launch JS file"}
  },
  v = {
    [">"] = { ">gv", "indent"},
  },
}

return M
