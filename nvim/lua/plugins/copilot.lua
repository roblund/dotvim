return {
	"zbirenbaum/copilot.lua",
	cmd = "Copilot",
	event = "InsertEnter",
	config = function()
		require("copilot").setup({})
	end,
	opts = {
        server_opts_overrides = {
            settings = {
                telemetry = {
                    telemetryLevel = "off",
                },
            },
		},
	},
}
