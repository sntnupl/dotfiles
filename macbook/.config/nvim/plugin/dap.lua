local dap_status_ok, dap = pcall(require, "dap")
if not dap_status_ok then
  return
end

local dap_ui_status_ok, dapui = pcall(require, "dapui")
if not dap_ui_status_ok then
  return
end

local dap_install_status_ok, dap_install = pcall(require, "dap-install")
if not dap_install_status_ok then
  return
end

local dap_status_ok, dap_vtext = pcall(require, "nvim-dap-virtual-text")
if not dap_status_ok then
  return
end

dap.adapters.lldb = {
  type = 'executable',
  command = '/opt/homebrew/Cellar/llvm/14.0.6_1/bin/lldb-vscode', -- adjust as needed, must be absolute path
  --command = '/usr/bin/lldb', -- adjust as needed, must be absolute path
  name = 'lldb'
}

dap.configurations.cpp = {
  {
    name = 'Launch',
    type = 'lldb',
    request = 'launch',
    program = function()
      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
    end,
    cwd = '${workspaceFolder}',
    stopOnEntry = false,
    args = {'72', '18'},

    -- 💀
    -- if you change `runInTerminal` to true, you might need to change the yama/ptrace_scope setting:
    --
    --    echo 0 | sudo tee /proc/sys/kernel/yama/ptrace_scope
    --
    -- Otherwise you might get the following error:
    --
    --    Error on launch: Failed to attach to the target process
    --
    -- But you should be aware of the implications:
    -- https://www.kernel.org/doc/html/latest/admin-guide/LSM/Yama.html
    -- runInTerminal = false,
  },
}

dap.configurations.c = dap.configurations.cpp
dap.configurations.rust = dap.configurations.cpp




dap_install.setup {}
dap_vtext.setup()

--dap_install.config("python", {})
-- add other configs here

dapui.setup {
    layouts = {
        {
            elements = {
                'scopes',
                'breakpoints',
                'stacks',
                'watches',
            },
            size = 40,
            position = 'left',
        },
        {
            elements = {
                'repl',
                'console',
            },
            size = 10,
            position = 'bottom',
        },
  },
  --sidebar = {
    --elements = {
      --{
        --id = "scopes",
        --size = 0.25, -- Can be float or integer > 1
      --},
      --{ id = "breakpoints", size = 0.25 },
    --},
    --size = 40,
    --position = "left", -- Can be "left", "right", "top", "bottom"
  --},
  --tray = {
    --elements = {},
  --},
}

--vim.fn.sign_define("DapBreakpoint", { text = "", texthl = "DiagnosticSignError", linehl = "", numhl = "" })

vim.fn.sign_define('DapBreakpoint', {text='🟥', texthl='', linehl='', numhl=''})
vim.fn.sign_define('DapStopped', {text='⭐️', texthl='', linehl='', numhl=''})


dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
end

dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close()
end

dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close()
end


-- Shorten function name
local keymap = vim.keymap.set
-- Silent keymap option
local opts = { silent = true }

keymap("n", "<leader>db", "<cmd>lua require'dap'.toggle_breakpoint()<cr>", opts)
keymap("n", "<S-j>", "<cmd>lua require'dap'.step_into()<cr>", opts)
keymap("n", "<S-k>", "<cmd>lua require'dap'.step_out()<cr>", opts)
keymap("n", "<S-l>", "<cmd>lua require'dap'.step_over()<cr>", opts)
keymap("n", "<leader>dk", "<cmd>lua require'dap'.up()<cr>", opts)
keymap("n", "<leader>dj", "<cmd>lua require'dap'.down()<cr>", opts)
keymap("n", "<leader>dc", "<cmd>lua require'dap'.continue()<cr>", opts)
keymap("n", "<leader>ds", "<cmd>lua require'dap'.stop()<cr>", opts)
keymap("n", "<leader>dr", "<cmd>lua require'dap'.repl.toggle()<cr>", opts)
keymap("n", "<leader>dl", "<cmd>lua require'dap'.run_last()<cr>", opts)
keymap("n", "<leader>du", "<cmd>lua require'dapui'.toggle()<cr>", opts)
keymap("n", "<leader>dt", "<cmd>lua require'dap'.terminate()<cr>", opts)

keymap("n", "<leader>di", "<cmd>lua require'dap.ui.widgets'.hover()<cr>", opts)
keymap("n", "<leader>d?", "<cmd>lua local widgets = require'dap.ui.widgets'; widgets.centered_float(widgets.scopes)<cr>", opts)




