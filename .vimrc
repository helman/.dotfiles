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

set guifont=Inconsolata\ for\ Powerline:h15
let g:Powerline_symbols = 'fancy'
set encoding=utf-8
set t_Co=256
set fillchars+=stl:\ ,stlnc:\
set termencoding=utf-8

set number
set showmode                    " shows the current mode
set backspace=indent,eol,start  " backspaces behave like backspaces
set hidden                      " good multi-file behaviors
set wildmenu                    " better command line completion
set wildmode=list:longest,full  " completion acts like the shell
set showmatch                   " Show matching brackets/parenthesis
set ruler                       " show cursor position in the corner
set foldenable                  " Auto fold code
set backupdir =~/.vim_backup
set wrap                        " linewraps
set scrolloff=5                 " always show 5 lines before/after the cursor
set title                       " update term title
set listchars=tab:›\ ,trail:•,extends:#,nbsp:. " Highlight problematic whitespace

set laststatus=2                " Always show a status line at the bottom
"set statusline=[%n]\ %<%.99f\ %h%w%m%r%y\ %{exists('*CapsLockStatusline')?CapsLockStatusline():''}%=%-16(\ %l,%c-%v\ %)%P

" Send more characters for redraws
set ttyfast

" Enable mouse use in all modes
set mouse=a
set ttymouse=xterm2

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

"------ Highlight search keywords ------
set hlsearch
set incsearch
set ignorecase  "case-insensitive searching
set smartcase "unless there's a capital letter there

"------ Replace tab with 4 spaces ------
set expandtab                   " Tabs are spaces, not tabs
set shiftwidth=4
set softtabstop=4
set tabstop=4                   " An indentation every four columns
set autoindent
set smartindent
set nojoinspaces                " Prevents inserting two spaces after punctuation on a join (J)

"------ Swap file directory ------
set dir=~/.vim_swap

"------ Buffer Switcher ------
map <silent> <Leader>bn :bn<CR>
map <silent> <Leader>bp :bp<CR>
map <silent> <Leader>bd :bd<CR>

"------ NERDTree ------
let NERDTreeShowHidden=1

"------ Set F1-F12 shortcut keys ------
map <silent> <F2> :TagbarToggle<CR>
map <F3> oecho "<pre>";print_r($);exit;<Esc>F$a
map <silent> <F4> :TlistToggle<CR>
map <F5> <Esc>:EnableFastPHPFolds<Cr>
map <F6> <Esc>:EnablePHPFolds<Cr>
map <F7> <Esc>:DisablePHPFolds<Cr>

"------  Window Navigation  ------
" ,hljk = Move between windows
nnoremap <Leader>h <C-w>h
nnoremap <Leader>l <C-w>l
nnoremap <Leader>j <C-w>j
nnoremap <Leader>k <C-w>k

" Gist stuff for mattn/gist-vim
let g:gist_clip_command = 'pbcopy'
let g:gist_detect_filetype = 1
let g:gist_open_browser_after_post = 1
let g:gist_post_private = 1


" Open NERDTree with [<leader>d]
map <Leader>d :NERDTreeTabsToggle<CR>
" Show current file in the NERDTree hierarchy
map <Leader>D :NERDTreeFind<CR>
let NERDTreeMinimalUI=1
let NERDTreeDirArrows=1
let NERDTreeWinSize = 51
let NERDTreeShowLineNumbers=1
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
        let g:tmuxline_poweline_separators = 1

    endif
endif

" Dash Doc triggering
if has("unix")
    let s:uname = system("uname")
    if s:uname == "Darwin\n"
        " Do Mac stuff here
        " Dash
        "let g:dash_map = {
        "  \ 'ruby'       : 'rails'
        "  \ }
        au BufNewFile,BufRead *.rb :DashKeywords rails ruby<cr>
        nmap <silent> <LocalLeader>d <Plug>DashSearch
        nmap <silent> <LocalLeader>D <Plug>DashGlobalSearch
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
autocmd FileType haskell,puppet,ruby,yml setlocal expandtab shiftwidth=2 softtabstop=2
" preceding line best in a plugin but here for now.

autocmd BufNewFile,BufRead *.coffee set filetype=coffee

" Workaround vim-commentary for Haskell
autocmd FileType haskell setlocal commentstring=--\ %s
" Workaround broken colour highlighting in Haskell
autocmd FileType haskell,rust setlocal nospell


"------ NEOCOMPLETE ------
"Note: This option must set it in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
        \ }

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
" inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
imap <expr> <CR> CleverCr()
function! s:CleverCr()
  if pumvisible()
      if neosnippet#expandable()
          let exp = "\<Plug>(neosnippet_expand)"
          return exp . neocomplete#close_popup()
      else
          return neocomplete#close_popup()
      endif
  else
      return "\<CR>"
  endif
  " return neocomplete#close_popup() . "\<CR>"
  " For no inserting <CR> key.
  " return pumvisible() ? neocomplete#close_popup() : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplete#close_popup()
inoremap <expr><C-e>  neocomplete#cancel_popup()
" Close popup by <Space>.
inoremap <expr><Space> pumvisible() ? neocomplete#close_popup() : "\<Space>"

" For cursor moving in insert mode(Not recommended)
inoremap <expr><Left>  neocomplete#close_popup() . "\<Left>"
inoremap <expr><Right> neocomplete#close_popup() . "\<Right>"
inoremap <expr><Up>    neocomplete#close_popup() . "\<Up>"
inoremap <expr><Down>  neocomplete#close_popup() . "\<Down>"
" Or set this.
"let g:neocomplete#enable_cursor_hold_i = 1
" Or set this.
"let g:neocomplete#enable_insert_char_pre = 1

" AutoComplPop like behavior.
"let g:neocomplete#enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
let g:neocomplete#enable_auto_select = 1
" let g:neocomplete#disable_auto_complete = 1
inoremap <expr><C-j>  pumvisible() ? "\<Down>" : "\<C-j>"
inoremap <expr><C-k>  pumvisible() ? "\<Up>" : "\<C-k>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
autocmd FileType haskell setlocal omnifunc=necoghc#omnifunc

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif

let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'
let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'
let g:neocomplete#sources#omni#input_patterns.ruby = '[^. *\t]\.\h\w*\|\h\w*::'
let g:neocomplete#sources#omni#input_patterns.go = '\h\w*\.\?'

" Snippets {
    " Plugin key-mappings.
    imap <TAB>     <Plug>(neosnippet_expand_or_jump)
    smap <TAB>     <Plug>(neosnippet_expand_or_jump)
    xmap <TAB>     <Plug>(neosnippet_expand_target)

    " SuperTab like snippets behavior.
    imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
    \ "\<Plug>(neosnippet_expand_or_jump)"
    \: pumvisible() ? "\<C-n>" : "\<TAB>"
    smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
    \ "\<Plug>(neosnippet_expand_or_jump)"
    \: "\<TAB>"

    " For snippet_complete marker.
    if has('conceal')
      set conceallevel=2 concealcursor=niv
    endif

    " Use honza's snippets.
    let g:neosnippet#snippets_directory='~/.vim/bundle/vim-snippets/snippets'

    " Enable neosnippet snipmate compatibility mode
    let g:neosnippet#enable_snipmate_compatibility = 1

    " Enable neosnippets when using go
    let g:go_snippet_engine = "neosnippet"

    " Disable the neosnippet preview candidate window
    " When enabled, there can be too much visual noise
    " especially when splits are used.
    " set completeopt-=preview

" }

" Wildfire {
    let g:wildfire_objects = {
        \ "*" : ["i'", 'i"', "i)", "i]", "i}", "ip"],
        \ "html,xml" : ["at"],
        \ }
" }

" PIV {
    let g:DisableAutoPHPFolding = 0
    let g:PIVAutoClose = 1
"}
