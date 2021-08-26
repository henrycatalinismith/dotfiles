local M = {}

M.git_bcommits = function()
 require("telescope.builtin").git_bcommits({
  prompt_prefix = " 💾 ",
 })
end

M.git_files = function()
 require("telescope.builtin").git_files({
  prompt_prefix = " 🗂 ",
 })
end

M.live_grep = function()
 require("telescope.builtin").live_grep({
  prompt_prefix = " 🔍 ",
 })
end

return M
