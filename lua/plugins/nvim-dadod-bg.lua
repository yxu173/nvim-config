return {
    'napisani/nvim-dadbod-bg',
    build = './install.sh',
    config = function()
        vim.cmd([[
            let g:nvim_dadbod_bg_port = '4546'
            let g:nvim_dadbod_bg_log_file = '/tmp/nvim-dadbod-bg.log'
        ]])
    end
}
