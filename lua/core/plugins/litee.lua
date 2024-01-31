

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
    vim.api.nvim_set_keymap("n", "<C-t>t",  ":LTPanel<cr>", { silent = true })
   -- 
   -- 
   -- calltree specific commands
   vim.api.nvim_set_keymap("n", "<C-h>o",     ":LTOpenToCalltree<cr>", { silent = true })
   vim.api.nvim_set_keymap("n", "<C-h>n",     ":LTNextCalltree<cr>", { silent = true })
   vim.api.nvim_set_keymap("n", "<C-h>p",     ":LTPrevCalltree<cr>", { silent = true })
   vim.api.nvim_set_keymap("n", "<C-h>e",     ":LTExpandCalltree<cr>", { silent = true })
   vim.api.nvim_set_keymap("n", "<C-h>c",     ":LTCollapseCalltree<cr>", { silent = true })
   vim.api.nvim_set_keymap("n", "<C-h>C",     ":LTCollapseAllCalltree<cr>", { silent = true })
   vim.api.nvim_set_keymap("n", "<C-h>f",     ":LTFocusCalltree<cr>", { silent = true })
   vim.api.nvim_set_keymap("n", "<C-h>S",     ":LTSwitchCalltree<cr>", { silent = true })
   vim.api.nvim_set_keymap("n", "<C-h>j",     ":LTJumpCalltree<cr>", { silent = true })
   vim.api.nvim_set_keymap("n", "<C-h>s",     ":LTJumpCalltreeSplit<cr>", { silent = true })
   vim.api.nvim_set_keymap("n", "<C-h>v",     ":LTJumpCalltreeVSplit<cr>", { silent = true })
   vim.api.nvim_set_keymap("n", "<C-h>t",     ":LTJumpCalltreeTab<cr>", { silent = true })
   vim.api.nvim_set_keymap("n", "<C-h>h",     ":LTHoverCalltree<cr>", { silent = true })
   vim.api.nvim_set_keymap("n", "<C-h>d",     ":LTDetailsCalltree<cr>", { silent = true })
   vim.api.nvim_set_keymap("n", "<C-h>x",     ":LTCloseCalltree<cr>", { silent = true })
   -- 
   vim.api.nvim_set_keymap("n", "<C-k>o", "<cmd>lua require('litee.lib.lsp.wrappers').buf_outgoing_calls()<CR>", { silent = true })
   vim.api.nvim_set_keymap("n", "<C-k>i", "<cmd>lua require('litee.lib.lsp.wrappers').buf_incoming_calls()<CR>", { silent = true })
