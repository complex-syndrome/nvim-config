-- https://github.com/folke/snacks.nvim

return {
  'folke/snacks.nvim',
  priority = 1000,
  lazy = false,
  ---@type snacks.Config
  opts = {
    bigfile = { enabled = true },
    dashboard = { enabled = true },
    explorer = { enabled = false },
    indent = { enabled = true },
    input = { enabled = false },
    notifier = {
      enabled = true,
      timeout = 3000,
      -- Filter notifications
      -- filter = function(notif)
      --   if notif.msg and notif.msg:find 'Linter command `cargo` exited with code: 101' then
      --     return false
      --   end
      --   return true
      -- end,
    },
    picker = { enabled = true },
    quickfile = { enabled = true },
    scope = { enabled = true },
    scroll = { enabled = true },
    statuscolumn = { enabled = true },
    words = { enabled = true },
    styles = {
      notification = {
        wo = { wrap = true },
      },
    },
  },
  keys = {
    -- Other
    {
      '<leader>gg',
      function()
        Snacks.lazygit()
      end,
      desc = 'Lazy[g]it',
    },
    {
      '<c-/>',
      function()
        Snacks.terminal()
      end,
      desc = 'Toggle Terminal',
    },
    {
      '<leader>z',
      function()
        Snacks.zen()
      end,
      desc = 'Toggle Zen Mode',
    },
    {
      '<leader>.',
      function()
        Snacks.scratch()
      end,
      desc = 'Toggle Scratch Buffer',
    },
    -- File
    {
      '<leader>Fr',
      function()
        Snacks.rename.rename_file()
      end,
      desc = '[F]ile [R]ename',
    },
    -- Find (Shortcuts)
    {
      '<leader> ',
      function()
        Snacks.picker.smart()
      end,
      desc = 'Find Files',
    },
    {
      '<leader>/',
      function()
        Snacks.picker.grep()
      end,
      desc = 'Find Grep',
    },
    -- Find
    {
      '<leader>ff',
      function()
        Snacks.picker.smart()
      end,
      desc = '[F]ind [F]iles',
    },
    {
      '<leader>fb',
      function()
        Snacks.picker.buffers()
      end,
      desc = '[F]ind [B]uffers',
    },
    {
      '<leader>fg',
      function()
        Snacks.picker.grep()
      end,
      desc = '[F]ind [G]rep',
    },
    {
      '<leader>fp',
      function()
        Snacks.picker.projects()
      end,
      desc = '[F]ind [P]rojects',
    },
    {
      '<leader>fq',
      function()
        Snacks.picker.qflist()
      end,
      desc = '[F]ind [Q]uickfix List',
    },
    {
      '<leader>fr',
      function()
        Snacks.picker.resume()
      end,
      desc = '[F]ind [R]esume',
    },
    {
      '<leader>fu',
      function()
        Snacks.picker.undo()
      end,
      desc = '[F]ind [U]ndo History',
    },
    {
      '<leader>fd',
      function()
        Snacks.picker.diagnostics()
      end,
      desc = '[F]ind [D]iagnostics',
    },
    {
      '<leader>fD',
      function()
        Snacks.picker.diagnostics_buffer()
      end,
      desc = '[F]ind [D]iagnostics (Buffer)',
    },
    -- Search
    {
      '<leader>sn',
      function()
        Snacks.picker.notifications()
      end,
      desc = '[S]earch [N]otification (History)',
    },
    {
      '<leader>sm',
      function()
        Snacks.picker.marks()
      end,
      desc = '[S]earch [M]arks',
    },
    {
      '<leader>s:',
      function()
        Snacks.picker.command_history()
      end,
      desc = '[S]earch [:] Command (History)',
    },
    {
      '<leader>s"',
      function()
        Snacks.picker.registers()
      end,
      desc = '[S]earch ["] ("Registers")',
    },
    {
      '<leader>sa',
      function()
        Snacks.picker.autocmds()
      end,
      desc = '[S]earch [A]utocmds',
    },
    {
      '<leader>sc',
      function()
        Snacks.picker.commands()
      end,
      desc = '[S]earch [C]ommands',
    },
    {
      '<leader>si',
      function()
        Snacks.picker.icons()
      end,
      desc = '[S]earch [I]cons',
    },
    {
      '<leader>sk',
      function()
        Snacks.picker.keymaps()
      end,
      desc = '[S]earch [K]eymaps',
    },
    -- Git
    {
      '<leader>gb',
      function()
        Snacks.picker.git_branches()
      end,
      desc = '[G]it [B]ranches',
    },
    {
      '<leader>gs',
      function()
        Snacks.picker.git_status()
      end,
      desc = '[G]it [S]tatus',
    },
    {
      '<leader>gda',
      function()
        Snacks.picker.git_diff()
      end,
      desc = '[G]it [D]iff [A]ll',
    },
    {
      '<leader>gla',
      function()
        Snacks.picker.git_log()
      end,
      desc = '[G]it [L]og [A]ll',
    },
    {
      '<leader>gll',
      function()
        Snacks.picker.git_log_line()
      end,
      desc = '[G]it [L]og [L]ine',
    },
    {
      '<leader>glf',
      function()
        Snacks.picker.git_log_file()
      end,
      desc = '[G]it [L]og [F]ile',
    },
    -- gh
    {
      '<leader>ghi',
      function()
        Snacks.picker.gh_issue()
      end,
      desc = '[G]it[H]ub [I]ssues (OPEN)',
    },
    {
      '<leader>ghI',
      function()
        Snacks.picker.gh_issue { state = 'all' }
      end,
      desc = '[G]it[H]ub [I]ssues (ALL)',
    },
    {
      '<leader>ghp',
      function()
        Snacks.picker.gh_pr()
      end,
      desc = '[G]it[H]ub [P]ull Requests (OPEN)',
    },
    {
      '<leader>ghP',
      function()
        Snacks.picker.gh_pr { state = 'all' }
      end,
      desc = '[G]it[H]ub [P]ull Requests (ALL)',
    },
    {
      ']]',
      function()
        Snacks.words.jump(vim.v.count1)
      end,
      desc = 'Next Reference',
      mode = { 'n', 't' },
    },
    {
      '[[',
      function()
        Snacks.words.jump(-vim.v.count1)
      end,
      desc = 'Prev Reference',
      mode = { 'n', 't' },
    },
  },

  init = function()
    vim.api.nvim_create_autocmd('User', {
      pattern = 'VeryLazy',
      callback = function()
        -- Setup some globals for debugging (lazy-loaded)
        _G.dd = function(...)
          Snacks.debug.inspect(...)
        end
        _G.bt = function()
          Snacks.debug.backtrace()
        end

        -- Override print to use snacks for `:=` command
        if vim.fn.has 'nvim-0.11' == 1 then
          vim._print = function(_, ...)
            dd(...)
          end
        else
          vim.print = _G.dd
        end

        -- Create some toggle mappings
        Snacks.toggle.option('spell', { name = 'Spelling' }):map '<leader>us'
        Snacks.toggle.option('wrap', { name = 'Wrap' }):map '<leader>uw'
        Snacks.toggle.option('relativenumber', { name = 'Relative Number' }):map '<leader>uL'
        Snacks.toggle.diagnostics():map '<leader>ud'
        Snacks.toggle.line_number():map '<leader>ul'
        Snacks.toggle.option('conceallevel', { off = 0, on = vim.o.conceallevel > 0 and vim.o.conceallevel or 2 }):map '<leader>uc'
        Snacks.toggle.treesitter():map '<leader>uT'
        Snacks.toggle.option('background', { off = 'light', on = 'dark', name = 'Dark Background' }):map '<leader>ub'
        Snacks.toggle.inlay_hints():map '<leader>uh'
        Snacks.toggle.indent():map '<leader>ug'
        Snacks.toggle.dim():map '<leader>uD'
      end,
    })
  end,
}
