local api = vim.api
local M = {}
function M.makeScratch()
	api.nvim_command('enew') -- equivalent to :enew
	vim.bo[0].buftype='nofile' -- set the current buffer's (buffer 0) buftype to nofile
  	vim.bo[0].bufhidden='hide'
  	vim.bo[0].swapfile=false
end

function M.removeTrailingWhitespace()
    local view = vim.fn.winsaveview()
    vim.cmd('keeppatterns %s/\\s\\+$//e')
    vim.fn.winrestview(view)
end

--function M.reloadconfig = function()
--    local luacache = (_G.__luacache or {}).cache
--    -- TODO: unload commands, mappint + ? symbols?
--    for pkg, _ in pairs(package.loaded) do
--        if pkg:match '^my_.+' then
--            print(pkg)
--            package.loaded[pkg] = nil
--            if luacache then
--                luacache[pkg] = nil
--            end
--        end
--    end
--    dofile(vim.env.MYVIMRC)
--    vim.notify('Config reloaded!', vim.log.levels.INFO)
--end

return M
