local builtin = require('telescope.builtin')

-- Keybindings
vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
vim.keymap.set('n', '<C-p>gf', builtin.git_files, {})
vim.keymap.set('n', '<leader>ps', function()
    builtin.grep_string({ search = vim.fn.input("Grep > ") });
end)
vim.keymap.set('n', '<leader>pb', builtin.buffers, {})
vim.keymap.set('n', '<leader>ph', builtin.help_tags, {})

local actions = require('telescope.actions')

require('telescope').setup {
    defaults = {
        path_displays = { 'smart' },
        mappings = {
            i = {
                ["<C-k>"] = actions.preview_scrolling_up,
                ["<C-j>"] = actions.preview_scrolling_down,
                ["<esc>"] = actions.close
            }
        }
    },
}
