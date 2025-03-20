local wk = require("which-key")

wk.add({
    { "<leader>l", group = "Litee Calltree" },
    { "<leader>lC", "<cmd>LTCollapseAllCalltree<cr>", desc = "Collapse All" },
    { "<leader>lI", "<cmd>lua require('litee.lib.lsp.wrappers').buf_incoming_calls()<cr>", desc = "LSP Incoming Calls" },
    { "<leader>lJ", "<cmd>LTJumpCalltreeSplit<cr>", desc = "Jump in Split" },
    { "<leader>lO", "<cmd>lua require('litee.lib.lsp.wrappers').buf_outgoing_calls()<cr>", desc = "LSP Outgoing Calls" },
    { "<leader>lT", "<cmd>LTJumpCalltreeTab<cr>", desc = "Jump in Tab" },
    { "<leader>lc", "<cmd>LTCollapseCalltree<cr>", desc = "Collapse Call" },
    { "<leader>ld", "<cmd>LTDetailsCalltree<cr>", desc = "Show Call Details" },
    { "<leader>le", "<cmd>LTExpandCalltree<cr>", desc = "Expand Call" },
    { "<leader>lf", "<cmd>LTFocusCalltree<cr>", desc = "Focus Calltree" },
    { "<leader>lh", "<cmd>LTHoverCalltree<cr>", desc = "Hover Details" },
    { "<leader>lj", "<cmd>LTJumpCalltree<cr>", desc = "Jump to Call" },
    { "<leader>lo", "<cmd>LTOpenToCalltree<cr>", desc = "Open Calltree" },
    { "<leader>ls", "<cmd>LTSwitchCalltree<cr>", desc = "Switch Calltree" },
    { "<leader>lt", "<cmd>LTPanel<cr>", desc = "Toggle Panel" },
    { "<leader>lv", "<cmd>LTJumpCalltreeVSplit<cr>", desc = "Jump in Vertical Split" },
    { "<leader>lx", "<cmd>LTCloseCalltree<cr>", desc = "Close Calltree" },
    { "[l", "<cmd>LTPrevCalltree<cr>", desc = "Previous Call in Tree" },
    { "]l", "<cmd>LTNextCalltree<cr>", desc = "Next Call in Tree" },
})

