local M = {}

function M.epgGetBuildTargets()
    local targets = vim.api.nvim_eval('[]')
    local tmpfile = '/tmp/eaclobr-build-targets'
    local f = io.open(tmpfile, 'r')
    local t = io.type(f)
    if not t then
        print("Generating build targets...")
        os.execute('build -t > ' .. tmpfile)
        f = io.open(tmpfile, 'r')
    end
    if not f then
        return targets
    end
    for line in f:lines() do
        local c = line:find(":")
        if c then
            c = c - 1
        end
        table.insert(targets, line:sub(1, c))
    end
    f:close()
    return targets
end

function M.dispatchEpgTarget()
    local table = vim.api.dict(M.epgGetBuildTargets())
    vim.fn["fzf#run"]({"'source': " .. table .. "',sink': 'Dispatch build -c lin.debug '"})
end

return M
