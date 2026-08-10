local set = vim.keymap.set

-- Remove any delay for space as leader key
set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Remove the default s binding in favor of surround mappings (sa, sr, sd)
set({ 'n', 'x' }, 's', '<Nop>', { silent = true })

-- Remove the default gl binding to allow LSP gl* mappings
set({ 'n', 'x' }, 'gl', '<Nop>', { silent = true })

-- j and k will move to the character visually below the cursor, to deal with line wrap
-- don't use this behavior if there is a count so that relative line numbering is true
set({ 'n', 'x' }, 'j', "v:count == 0 ? 'gj' : 'j'", { desc = 'Down', expr = true, silent = true })
set({ 'n', 'x' }, 'k', "v:count == 0 ? 'gk' : 'k'", { desc = 'Up', expr = true, silent = true })

-- Have Esc clear highlighted search
set('n', '<Esc>', '<cmd>nohlsearch<cr>')

-- toggle folds with tab while retaining C-i for jumplist
set('n', '<C-i>', '<C-i>', { silent = true, noremap = true })
set('n', '<Tab>', 'za', { silent = true, noremap = true })

-- Keep highlight when indenting block
set('v', '<', '<gv', { noremap = true })
set('v', '>', '>gv', { noremap = true })

-- Center the cursor after these operations
set({ 'n', 'x', 'o' }, 'n', 'nzz')
set({ 'n', 'x', 'o' }, 'N', 'Nzz')
set({ 'n', 'x' }, 'G', 'Gzz')

set({ 'n', 'x' }, '<leader>r', '<cmd>restart<cr>', { desc = 'Restart' })

set({ 'n', 'x' }, '[t', 'gT', { desc = 'Previous tab' })
set({ 'n', 'x' }, ']t', 'gt', { desc = 'Next tab' })

-- undo using U
set({ 'n', 'x' }, 'U', '<C-r>', { noremap = true })

-- readline style bindings for insert and command mode
set('!', '<C-a>', '<Home>')
set('!', '<C-e>', '<End>')
set('!', '<C-d>', '<Delete>')
set('!', '<C-f>', '<Right>')
set('!', '<C-b>', '<Left>')

-- save
set('n', '<C-s>', '<cmd>update<cr>')
