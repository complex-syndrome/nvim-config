local M = {}

-- Refer :Mason for available downloads
-- Remember to also set it up for corresponding types in other variables
-- Ensure the mason installation owner is the user "sudo chown -R $USER:$USER ~/.local/share/nvim/mason"
-- Some installation may require other packages, including python3-venv for ruff or npm for markdownlint
-- refer to :Mason when install fails
-- Its best to install the language itself before configuring the packages here
-- DO NOT USE ensure_installed in NIXOS
M.ensure_installed = {
	"ansible-lint",
	"ansiblels",

	"stylua",
	"luacheck",
	"lua-language-server",

	-- Python
	"ruff",
	"basedpyright",

	-- Shell
	"shfmt",
	"shuck",
	"fish_lsp",

	-- YAML, JSON, TOML
	"taplo",

	-- Json
	"jq",

	-- Markdown
	"markdownlint",

	-- Latex
	"latexindent",
	"tex-fmt",
	"bibtex-tidy",
	"vale",
	"texlab",

	-- -- Rust
	-- 'rust_analyzer',
	-- 'codelldb',
	--
	-- -- Golang
	-- 'gopls',
	-- 'goimports',
	-- 'delve',
	--
	-- -- JS
	-- 'prettierd',
}

M.servers = {
	--  Add any additional override configuration in the following tables. Available keys are:
	--  - cmd (table): Override the default command used to start the server
	--  - filetypes (table): Override the default list of associated filetypes for the server
	--  - capabilities (table): Override fields in capabilities. Can be used to disable certain LSP features.
	--  - settings (table): Override the default settings passed when initializing the server.
	--  For example, to see the options for `lua_ls`, you could go to: https://luals.github.io/wiki/settings/

	lua_ls = {
		-- cmd = { ... },
		-- filetypes = { ... },
		-- capabilities = {},
		settings = {
			Lua = {
				runtime = {
					version = "LuaJIT",
				},
				completion = {
					callSnippet = "Replace",
				},
				diagnostics = {
					globals = { "hl", "vim", "Snacks" },
					disable = { "undefined-global" },
				},
				workspace = {
					library = {
						vim.api.nvim_get_runtime_file("", true),
						vim.fn.stdpath("data") .. "/lazy/snacks.nvim",
					},
					checkThirdParty = false,
				},
				telemetry = {
					enable = false,
				},
			},
		},
	},

	gopls = {
		settings = {
			gopls = {
				completeUnimported = true,
				usePlaceholders = true,
				analyses = {
					unusedparams = true,
					shadow = true,
				},
				staticcheck = true,
			},
		},
	},

	basedpyright = {
		settings = {
			basedpyright = {
				analysis = {
					ignorePatterns = { "*.pyi" },
					diagnosticSeverityOverrides = {
						reportCallIssue = "warning",
						reportUnreachable = "warning",
						reportUnusedImport = "none",
						reportUnusedCoroutine = "warning",
					},
					-- diagnosticMode = "workspace",
					diagnosticMode = "openFilesOnly",
					typeCheckingMode = "basic",
					reportCallIssue = "none",
					disableOrganizeImports = true,
				},
			},
		},
	},

	fish_lsp = {},
	taplo = {},
	shuck = {},
	jsonls = {},
	-- rust_analyzer = {
	--   settings = {
	--     inlayHints = {
	--       bindingModeHints = { enable = true },
	--       chainingHints = { enable = true },
	--       closingBraceHints = { enable = true },
	--       parameterHints = { enable = true },
	--       typeHints = { enable = true },
	--     },
	--     cargo = {
	--       allFeatures = true,
	--       loadOutDirsFromCheck = true,
	--     },
	--     procMacro = {
	--       enable = true,
	--     },
	--   },
	-- },

	-- ts_ls = {},
	-- clangd = {},
	-- ... etc. See `:help lspconfig-all` for a list of all the pre-configured LSPs
	-- Some languages (like typescript) have entire language plugins that can be useful:
	-- https://github.com/pmizio/typescript-tools.nvim
}

M.formatters_by_ft = {
	-- Default applies formatter sequentially
	-- 'stop_after_first' runs the first available formatter from the list only
	-- If not mentioned, install using M.ensure_installed

	lua = { "stylua" },
	nix = { "nixfmt" },
	kdl = { "kdlfmt" },

	sh = { "shfmt" },
	bash = { "shfmt" },
	zsh = { "shfmt" },

	fish = { "fish_indent" },
	go = { "goimports" },
	python = { "ruff" },
	rust = { "rustfmt" },

	markdown = { "markdownlint" },
	json = { "jq" },
	toml = { "taplo" },
	yaml = { "taplo" },
	ini = { "taplo" },
	tex = { "latexindent", "tex-fmt" },
	bib = { "bibtex-tidy" },

	dart = { "dart_format" },

	["yaml.ansible"] = { "ansible-lint" },
	-- javascript = { 'prettierd' }, --'prettier', stop_after_first = true },
}

M.linters_by_ft = {
	lua = { "luacheck" },
	markdown = { "markdownlint" },
	json = { "jq" },

	sh = { "shuck" },
	bash = { "shuck" },
	zsh = { "shuck" },
	fish = { "fish" },

	toml = { "taplo" },
	yaml = { "taplo" },
	ini = { "taplo" },
	tex = { "vale" },

	rust = { "clippy" },
	go = { "golangcilint" },

	-- clojure = { 'clj-kondo' },
	-- dockerfile = { 'hadolint' },
	-- inko = { 'inko' },
	-- janet = { 'janet' },
	-- rst = { 'vale' },
	-- ruby = { 'ruby' },
	-- terraform = { 'tflint' },
	-- text = { 'vale' }
}

return M
