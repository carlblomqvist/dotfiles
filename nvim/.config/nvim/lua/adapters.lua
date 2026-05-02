local dap = require('dap')
local user = os.getenv("USER")
Current_testcase = ""

SetTC = function()
local pickers = require "telescope.pickers"
local finders = require "telescope.finders"
local conf = require("telescope.config").values
local actions = require "telescope.actions"
local action_state = require "telescope.actions.state"
Retval = "654654"
local colors = function(opts)
    opts = opts or {}
    pickers.new(opts, {
        prompt_title = "colors",
        finder = finders.new_table {
            results = { "red", "green", "blue" }
        },
        sorter = conf.generic_sorter(opts),
        attach_mappings = function(prompt_bufnr, map)
            actions.select_default:replace(function()
                actions.close(prompt_bufnr)
                local selection = action_state.get_selected_entry()
                print(vim.inspect(selection))
                Current_testcase = selection[1]
            end)
            return true
        end,
    }):find()
end

-- to execute the function
colors(require("telescope.themes").get_dropdown{})
end

vim.keymap.set('n', '<Leader>i', function() SetTC() end)


dap.adapters.cppdbg = {
    id = 'cppdbg',
    type = 'executable',
    command = '/home/' .. user .. '/bin/cpptools-linux/extension/debugAdapters/bin/OpenDebugAD7',
    options = {
        initialize_timeout_sec = 60,
    }
}

dap.configurations.c = {
    {
        name = "SFT case (EPG)",
        type = "cppdbg",
        request = "launch",
        program = "/workspace/git/" .. user .. "/epg_pcg/build/Linux_x86_64.debug/bin/up-lep-basic_UPSFTSUITE/up-lep-basic_UPSFTSUITE_Linux_x86_64.debug.elf",
        args = Current_testcase,
        stopAtEntry = false,
        cwd = "${workspaceFolder}",
        sourceFileMap = {["./3pp"] = "/workspace/git/" .. user .. "/epg_pcg/3pp"},
        environment = {},
        MIMode = 'gdb',
        miDebuggerPath = "/proj/epg-tools/gdb/10.2/bin/gdb",
        setupCommands = {
            {
                text = '-enable-pretty-printing',
                text = '-gdb-set follow-fork-mode parent',
                description =  'enable pretty printing',
                -- ignoreFailures = false
            },
        },
    },
    {
        name = "SFT case (PCG)",
        type = "cppdbg",
        request = "launch",
        program = "/workspace/git/" .. user .. "/epg/up/build/bin/data-plane_upf_large_flow_shaping_tcp_with_cd_UPSFTSUITE/data-plane_upf_large_flow_shaping_tcp_with_cd_UPSFTSUITE",
        args = {"TC41256"},
        stopAtEntry = true,
        cwd = "${workspaceFolder}",
        sourceFileMap = {["./build/./"] = "/workspace/git/" .. user .. "/epg/up"},
        environment = {
            {
                name = "WS_ROOT",
                value = "/workspace/git/" .. user .. "/epg/"
            },
        },
        pipeTransport = {
            debuggerPath = "/usr/bin/gdb",
            pipeProgram = "docker",
            pipeArgs = {
                "run",
                "-i", "--init", "--user", "7396543:64000", "--cap-add=SYS_PTRACE", "--security-opt", "seccomp=unconfined",
                "--volume", "/workspace/git/" .. user .. "/epg:/workspace/git/eongagb/epg", "--workdir", "/workspace/git/eongagb/epg/up/build",
                "selndocker.mo.sw.ericsson.se/proj-pc-epg/cppbuilder:1.49.1-0", "sh", "-c",
            },
            pipeCwd = "${workspaceFolder}",
        },
        MIMode = 'gdb',
        setupCommands = {
            {
                text = '-enable-pretty-printing',
                text = '-gdb-set follow-fork-mode parent',
                description =  'enable pretty printing',
                ignoreFailures = false
            },
        },
    },
    {
        name = "SFT case (LEP)",
        type = "cppdbg",
        request = "launch",
        program = "/workspace/git/" .. user .. "/l2tp-endpoint/build/bin/up-lep-basic_UPSFTSUITE/up-lep-basic_UPSFTSUITE",
        -- args = {"TC47521"}, -- main_flow_basic
        args = {"TC48026"}, -- main_flow_lep_l2tp_icrq_retransmission_timer
        -- args = {"TC48089"}, -- main_flow_l2tp_hello_timer_test
        -- args = {"TC48083"}, -- main_flow_l2tp_tunnel_establishment_timer_test
        stopAtEntry = true,
        cwd = "${workspaceFolder}",
        sourceFileMap = {["./"] = "/workspace/git/" .. user .. "/l2tp-endpoint"},
        environment = {
            {
                name = "WS_ROOT",
                value = "/workspace/git/" .. user .. "/l2tp-endpoint/"
            },
        },
        pipeTransport = {
            debuggerPath = "/usr/bin/gdb",
            pipeProgram = "docker",
            pipeArgs = {
                "run",
                "-i",
                "--init",
                "--rm",
                "--env",
                "TERM=screen-256color",
                "--env",
                "USER=" .. user .. "",
                "--volume",
                "/workspace/git/" .. user .. "/l2tp-endpoint/.git:/workspace/git/eongagb/l2tp-endpoint/.git:ro",
                "--volume",
                "/workspace/git/" .. user .. "/l2tp-endpoint:/workspace/git/eongagb/l2tp-endpoint:rw",
                "--network",
                "none",
                "--hostname",
                "localhost",
                "--env",
                "CC=gcc-13.2.0",
                "--env",
                "CXX=g++-13.2.0",
                "--env",
                "CCACHE=/usr/local/bin/ccache",
                "--env",
                "CCACHE_DIR=/workspace/git/" .. user .. "/l2tp-endpoint/build/ccache",
                "--env",
                "BUNDLE_PKG_DIR=/workspace/git/" .. user .. "/l2tp-endpoint/staging/packages",
                "--volume",
                "/workspace/git/" .. user .. "/l2tp-endpoint/staging/packages:/workspace/git/eongagb/l2tp-endpoint/staging/packages",
                "--env",
                "TPP_STAGING='/workspace/git/" .. user .. "/l2tp-endpoint/staging'",
                "--cap-add",
                "SYS_PTRACE",
                "--env",
                "ASAN_OPTIONS='dump_instruction_bytes=1:fast_unwind_on_fatal=1:detect_leaks=1'",
                "--env",
                "LLVM_PROFILE_FILE='profraw/profraw.%m'",
                "--env",
                "LSAN_OPTIONS=",
                "--env",
                "UBSAN_OPTIONS=dump_instruction_bytes=1:fast_unwind_on_fatal=1:halt_on_error=1:print_stacktrace=1",
                "--workdir",
                "/workspace/git/" .. user .. "/l2tp-endpoint",
                "--user",
                "7236411:64000",
                "serodocker.sero.gic.ericsson.se/proj-pc-drop/eric-pc-cpp-builder:1.11.0-8",
                "bash",
                "-ec",
            },
            pipeCwd = "${workspaceFolder}",
        },
        MIMode = 'gdb',
        setupCommands = {
            {
                text = '-enable-pretty-printing',
                text = '-gdb-set follow-fork-mode parent',
                description =  'enable pretty printing',
                ignoreFailures = false
            },
        },
    },
    {
        name = "LEP ct (EPG)",
        type = "cppdbg",
        request = "launch",
        program = "/workspace/git/" .. user .. "/epg/build/Linux_x86_64/bin/up-lep-ct_Linux_x86_64.elf",
        args = {
            "--http-address", "127.0.0.1",
            "--http-port", "56000",
        },
        stopAtEntry = true,
        cwd = "${workspaceFolder}",
        sourceFileMap = {["./3pp"] = "/workspace/git/" .. user .. "/epg/3pp"},
        environment = {},
        MIMode = 'gdb',
        setupCommands = {
            {
                text = '-enable-pretty-printing',
                text = '-gdb-set follow-fork-mode parent',
                description =  'enable pretty printing',
                -- ignoreFailures = false
            },
        },
    },
    {
        name = "DP ct (EPG)",
        type = "cppdbg",
        request = "launch",
        program = "/workspace/git/" .. user .. "/epg/build/Linux_x86_64/bin/up-lep-ct-dp_Linux_x86_64.elf",
        args = {},
        stopAtEntry = true,
        cwd = "${workspaceFolder}",
        sourceFileMap = {["./3pp"] = "/workspace/git/" .. user .. "/epg/3pp"},
        environment = {},
        MIMode = 'gdb',
        setupCommands = {
            {
                text = '-enable-pretty-printing',
                text = '-gdb-set follow-fork-mode parent',
                description =  'enable pretty printing',
                -- ignoreFailures = false
            },
        },
    },
}

