set clipboard=unnamed

let mapleader=","

" Turn off vi compatibility. If I wanted vi, I would use vi.
set nocompatible

" Reset all autocmds
autocmd!

filetype on
if &diff
    filetype plugin off
else
    filetype plugin on
endif

" eliminating esc key delay
set timeoutlen=1000 ttimeoutlen=0

set guifont=Inconsolata\ for\ Powerline:h15
let g:Powerline_symbols = 'fancy'
set encoding=utf-8
set t_Co=256                    " Terminal color

" support italic font
set t_ZH=[3m
set t_ZH=[23m

set fillchars+=stl:\ ,stlnc:\
set termencoding=utf-8

set number                      " Show numbers
set showmode                    " shows the current mode
set backspace=indent,eol,start  " backspaces behave like backspaces
set hidden                      " good multi-file behaviors
set wildmenu                    " better command line completion
set wildmode=list:longest,full  " completion acts like the shell
set showmatch                   " Show matching brackets/parenthesis
set ruler                       " show cursor position in the corner
" set foldenable                  " Auto fold code
set backupdir =~/.vim_backup
set scrolloff=5                 " always show 5 lines before/after the cursor
set title                       " update term title
set listchars=tab:›\ ,trail:•,extends:#,nbsp:. " Highlight problematic whitespace


" ----- Word wrap without line breaks -----
set wrap                        " linewraps
set linebreak                   " Line wrap at a character in the breakat ' ^I!@*-+;:,./?' where ^I => Tab
set nolist                      " list disabled linebreak
" set textwidth=0
set wrapmargin=0
set formatoptions-=t

set laststatus=2                " Always show a status line at the bottom
"set statusline=[%n]\ %<%.99f\ %h%w%m%r%y\ %{exists('*CapsLockStatusline')?CapsLockStatusline():''}%=%-16(\ %l,%c-%v\ %)%P

" Send more characters for redraws
set ttyfast

" Enable mouse use in all modes
set mouse=a
if !has('nvim')
    set ttymouse=xterm2
endif

"------ Vundle ------
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

"------ Bundle ------
" Load bundle from .vimrc.bundle
if filereadable($HOME . '/.vimrc.bundles')
    source ~/.vimrc.bundles
endif

call vundle#end()

"----- Theme ------
syntax enable
set background=dark
let g:monokai_thick_border = 1
let g:monokai_zentree = 1
let g:monokai_italic = 1
colorscheme monokai
" let g:molokai_original = 1
" colorscheme molokai
" Override monokai color
" Change bg to

if has('gui_running')
    highlight Normal ctermbg=#000000
    highlight StatusLine ctermbg=#000000
    highlight PmenuSbar ctermbg=#000000
else
    highlight Normal ctermbg=000
    highlight StatusLine ctermbg=000
    highlight PmenuSbar ctermbg=000
endif

"------ Highlight cursor position ------
hi cursorcolumn   ctermbg=235
hi CursorLine     cterm=none ctermbg=235
" hi LineNr         ctermbg=23 ctermfg=73
" hi Normal ctermbg=none
" hi TabLineSel ctermfg=white ctermbg=52
" hi TabLine ctermfg=white ctermbg=darkblue
" hi TabLineFill ctermfg=darkblue
set cursorline
set cursorcolumn

"------ Highlight search keywords ------
set hlsearch
set incsearch
set ignorecase  "case-insensitive searching
set smartcase "unless there's a capital letter there
nnoremap <C-s> :set hlsearch!<CR>

"------ Replace tab with 4 spaces ------
set expandtab                   " Tabs are spaces, not tabs
set shiftwidth=4
set softtabstop=4
set tabstop=4                   " An indentation every four columns
set autoindent
set smartindent
set nojoinspaces                " Prevents inserting two spaces after punctuation on a join (J)

set tags=./tags

"------ Swap file directory ------
set dir=~/.vim_swap

"------ Buffer Switcher ------
map <silent> <Leader>bn :bn<CR>
map <silent> <Leader>bp :bp<CR>
map <silent> <Leader>bd :bd<CR>

"------ Set F1-F12 shortcut keys ------
map <silent> <F2> :TagbarToggle<CR>
map <F3> oecho "<pre>";print_r($);exit;<Esc>F$a
map <silent> <F4> :TlistToggle<CR>
" map <F5> <Esc>:EnableFastPHPFolds<Cr>
" map <F6> <Esc>:EnablePHPFolds<Cr>
" map <F7> <Esc>:DisablePHPFolds<Cr>

"------  Window Navigation  ------
" ,hljk = Move between windows
nnoremap <Leader>h <C-w>h
nnoremap <Leader>l <C-w>l
nnoremap <Leader>j <C-w>j
nnoremap <Leader>k <C-w>k

" Gist stuff for mattn/gist-vim
" let g:gist_clip_command = 'pbcopy'
" let g:gist_detect_filetype = 1
" let g:gist_open_browser_after_post = 1
" let g:gist_post_private = 1


"------ NERDTree ------
let NERDTreeShowHidden=1

" Open NERDTree with [<leader>d]
" map <Leader>d :NERDTreeTabsToggle<CR>
map <Leader>d :NERDTreeToggle<CR>
" Show current file in the NERDTree hierarchy
map <Leader>D :NERDTreeFind<CR>
let NERDTreeMinimalUI=1
let NERDTreeDirArrows=1
let NERDTreeWinSize = 51
" let NERDTreeShowLineNumbers=1
let g:nerdtree_tabs_focus_on_files=1
"let g:nerdtree_tabs_open_on_console_startup=1

" Undotree
nnoremap <F5> :UndotreeToggle<cr>
if has("persistent_undo")
    set undodir='~/.undodir/'
    set undofile
endif

"resizes nerdtree if you're cursor is not actually in nerdtree (needs to be to the right of it)
map <leader>5 99+ 51_ j k

" For nerdcommenter, add one space after comment char
let NERDSpaceDelims=1

" Pasting support
set pastetoggle=<F2>  " Press F2 in insert mode to preserve tabs when pasting from clipboard into terminal

" Make sure Vim returns to the same line when you reopen a file.
augroup line_return
    au!
    au BufReadPost *
        \ if line("'\"") > 0 && line("'\"") <= line("$") |
        \     execute 'normal! g`"zvzz' |
        \ endif
augroup END

" DRAG IN VISUAL MODE
" -------------------
" <m-j> and <m-k> to drag lines in any mode (m is alt/option)
" this is the textmate move lines around thing that I used to do do with arrow
" keys but less fragile because it works in tmux or not
noremap ∆ :m+<CR>
noremap ˚ :m-2<CR>
inoremap ∆ <Esc>:m+<CR>
inoremap ˚ <Esc>:m-2<CR>
vnoremap ∆ :m'>+<CR>gv
vnoremap ˚ :m-2<CR>gv

"------  Fugitive Plugin Options  ------
"https://github.com/tpope/vim-fugitive
nnoremap <Leader>gs :Gstatus<CR>
nnoremap <Leader>gr :Gremove<CR>
nnoremap <Leader>gl :Glog<CR>
nnoremap <Leader>gb :Gblame<CR>
nnoremap <Leader>gm :Gmove
nnoremap <Leader>gp :Ggrep
nnoremap <Leader>gR :Gread<CR>
nnoremap <Leader>gg :Git
nnoremap <Leader>gd :Gdiff<CR>
nnoremap <Leader>gp :Gpush

" Indent guide
let g:indent_guides_start_level=2
let g:indent_guides_guide_size=1

" CtrlP
let g:ctrlp_map = '<c-p>'
" let g:ctrlp_working_path_mode = 'ra'

set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
" set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe  " Windows
set wildignore+=*.o,*.obj,.git,*.pyc,*.so,blaze*,READONLY,llvm,Library*
set wildignore+=CMakeFiles,packages/*,**/packages/*,**/node_modules/*

" let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn|DS_Store)$'
let g:ctrlp_custom_ignore = {
    \ 'dir':  '\v[\/]\.(git|hg|svn|DS_Store)$|node_modules$',
    \ 'file': '\v\.(exe|so|dll|swp|ico|jpg|png|gif|ico)$',
    \ 'link': 'some_bad_symbolic_links',
    \ }

"------ CtrlP funky - Function -------
nnoremap <Leader>fu :CtrlPFunky<Cr>
" narrow the list down with a word under cursor
nnoremap <Leader>fU :execute 'CtrlPFunky ' . expand('<cword>')<Cr>

"------  Text Editing Utilities  ------
" ,T = Delete all Trailing space in file
map <Leader>T :%s/\s\+$//<CR>

" ,U = Deletes Unwanted empty lines
map <Leader>U :g/^$/d<CR>

" ,R = Converts tabs to spaces in document
map <Leader>R :retab<CR>

"------ Air-line ------
if has("unix")
    let s:uname = system("uname")
    if s:uname == "Darwin\n"
        " Do Mac stuff here
        let g:airline#extensions#tabline#enabled = 1
        let g:airline_powerline_fonts = 1
        let g:airline_detect_iminsert = 1

        " tmux plugin for vim-airline https://github.com/edkolev/tmuxline.vim
        let g:tmuxline_preset = 'full'
        if !exists('g:airline_symbols')
            let g:airline_symbols = {}
        endif

        " powerline symbols
        let g:airline_left_sep = ''
        let g:airline_left_alt_sep = ''
        let g:airline_right_sep = ''
        let g:airline_right_alt_sep = ''
        let g:airline_symbols.branch = ''
        let g:airline_symbols.readonly = ''
        let g:airline_symbols.linenr = ''

        " tmuxline
        let g:tmuxline_powerline_separators = 1

    endif
endif

" -------------- SURROUND SETTINGS -------------------
" ,# Surround a word with #{ruby interpolation}
vmap ,# c#{<C-R>"}<ESC>

" ," Surround a word with "quotes"
map ," ysiw"
vmap ," c"<C-R>""<ESC>

 " ,' Surround a word with 'single quotes'
map ,' ysiw'
vmap ,' c'<C-R>"'<ESC>

" ,) or ,( Surround a word with (parens)
" The difference is in whether a space is put in
map ,( ysiw(
map ,) ysiw)
vmap ,( c( <C-R>" )<ESC>
vmap ,) c(<C-R>")<ESC>

" ,[ Surround a word with [brackets]
map ,] ysiw]
map ,[ ysiw[
vmap ,[ c[ <C-R>" ]<ESC>
vmap ,] c[<C-R>"]<ESC>

" ,{ Surround a word with {braces}
map ,} ysiw}
map ,{ ysiw{
vmap ,} c{ <C-R>" }<ESC>
vmap ,{ c{<C-R>"}<ESC>

map ,` ysiw`
" -------------- END SURROUND SETTINGS ---------------

" Show syntax highlighting groups for word under cursor
nmap <C-S-P> :call <SID>SynStack()<CR>
function! <SID>SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc

"------ Filetype config ------

" autocmd FileType c,cpp,java,go,php,javascript,puppet,python,rust,twig,xml,yml,perl,sql autocmd BufWritePre <buffer> if !exists('g:spf13_keep_trailing_whitespace') | call StripTrailingWhitespace() | endif
"autocmd FileType go autocmd BufWritePre <buffer> Fmt
autocmd BufNewFile,BufRead *.html.twig set filetype=html.twig
" preceding line best in a plugin but here for now.

autocmd BufNewFile,BufRead *.coffee set filetype=coffee

" Workaround vim-commentary for Haskell
autocmd FileType haskell setlocal commentstring=--\ %s
" Workaround broken colour highlighting in Haskell
autocmd FileType haskell,rust setlocal nospell

" Wildfire {
    let g:wildfire_objects = {
        \ "*" : ["i'", 'i"', "i)", "i]", "i}", "ip"],
        \ "html,xml" : ["at"],
        \ }
" }

" " PIV {
"     let g:DisableAutoPHPFolding = 0
"     let g:PIVAutoClose = 1
" "}

" <leader>v brings up .vimrc
" <leader>V reloads it and makes all changes active (file has to be saved first)
noremap <leader>v :e! $MYVIMRC<CR>
noremap <silent> <leader>V :source $MYVIMRC<CR>:filetype detect<CR>:exe ":echo 'vimrc reloaded'"<CR>

" This command will allow us to save a file we don't have permission to save
" *after* we have already opened it. Super useful.
cnoremap w!! w !sudo tee % >/dev/null
