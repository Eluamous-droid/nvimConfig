vim.keymap.set("n", "<leader>t", [[ <Cmd>lua require("harpoon.mark").add_file()<CR> ]])
vim.keymap.set("n", "<C-e>", [[<Cmd>lua require("harpoon.ui").toggle_quick_menu()<CR>]])

vim.keymap.set("n", "<leader>1", [[ <Cmd>lua require("harpoon.ui").nav_file(1)<CR> ]])
vim.keymap.set("n", "<leader>2", [[ <Cmd>lua require("harpoon.ui").nav_file(2)<CR> ]])
vim.keymap.set("n", "<leader>3", [[ <Cmd>lua require("harpoon.ui").nav_file(3)<CR> ]])
vim.keymap.set("n", "<leader>4", [[ <Cmd>lua require("harpoon.ui").nav_file(4)<CR> ]])
vim.keymap.set("n", "<leader>5", [[ <Cmd>lua require("harpoon.ui").nav_file(5)<CR> ]])
