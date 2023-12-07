local dap = require("dap")

dap.adapters["pwa-node"] = {
	type = "server",
	host = "127.0.0.1",
	port = " 8123",
	executable = {
		command = "node",
    args = {"./js-debug/src/dapDebugServer.js", "8123"}
	},
}

for _, language in ipairs({
	"typescript",
	"javascript",
}) do
	dap.configurations[language] = {
		{
			type = "pwa-node",
			request = "launch",
			name = "Launch file",
			program = "${file}",
			cwd = "${workspaceFolder}",
			runtimeExecutable = "node",
		},
	}
end
