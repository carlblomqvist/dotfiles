local api = vim.api
local M = {}
function M.TwfExit(path)
  function M.TwfExitClosure(job_id, data, event)
    --vim.cmd('bd!')
    local out, errMsg = pcall(io.open("*a"))
    if not out then
        error("twf error on run" .. errMsg)
        return 0
    end
    vim.cmd('edit! ' .. out[0]) --execute 'edit! ' . out[0]
  end
return M.TwfExitClosure
end

function M.Twf()
  local temp = vim.fn.tempname()
  local cmmd = 'twf "@%" > ' .. temp
  vim.fn.termopen(cmmd, { on_exit = M.TwfExit(temp) })
  vim.cmd('startinsert')
end

--nnoremap <silent> <Space>t :call Twf()<CR>
return M
