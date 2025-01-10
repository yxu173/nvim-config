local wk = require("which-key")

-- Move selected lines with shift+j or shift+k
--luavim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
--vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Join line while keeping the cursor in the same position
--vim.keymap.set("n", "J", "mzJ`z")

-- Keep cursor centred while scrolling up and down
--vim.keymap.set("n", "<C-d>", "<C-d>zz")
--vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- Next and previous instance of the highlighted letter
--vim.keymap.set("n", "n", "nzzzv")
--vim.keymap.set("n", "N", "Nzzzv")

-- Better paste (prevents new paste buffer)
vim.keymap.set("x", "<leader>p", [["_dP]])

-- Copy to system clipboard
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]], { desc = "Yank to System Clipboard" })
vim.keymap.set("n", "<leader>Y", [["+Y]], { desc = "Yank Line to System Clipboard" })

-- Delete to void register
vim.keymap.set({ "n", "v" }, "<leader>dd", [["_d]], { desc = "Delete to Void Register" })

-- Fixed ctrl+c weirdness to exit from vertical select mode
vim.keymap.set("i", "<C-c>", "<Esc>")

-- Delete shift+q keymap
vim.keymap.set("n", "Q", "<nop>")

-- Quickfix navigation
--vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz", { desc = "Next Quickfix Item" })
--vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz", { desc = "Previous Quickfix Item" })
--vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz", { desc = "Next Location List Item" })
--vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz", { desc = "Previous Location List Item" })

-- Search and replace current word
vim.keymap.set("n", "<leader>sr", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { desc = "Search and Replace Word" })

-- Make file executable
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true, desc = "Make File Executable" })

-- Undotree
--vim.keymap.set("n", "<leader>uu", vim.cmd.UndotreeToggle, { desc = "Toggle Undotree" })

-- Oil
vim.keymap.set("n", "<leader>e", "<cmd>lua require('oil').toggle_float()<CR>", { desc = "Toggle Oil" })

-- Twilight
vim.keymap.set("n", "<leader>tt", "<cmd>Twilight<CR>", { desc = "Toggle Twilight" })

-- Zen mode
vim.keymap.set("n", "<leader>z", "<cmd>ZenMode<CR>", { desc = "Toggle Zen Mode" })

-- Harpoon
local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

vim.keymap.set("n", "<leader>ha", mark.add_file, { desc = "Harpoon Add File" })
vim.keymap.set("n", "<leader>he", ui.toggle_quick_menu, { desc = "Harpoon Toggle Menu" })

vim.keymap.set("n", "<leader>h1", function()
  ui.nav_file(1)
end, { desc = "Harpoon Nav to File 1" })
vim.keymap.set("n", "<leader>h2", function()
  ui.nav_file(2)
end, { desc = "Harpoon Nav to File 2" })
vim.keymap.set("n", "<leader>h3", function()
  ui.nav_file(3)
end, { desc = "Harpoon Nav to File 3" })
vim.keymap.set("n", "<leader>h4", function()
  ui.nav_file(4)
end, { desc = "Harpoon Nav to File 4" })

-- Tmux window switching from Neovim
vim.keymap.set("n", "<C-h>", "<cmd> TmuxNavigateLeft<CR>", { desc = "Tmux Navigate Left" })
vim.keymap.set("n", "<C-l>", "<cmd> TmuxNavigateRight<CR>", { desc = "Tmux Navigate Right" })
vim.keymap.set("n", "<C-j>", "<cmd> TmuxNavigateDown<CR>", { desc = "Tmux Navigate Down" })
vim.keymap.set("n", "<C-k>", "<cmd> TmuxNavigateUp<CR>", { desc = "Tmux Navigate Up" })


-- CopilotChat keybindings

vim.keymap.set("n", "<leader>md", "<cmd>CopilotChatFixDiagnostic<CR>", { desc = "CopilotChat Fix Diagnostic" })
vim.keymap.set("n", "<leader>mc", "<cmd>CopilotChatToggle<CR>", { desc = "CopilotChat" })
vim.keymap.set("n", "<leader>mx", "<cmd>CopilotChatExplain<CR>", { desc = "CopilotChat - Explain code" })
vim.keymap.set("n", "<leader>mt", "<cmd>CopilotChatTests<CR>", { desc = "CopilotChat - Generate tests" })
vim.keymap.set("n", "<leader>ms", "<cmd>CopilotChatSummarize<CR>", { desc = "CopilotChat - Summarize text" })
vim.keymap.set("n", "<leader>msp", "<cmd>CopilotChatSpelling<CR>", { desc = "CopilotChat - Spelling" })
vim.keymap.set("n", "<leader>mw", "<cmd>CopilotChatWording<CR>", { desc = "CopilotChat - Wording" })
vim.keymap.set("n", "<leader>mbn", "<cmd>CopilotChatBetterNamings<CR>", { desc = "CopilotChat - Better Namings" })
vim.keymap.set("n", "<leader>md", "<cmd>CopilotChatDocumentation<CR>", { desc = "CopilotChat - Documentation" })
vim.keymap.set("n", "<leader>msw", "<cmd>CopilotChatSwaggerApiDocs<CR>", { desc = "CopilotChat - Swagger API Docs" })
vim.keymap.set("n", "<leader>mr", "<cmd>CopilotChatRefactor<CR>", { desc = "CopilotChat - Refactor" })
vim.keymap.set("n", "<leader>mf", "<cmd>CopilotChatFixCode<CR>", { desc = "CopilotChat - Fix Code" })
vim.keymap.set("n", "<leader>me", "<cmd>CopilotChatFixError<CR>", { desc = "CopilotChat - Fix Error" })



-- Neovim Pet
vim.keymap.set("n", "<leader>;h", function()
  require("duck").hatch("🐿️", 2)
end, { desc = "Hatch Duck" })

vim.keymap.set("n", "<leader>;c", function()
  require("duck").cook()
end, { desc = "Cook Duck" })

-- Register keybindings with which-key
wk.register({
  ["<leader>"] = {
    b = { name = "+buffer" },
    c = { name = "+code" },
    f = { name = "+file/find" },
    g = { name = "+git" },
    h = { name = "+harpoon" },
    q = { name = "+quit/session" },
    s = { name = "+search" },
    t = { name = "+Twilight" },
    u = { name = "+ui" },
    w = { name = "+windows" },
    m = { name = "CopilotChat" },
   -- x = { name = "+diagnostics/quickfix" },
    z = { name = "+zen" },
  },
  g = { name = "+goto" },
  ["["] = { name = "+prev" },
  ["]"] = { name = "+next" },
}, { mode = { "n", "v" } })
