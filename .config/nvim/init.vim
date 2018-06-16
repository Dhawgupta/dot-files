set shell=/bin/bash
set autoread

call plug#begin('~/.local/share/nvim/plugged')
  "Semantic Autocomplete
  Plug 'Valloric/YouCompleteMe', {'dir': '~/.local/share/nvim/plugged/YouCompleteMe/', 'do': './install.py --clang-completer'}

  "Nerd commenter
  Plug 'scrooloose/nerdcommenter'

  "Color Scheme
  Plug 'morhetz/gruvbox'

  "Fuzzy finder (files, mru, etc)
  Plug 'ctrlpvim/ctrlp.vim'

  "A pretty statusline, bufferline integration
  Plug 'itchyny/lightline.vim'
  Plug 'bling/vim-bufferline'

  "Undo history visualizer
  Plug 'mbbill/undotree'

  "Autoclose (, " etc
  Plug 'jiangmiao/auto-pairs'

  "UNIX shell command helpers, e.g. sudo, chmod, remove etc.
  Plug 'tpope/vim-eunuch'

  "Handle surround chars like ''
  Plug 'tpope/vim-surround'

  "Align your = etc.
  Plug 'junegunn/vim-easy-align'

  "Reformat/Reindent whole file with single line
  Plug 'Chiel92/vim-autoformat'

  "Nerd Tree File explorer
  Plug 'scrooloose/nerdtree'

  "Color Scheme vim-one
  Plug 'rakr/vim-one'

  "Plugin for C++ syntax highlighting
  Plug 'octol/vim-cpp-enhanced-highlight'

  "Plugin for snippets
  Plug 'SirVer/ultisnips'
  Plug 'honza/vim-snippets'

  "For taking vim notes
  Plug 'xolox/vim-notes'
  Plug 'xolox/vim-misc'

  "Plugins for \LaTeX
  Plug 'lervag/vimtex'

  "Plugin for asynchronously running shell commands
  Plug 'skywind3000/asyncrun.vim'

  "Plugin for installing various colorschemes
  Plug 'flazz/vim-colorschemes'

  "Plugin for colorscheme switcher
  Plug 'xolox/vim-colorscheme-switcher'

  "Pluging for colorscheme tuning[Only for true color supporting terminals]
  Plug 'zefei/vim-colortuner'

  "Plugin for vim themes
  "Plug 'reedes/vim-thematic'
  
  "Plugin for Window Resize Mode
  Plug 'romgrk/winteract.vim'

  "Plugin for sub-modes vim
  Plug 'kana/vim-submode'

  Plug 'easymotion/vim-easymotion'

  Plug 'Yggdroot/indentLine'
  call plug#end()
"
"
"
"-------------Basic Customs--------------
"show existing tab with 4 spaces width
set tabstop=2
"when indenting with '>', use 4 spaces width
set shiftwidth=2
"On pressing tab, insert 4 spaces
set expandtab
"Line numbering (Relative or Absolute or Hybrid)
set number relativenumber
"Use 256 bit colors
set t_Co=256
"refresh all the buffers
nnoremap <silent> <F6> :checktime
"Show whitespaces as characters
set list
"For Normal Mode wrapping after right"
set whichwrap+=>,l
"For Normal Mode wrapping after left"
set whichwrap+=<,h
"For Insert Mode wrapping"
set whichwrap+=[,]
"For highligting the current line
set cursorline
"Shows the current buffer path
set statusline+=%F
"----------------------------------------
"
"
"
"Highlighting for OCTOL PLUGIN
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1
let c_no_curly_error=1
"
"
"
"Reformat the code
let b:formatdef_custom_cpp='"clang-format -style=\"{IndentWidth: 2, TabWidth: 2}\" "'
let b:formatters_cpp = ['custom_cpp']
"
"
"
"TABS REMAPPING
nnoremap tn :tabnew<Space>
nnoremap tk :tabnext<CR>
nnoremap tj :tabprev<CR>
nnoremap th :tabfirst<CR>
nnoremap tl :tablast<CR>
"
"
"
"YouCompleteMe configs
let g:ycm_add_preview_to_completeopt = 1
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_show_diagnostics_ui = 0 " Turning off the linter diagnostics
nnoremap go :YcmCompleter GoTo<CR>
set completeopt-=preview
autocmd BufEnter *.cpp :let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf_cpp.py'
autocmd BufEnter *.cc :let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf_cpp.py'
autocmd BufEnter *.c :let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf_c.py'
"
"
"
"------------COLOR SCHEME MAPPINGS-----------
"Terminal Colors SETTINGS
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
"Grubox configs
colorscheme gruvbox
let g:gruvbox_contrast_dark = 'hard'
set bg=dark
"LightLine vim configuration
let g:lightline = {
      \ 'colorscheme': 'seoul256',
      \ }
"---------------------------------------------
"
"
"
"-------------Asynchronous compilation and running Plugins----------
"automatically open quickfix window when AsyncRun command is executed
"set the quickfix window 10 lines height.
let g:asyncrun_open = 10
"ring the bell to notify you job finished
let g:asyncrun_bell = 1
"ring the bell to notify you job finished
"F10 to toggle quickfix window
nnoremap <F10> :call asyncrun#quickfix_toggle(10)<cr>
nnoremap <silent> <F2> :AsyncRun -cwd=$(VIM_FILEDIR) -save=2 -post=checktime make '%:t:r' && ./'%:t:r' < ~/Documents/inputf.in > ~/Documents/outputf.in<CR>:checktime<CR>
"nnoremap <silent> <F2> :AsyncRun -save=2 -post=checktime cd '$(VIM_FILEDIR)' && g++ -Wall -Wfatal-errors -g -O3 -Daishwarya_tandon_is_best '%:t' -o '%:t:r' && ./'%:t:r' < ~/Documents/inputf.in > ~/Documents/outputf.in <CR>
"nnoremap <silent> <F2> :AsyncRun -save=2 -post=checktime cd '$(VIM_FILEDIR)' && g++ 975e.cpp<CR>
nnoremap <silent> <F4> :AsyncRun -cwd=$(VIM_FILEDIR) ~/InsertInMakeFile.sh <cr>
nnoremap <silent> <F5> :AsyncRun -cwd=$(VIM_FILEDIR) ~/InsertInMakeFile.sh "%:t:r"<CR>
"-------------------------------------------------------------------
"
"
"
"--------------Keybindings------------------
"Saving Files
nnoremap <C-s>  :w<CR>
inoremap <C-s>  <Esc>:w<CR>a
"Disable Highlighting
nnoremap <F1>   :noh<CR>
"Reloading the .vimrc file
nnoremap <F3>   :source ~/.config/nvim/init.vim <CR>
"Remapping for Copying and Pasting to and from system clipboard
vmap <C-c> "+y
"Remapping for getting out of the insert mode
imap yy <Esc>
let mapleader = " "
"------------------------------------------
"
"
"
"--------UltiSnips Keybindings---------------
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"
"Beware Tilda Completion doesn't work in the path
let g:UltiSnipsSnippetsDir = "/home/i_love_ayrawhsia_nodnat/UltiSnips"
let g:UltiSnipsSnippetDirectories=["UltiSnips", "/home/i_love_ayrawhsia_nodnat/UltiSnips"]
let g:UltiSnipsEditSplit= "context"
"
"
"
"-------Windows Managment------------------
nnoremap <leader>wc :wincmd q<cr>
nnoremap <leader>wr <C-W>r
nnoremap <Leader>wh :split<CR>
nnoremap <Leader>wv :vsplit<CR>
map <leader>H              :wincmd H<cr>
map <leader>K              :wincmd K<cr>
map <leader>L              :wincmd L<cr>
map <leader>J              :wincmd J<cr>
"Resize Windows
nmap gw        :InteractiveWindow<CR>
nmap <left>  :3wincmd <<cr>
nmap <right> :3wincmd ><cr>
nmap <up>    :3wincmd +<cr>
nmap <down>  :3wincmd -<cr>
call submode#enter_with('move', 'n', '', '<leader>h', '<C-w>h')
call submode#enter_with('move', 'n', '', '<leader>j', '<C-w>j')
call submode#enter_with('move', 'n', '', '<leader>k', '<C-w>k')
call submode#enter_with('move', 'n', '', '<leader>l', '<C-w>l')
call submode#map('move', 'n', '', 'h', '<C-w>h')
call submode#map('move', 'n', '', 'j', '<C-w>j')
call submode#map('move', 'n', '', 'k', '<C-w>k')
call submode#map('move', 'n', '', 'l', '<C-w>l')
"disable submode timeouts:
let g:submode_timeout = 0
" don't consume submode-leaving key
let g:submode_keep_leaving_key = 1
"-------------------------------------------
"
"
"
"-------------Indent Line-------------------
let g:indentLine_char = '▏'
"-------------------------------------------
