-- Read the docs: https://www.lunarvim.org/docs/configuration
-- Video Tutorials: https://www.youtube.com/watch?v=sFA9kX-Ud_c&list=PLhoH5vyxr6QqGu0i7tt_XoVK9v-KvZ3m6
-- Forum: https://www.reddit.com/r/lunarvim/
-- Discord: https://discord.com/invite/Xb9B4Ny
--
--
vim.opt.relativenumber = true
vim.opt.conceallevel = 2
vim.opt.number = true
vim.opt.textwidth = 0 vim.opt.wrapmargin = 0 vim.opt.wrap = true
vim.opt.linebreak = true

lvim.plugins = {
  "epwalsh/obsidian.nvim",
  version = "*",  -- recommended, use latest release instead of latest commit
  lazy = true,
  ft = "markdown",
  -- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
  -- event = {
  --   -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
  --   -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/**.md"
  --   "BufReadPre path/to/my-vault/**.md",
  --   "BufNewFile path/to/my-vault/**.md",
  -- },
  dependencies = {
    -- Required.
    "nvim-lua/plenary.nvim",

    -- see below for full list of optional dependencies 👇
  },
  opts = {
    workspaces = {
      {
        name = "personal",
        path = "~/Obsidian/",
      },
    },

    completion = {
      nvim_cmp = true,
      min_chars = 1,
    },

    daily_notes = {
      folder = "Journal/Daily",
      date_format = "%Y-%m-%d",
      alias_format = "%B %-d, %Y",
    },
    note_id_func = function(title)
      -- Create note IDs in a Zettelkasten format with a timestamp and a suffix.
      -- In this case a note with the title 'My new note' will be given an ID that looks
      -- like '1657296016-my-new-note', and therefore the file name '1657296016-my-new-note.md'
      local suffix = ""
      if title ~= nil then
        -- If title is given, transform it into valid file name.
        suffix = title:gsub(" ", "-"):gsub("[^A-Za-z0-9-]", ""):lower()
      else
        -- If title is nil, just add 4 random uppercase letters to the suffix.
        for _ = 1, 4 do
          suffix = suffix .. string.char(math.random(65, 90))
        end
      end
      return tostring(os.time()) .. "-" .. suffix
    end,

    templates = {
      subdir = "Templates",
      date_format = "%Y-%m-%d",
      time_format = "%H:%M",
      -- A map for custom variables, the key should be the variable and the value a function
    },
  },
}

lvim.builtin.which_key.mappings["o"] = {
  name = "Obsidian",
  td = { "<cmd>ObsidianToday<cr>", "Open Daily Note" },
  tp = { "<cmd>ObsidianTemplate<cr>", "Add Template" },
  tg = { "<cmd>ObsidianTags<cr>", "Get Tags" },
  n = { "<cmd>ObsidianNew<cr>", "Add New Note" },
  va = { "<cmd>ObsidianFollowLink vsplit<cr>", "Add on vsplit" },
  s = { "<cmd>ObsidianSearch<cr>", "Search On Vault" },
  -- n = { "<cmd>Obsidian<cr>", "" },
  -- n = { "<cmd>Obsidian<cr>", "" },
  -- n = { "<cmd>Obsidian<cr>", "" },
  -- n = { "<cmd>Obsidian<cr>", "" },
  -- n = { "<cmd>Obsidian<cr>", "" },

}
