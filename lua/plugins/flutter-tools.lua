return {
	"akinsho/flutter-tools.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"stevearc/dressing.nvim", -- For better UI on prompts
	},
	config = function()
		require("flutter-tools").setup({
			lsp = {
				-- Configure LSP settings here, e.g., line length
				settings = {
					lineLength = 120,
				},
			},
		})
	end,
}
