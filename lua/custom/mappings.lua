local M = {}

M.general = {
  n = {
    [";"] = { ":", "enter command mode", opts = { nowait = true } },
    ["<leader>nc"] = { "<cmd> NvCheatsheet <CR>", "Mapping cheatsheet" },
    -- DAP
    ["<leader>d0"] = { function () require("dap").step_out() end, "Step out" },
    ["<leader>do"] = { function () require("dap").step_over() end, "Step over" },
    ["<leader>da"] = { function () require("dap").continue() end, "Run" },
    ["<leader>du"] = { function () require("dapui").open() end, "Open DAP UI"},
    ["<leader>dU"] = { function () require("dapui").close() end, "Close DAP UI"}
  },
  v = {
    [">"] = { ">gv", "indent"},
  },
}

return M
