vim.cmd([[
set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vimrc
let g:clipboard = {
    \   'name': 'tmux-clip',
    \   'copy': {
    \      '+': ['tmux', 'load-buffer', '-'],
    \      '*': ['tmux', 'load-buffer', '-'],
    \    },
    \   'paste': {
    \      '+': ['tmux', 'save-buffer', '-'],
    \      '*': ['tmux', 'save-buffer', '-'],
    \   },
    \   'cache_enabled': 1,
    \ }
]])

require('remap')
require('config')

-- Format diagnostic -------------------------------------------
local function fmt(diagnostic)
    if diagnostic.code then
        return ("[%s] %s"):format(diagnostic.code, diagnostic.message)
    end
    return diagnostic.message
end
vim.diagnostic.config {
    virtual_text = {source = "always", format = fmt},
    float = {source = "always", format = fmt},
}

-- Configure LSPs ----------------------------------------------
require('lspconfig').ruff_lsp.setup {
    init_options = {
        settings = {
            args = {
                "--select", "ALL",
                "--ignore", "ANN,ARG,B,B018,C901,COM812,D,D100,DTZ,E501,E741,"
                    .. "EM101,ERA001,FBT,FIX,I001,N,PERF,PIE790,PLR,PT,PTH123,"
                    .. "Q,RET,RET502,RET503,RSE102,RUF005,RUF012,S,"
                    .. "SIM102,SIM108,SIM114,SLF001,T201,TD,TID252,"
                    .. "TRY002,TRY003,TRY300,TRY400,UP031"
            }
        }
    }
}
--require('lspconfig').ruff.setup {
--    on_attach = function(client, bufnr)
--        if client.name == 'ruff' then
--            -- Disable hover in favor of Pyright
--            client.server_capabilities.hoverProvider = false
--        end
--    end
--}
