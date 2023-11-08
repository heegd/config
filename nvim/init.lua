require("config.options")
if (vim.fn.has("win32") == 1)
then
  require("config.windows")
end
require("config.lazy")
require("config.keymaps")
require("config.autocommands")
