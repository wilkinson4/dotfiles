vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- install packer if not found
local fn = vim.fn
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
    packer_bootstrap = fn.system({
        'git', 'clone', '--depth', '1',
        'https://github.com/wbthomason/packer.nvim', install_path
    })
end

U = require('util')

-- Install plugins
require('settings')
require('disable')
require('plugins')
require('config')

-- allow loading of device specific configs


if vim.fn.filereadable(vim.fn.expand('$HOME/init.after.vim')) > 0 then

    vim.cmd('source $HOME/init.after.vim')

end
