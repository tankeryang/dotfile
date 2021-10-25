" nerdtree.vim
" 自动开启
" autocmd vimenter * NERDTree
" F2 开启/关闭 nerdtree
" map <F2> :NERDTreeToggle<CR>
" 当NERDTree为剩下的唯一窗口时自动关闭
" autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" nerdtree 宽度
" let g:NERDTreeWinSize = 35


" nerdtree.git
" 是否显示忽略文件 1- 显示 0- 不显示 默认 0
let g:NERDTreeGitStatusShowIgnored = 1
let g:NERDTreeGitStatusUseNerdFonts = 1
let g:NERDTreeGitStatusIndicatorMapCustom = {
                \ 'Modified'  :'✹',
                \ 'Staged'    :'✚',
                \ 'Untracked' :'✭',
                \ 'Renamed'   :'➜',
                \ 'Unmerged'  :'═',
                \ 'Deleted'   :'✖',
                \ 'Dirty'     :'✗',
                \ 'Ignored'   :'☒',
                \ 'Clean'     :'✔︎',
                \ 'Unknown'   :'?',
                \ }