local status, actions = pcall(require, "telescope.actions")
if (not status) then
  return
end

local Gmap = vim.keymap

--local actions = require('telescope.actions')
-- Global remapping
------------------------------
require("telescope").setup {
  defaults = {
    vimgrep_arguments = {
      "rg",
      "-L",
      "--color=never",
      "--no-heading",
      "--with-filename",
      "--line-number",
      "--column",
      "--smart-case",
    },
    prompt_prefix = "   ", --   
    selection_caret = "> ",
    entry_prefix = "  ",
    initial_mode = "insert",
    selection_strategy = "reset",
    sorting_strategy = "ascending",
    layout_strategy = "horizontal",
    layout_config = {
      horizontal = {
        prompt_position = "top",
        preview_width = 0.55,
        results_width = 0.8,
      },
      vertical = {
        mirror = false,
      },
      width = 0.60,
      height = 0.75,
      preview_cutoff = 120,
    },
    file_sorter = require("telescope.sorters").get_fuzzy_file,
    file_ignore_patterns = { "node_modules" },
    generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter,
    path_display = { "truncate" },
    winblend = 0,
    border = {},
    borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
    color_devicons = true,
    set_env = { ["COLORTERM"] = "truecolor" }, -- default = nil,
    file_previewer = require("telescope.previewers").vim_buffer_cat.new,
    grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
    qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
    -- Developer configurations: Not meant for general override
    buffer_previewer_maker = require("telescope.previewers").buffer_previewer_maker,
    mappings = {
      n = {
          ["q"] = actions.close,
          ["l"] = actions.file_edit,
      },
      i = {
          ["<C-l>"] = false,
      },
    },
  },
  pickers = {
        find_files = {
            hidden = true
        }
    },
  extensions = {
    fzf = {
      fuzzy = true, -- false will only do exact matching
      override_generic_sorter = true, -- override the generic sorter
      override_file_sorter = true, -- override the file sorter
      case_mode = "smart_case" -- or "ignore_case" or "respect_case"
      -- the default case_mode is "smart_case"
    }
  }
}


    -- FZF
Gmap.set( 'n', 'sf',           ':lua require(\'telescope.builtin\').find_files({cwd = \'~/.config\',layout_strategy=\'center\',layout_config={width=0.4, height=0.6}})<CR>',     { noremap = true } )
Gmap.set( 'n', 'sl',           ':lua require(\'telescope.builtin\').find_files({layout_strategy=\'center\',layout_config={width=0.4, height=0.6}})<CR>',     { noremap = true } )
Gmap.set( 'n', 'sb',           ':Telescope buffers<CR>',     { noremap = true } )
Gmap.set( 'n', 'sm',           ':lua require(\'telescope.builtin\').builtin({layout_strategy=\'center\',layout_config={width=0.3, height=0.4}})<CR>',     { noremap = true } )
Gmap.set( 'n', '<leader>fh',           ':Telescope help_tags<CR>',     { noremap = true } )
Gmap.set( 'n', '<leader>fw',           ':Telescope live_grep<CR>',     { noremap = true } )
Gmap.set( 'n', '<leader>fo',           ':Telescope oldfiles<CR>',     { noremap = true } )
Gmap.set( 'n', '<leader>l',           ':Telescope lsp_document_symbols<CR>',     { noremap = true } )
Gmap.set( 'n', '<leader>/',           ':Telescope current_buffer_fuzzy_find<CR>',     { noremap = true } )


require("telescope").load_extension("fzf")

