runtime! debian.vim
" 开启语法高亮"
if has("syntax")
  syntax on
endif

call plug#begin('~/.config/nvim/plugged')
Plug 'mrtazz/DoxygenToolkit.vim'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'zchee/deoplete-clang'
Plug 'zchee/deoplete-jedi'
Plug 'sebastianmarkow/deoplete-rust'
Plug 'w0rp/ale'
Plug 'morhetz/gruvbox'
Plug 'junegunn/vim-easy-align'
Plug 'rust-lang/rust.vim'

"Plug 'godlygeek/tabular'
call plug#end()

let g:deoplete#enable_at_startup = 1
let g:deoplete#sources#clang#libclang_path = '/usr/lib64/libclang.so'
let g:deoplete#sources#clang#clang_header = '/usr/include'

let g:ale_sign_error = 'x'
let g:ale_sign_warning = '-'
let g:ale_c_build_dir_names = [getcwd(), 'build', 'bin']
let g:ale_linters = {
            \ 'c' : ['clangcheck'],
            \ 'cpp' : ['clangcheck'],
            \}

set termguicolors
set background=dark
colorscheme gruvbox
map <F12> :NextColorScheme<CR>

" nvim 终端模拟器快进键
if has('nvim')
    " 不用<ESC> 键是因为要在终端里面调用vi/vim
    tnoremap <ESC>  <C-\><C-n>
    tnoremap <c-q>  <ESC>
    tnoremap <C-w>h <C-\><C-N><C-w>h
    tnoremap <C-w>j <C-\><C-N><C-w>j
    tnoremap <C-w>k <C-\><C-N><C-w>k
    tnoremap <C-w>l <C-\><C-N><C-w>l
    tnoremap <C-w><C-h> <C-\><C-N><C-w>h
    tnoremap <C-w><C-j> <C-\><C-N><C-w>j
    tnoremap <C-w><C-k> <C-\><C-N><C-w>k
    tnoremap <C-w><C-l> <C-\><C-N><C-w>l
    execute "nmap <Leader>v :vsplit term://" . &shell"<cr>"
    execute "nmap <Leader>w :split term://" . &shell"<cr>"
    autocmd BufWinEnter,WinEnter term://* startinsert
    autocmd BufLeave term://* stopinsert
endif

" easy-align 配置
vmap <Leader>a <Plug>(EasyAlign)
nmap <Leader>h :nohlsearch<cr>
nmap <Leader><space> :%s/\s\+$//g<cr>
" 开启文件类型检测，主要是makefile文件中的Tab"
filetype plugin indent on
set laststatus=0
set showmatch
set softtabstop=4
set smarttab
" 空格代替Tab"
set expandtab
" 自动缩进"
set cindent
" Tab宽度"
set tabstop=4
" 匹配括号"
set showmatch
" 缩进格数"
set softtabstop=4
set shiftwidth=4
" 编码设置"
set enc=utf-8
set fencs=utf-8,gb18030,gdk,gdk2312
set fenc=utf-8
set tenc=utf-8
" set noexpandtab"
" 搜索忽略大小写
set ignorecase smartcase
" 关闭预览
set completeopt=longest,menu
" vimdiff 忽略空格
set diffopt+=iwhite
set diffexpr=""

set mouse=a

call gtags#load()
source ~/.config/nvim/doxygentoolkit.vim
source ~/.config/nvim/template.vim