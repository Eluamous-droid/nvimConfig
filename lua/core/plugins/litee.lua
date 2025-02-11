

 require('litee.lib').setup{
        tree = {
            icon_set = "codicons"
        },
        panel = {
            orientation = "bottom",
            panel_size  = 10
        }
    }
    require('litee.calltree').setup{
        icon_set = "codicons",
    }
  vim.api.nvim_set_keymap("n", "<C-t>",   ":LTPanel<cr>", { silent = true })
  -- 
  -- 
  -- calltree specific commands
  vim.api.nvim_set_keymap("n", "<F3>",     ":LTOpenToCalltree<cr>", { silent = true })
  vim.api.nvim_set_keymap("n", "<F9>",     ":LTNextCalltree<cr>", { silent = true })
  vim.api.nvim_set_keymap("n", "<F10>",     ":LTPrevCalltree<cr>", { silent = true })
  vim.api.nvim_set_keymap("n", "<F33>",     ":LTExpandCalltree<cr>", { silent = true })
  vim.api.nvim_set_keymap("n", "<F34>",     ":LTCollapseCalltree<cr>", { silent = true })
  vim.api.nvim_set_keymap("n", "<F5>",     ":LTCollapseAllCalltree<cr>", { silent = true })
  vim.api.nvim_set_keymap("n", "<C-c>f",     ":LTFocusCalltree<cr>", { silent = true })
  vim.api.nvim_set_keymap("n", "<C-c>S",     ":LTSwitchCalltree<cr>", { silent = true })
  vim.api.nvim_set_keymap("n", "<F8>",     ":LTJumpCalltree<cr>", { silent = true })
  vim.api.nvim_set_keymap("n", "<C-c>s",     ":LTJumpCalltreeSplit<cr>", { silent = true })
  vim.api.nvim_set_keymap("n", "<C-c>v",     ":LTJumpCalltreeVSplit<cr>", { silent = true })
  vim.api.nvim_set_keymap("n", "<C-c>t",     ":LTJumpCalltreeTab<cr>", { silent = true })
  vim.api.nvim_set_keymap("n", "<C-c>h",     ":LTHoverCalltree<cr>", { silent = true })
  vim.api.nvim_set_keymap("n", "<C-c>d",     ":LTDetailsCalltree<cr>", { silent = true })
  vim.api.nvim_set_keymap("n", "<F4>",     ":LTCloseCalltree<cr>", { silent = true })
  -- 
  vim.api.nvim_set_keymap("n", "<F2>", "<cmd>lua require('litee.lib.lsp.wrappers').buf_outgoing_calls()<CR>", { silent = true })
  vim.api.nvim_set_keymap("n", "<F1>", "<cmd>lua require('litee.lib.lsp.wrappers').buf_incoming_calls()<CR>", { silent = true })
