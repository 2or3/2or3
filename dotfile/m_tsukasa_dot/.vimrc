set enc=utf-8
colorscheme zenburn 
set fileencodings=utf8,euc-jp,sjis,iso-2022-jp

" colorscheme zenburn
" URL: http://vim.wikia.com/wiki/Example_vimrc
" Authors: http://vim.wikia.com/wiki/Vim_on_Freenode
" Description: A minimal, but feature rich, example .vimrc. If you are a
"              newbie, basing your first .vimrc on this file is a good choice.
"              If you're a more advanced user, building your own .vimrc based
"              on this file is still a good idea.

"------------------------------------------------------------
" Features {{{1
"
" These options and commands enable some very useful features in Vim, that
" no user should have to live without.

" Set 'nocompatible' to ward off unexpected things that your distro might
" have made, as well as sanely reset options when re-sourcing .vimrc
set nocompatible

" Attempt to determine the type of a file based on its name and possibly its
" contents.  Use this to allow intelligent auto-indenting for each filetype,
" and for plugins that are filetype specific.
filetype indent plugin on

" Enable syntax highlighting
syntax on

"------------------------------------------------------------
" Must have options {{{1
"
" These are highly recommended options.

" One of the most important options to activate. Allows you to switch from an
" unsaved buffer without saving it first. Also allows you to keep an undo
" history for multiple files. Vim will complain if you try to quit without
" saving, and swap files will keep you safe if your computer crashes.
set hidden

" Better command-line completion

set wildmenu

" Show partial commands in the last line of the screen
set showcmd

" Highlight searches (use <C-L> to temporarily turn off highlighting; see the
" mapping of <C-L> below)
set hlsearch

" Modelines have historically been a source of security vulnerabilities.  As
" such, it may be a good idea to disable them and use the securemodelines
" script, <http://www.vim.org/scripts/script.php?script_id=1876>.
" set nomodeline


"------------------------------------------------------------
" Usability options {{{1
"
" These are options that users frequently set in their .vimrc. Some of them
" change Vim's behaviour in ways which deviate from the true Vi way, but
" which are considered to add usability. Which, if any, of these options to
" use is very much a personal preference, but they are harmless.
" Use case insensitive search, except when using capital letters

set ignorecase
set smartcase

" Allow backspacing over autoindent, line breaks and start of insert action
set backspace=indent,eol,start

" When opening a new line and no filetype-specific indenting is enabled, keep
" the same indent as the line you're currently on. Useful for READMEs, etc.
set autoindent

" Stop certain movements from always going to the first character of a line.
" While this behaviour deviates from that of Vi, it does what most users
" coming from other editors would expect.
set nostartofline

" Display the cursor position on the last line of the screen or in the status
" line of a window
set ruler

" Always display the status line, even if only one window is displayed
set laststatus=2

" Instead of failing a command because of unsaved changes, instead raise a
" dialogue asking if you wish to save changed files.
set confirm

" Use visual bell instead of beeping when doing something wrong
set visualbell

" And reset the terminal code for the visual bell.  If visualbell is set, and
" this line is also included, vim will neither flash nor beep.  If visualbell
" is unset, this does nothing.
set t_vb=

" Enable use of the mouse for all modes
set mouse=a

" Set the command window height to 2 lines, to avoid many cases of having to
" "press <Enter> to continue"
set cmdheight=2

" Display line numbers on the left
set number

" Quickly time out on keycodes, but never time out on mappings
set notimeout ttimeout ttimeoutlen=200

" Use <F11> to toggle between 'paste' and 'nopaste'
set pastetoggle=<F11>


"------------------------------------------------------------
" Indentation options {{{1
"
" Indentation settings according to personal preference.

" Indentation settings for using 2 spaces instead of tabs.
" Do not change 'tabstop' from its default value of 8 with this setup.
set shiftwidth=2
set softtabstop=2
set expandtab

" Indentation settings for using hard tabs for indent. Display tabs as
" two characters wide.
"set shiftwidth=2
"set tabstop=2


"------------------------------------------------------------
" Mappings {{{1
"
" Useful mappings

" Map Y to act like D and C, i.e. to yank until EOL, rather than act as yy,
" which is the default
map Y y$

" Map <C-L> (redraw screen) to also turn off search highlighting until the
" next search
nnoremap <C-L> :nohl<CR><C-L>


"------------------------------------------------------------

if &encoding !=# 'utf-8'
  set encoding=japan
  set fileencoding=japan
endif
if has('iconv')
  let s:enc_euc = 'euc-jp'
  let s:enc_jis = 'iso-2022-jp'
  if iconv("\x87\x64\x87\x6a", 'cp932', 'eucjp-ms') ==# "\xad\xc5\xad\xcb"
    let s:enc_euc = 'eucjp-ms'
    let s:enc_jis = 'iso-2022-jp-3'
  elseif iconv("\x87\x64\x87\x6a", 'cp932', 'euc-jisx0213') ==# "\xad\xc5\xad\xcb"
    let s:enc_euc = 'euc-jisx0213'
    let s:enc_jis = 'iso-2022-jp-3'
  endif
  if &encoding ==# 'utf-8'
    let s:fileencodings_default = &fileencodings
    if has('mac')
      let &fileencodings = s:enc_jis .','. s:enc_euc
      let &fileencodings = &fileencodings .','. s:fileencodings_default
    else
      let &fileencodings = s:enc_jis .','. s:enc_euc .',cp932'
      let &fileencodings = &fileencodings .','. s:fileencodings_default
    endif
    unlet s:fileencodings_default
  else
    let &fileencodings = &fileencodings .','. s:enc_jis
    set fileencodings+=utf-8,ucs-2le,ucs-2
    if &encoding =~# '^\(euc-jp\|euc-jisx0213\|eucjp-ms\)$'
      set fileencodings+=cp932
      set fileencodings-=euc-jp
      set fileencodings-=euc-jisx0213
      set fileencodings-=eucjp-ms
      let &encoding = s:enc_euc
      let &fileencoding = s:enc_euc
    else
      let &fileencodings = &fileencodings .','. s:enc_euc
    endif
  endif
  unlet s:enc_euc
  unlet s:enc_jis
endif

" Start the Corna Simulator with F3 for iPhone skin. Shift-F3 for iPad skin.
map <F3> :!/Applications/CoronaSDK/Corona\ Simulator.app/Contents/MacOS/Corona\ Simulator -project %:p -skin iPhone<CR>
map <S-F3> :!/Applications/CoronaSDK/Corona\ Terminal -project %:p -skin iPad<CR>
map <F4> :!/Applications/CoronaSDK/debugger -project %:p -skin iPad<CR>

noremap ; :
noremap : ;

" neobundle
set nocompatible               " Be iMproved
filetype off                   " Required!
if has('vim_starting')
  set runtimepath+=~/.vim/neobundle.vim
  call neobundle#rc(expand('~/.vim/bundle'))
endif
NeoBundle 'Shougo/neocomplcache.git'
NeoBundle 'Shougo/neosnippet.git'
NeoBundle 'Shougo/unite.vim.git'
NeoBundle 'Shougo/vimshell.git'
NeoBundle 'Shougo/unite-outline'
NeoBundle 'Shougo/neocomplete.vim'
NeoBundle "Shougo/neosnippet.vim"
NeoBundle "thinca/vim-quickrun"
NeoBundle 'derekwyatt/vim-scala.git'
NeoBundle 'majutsushi/tagbar'
NeoBundle 'nathanaelkane/vim-indent-guides'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'szw/vim-tags'
NeoBundle 'tomasr/molokai.git'
NeoBundle 'vim-scripts/errormarker.vim.git'
NeoBundle 'wincent/Command-T'
NeoBundle 'JuliaLang/julia-vim'
NeoBundle 'tyru/caw.vim'
NeoBundle 't9md/vim-quickhl'
NeoBundle "osyo-manga/vim-marching"
NeoBundle "osyo-manga/vim-watchdogs"
NeoBundle "osyo-manga/shabadou.vim"
NeoBundle 'Shougo/vimproc.vim', {
      \ 'build' : {
      \     'mac' : 'make -f make_mac.mak',
      \     'unix' : 'make -f make_unix.mak',
      \    },
      \ }
NeoBundle "jceb/vim-hier"
" clang formatting
NeoBundle 'kana/vim-operator-user'
NeoBundle 'rhysd/vim-clang-format'
" grep
NeoBundle 'vim-scripts/grep.vim'
" javascript
NeoBundle 'moll/vim-node'
NeoBundle 'myhere/vim-nodejs-complete'
NeoBundleLazy 'jelera/vim-javascript-syntax', {'autoload':{'filetypes':['javascript']}}

filetype plugin indent on     " Required!
"   Installation check.
if neobundle#exists_not_installed_bundles()
  echomsg 'Not installed bundles : ' .
        \ string(neobundle#get_not_installed_bundle_names())
  echomsg 'Please execute ":NeoBundleInstall" command.'
endif

" clang-format
map ,x <Plug>(operator-clang-format)

" quickrun
" 出力先
" 成功した場合：quickrun 専用の出力バッファ
" 失敗した場合：quickfix を :copen で開く
" バッファの開き方：botright 8sp
"
" cpp.type にて使用するコンパイラなどを設定する
" cpp.cmdopt にコマンドラインオプションを設定
let g:quickrun_config = {
\   "_" : {
\       "outputter" : "error",
\       "outputter/error/success" : "buffer",
\       "outputter/error/error"   : "quickfix",
\       "outputter/buffer/split" : ":botright 8sp",
\       "outputter/quickfix/open_cmd" : "copen",
\       "runner" : "vimproc",
\       "runner/vimproc/updatetime" : 500,
\   },
\   "cpp" : {
\       "type" : "cpp/clang++",
\       "cmdopt" : "-std=c++1y -ID:/home/cpp/boost/boost_1_55_0",
\   },
\
\   "cpp/watchdogs_checker" : {
\       "type" : "watchdogs_checker/clang++",
\   },
\
\   "watchdogs_checker/g++" : {
\       "cmdopt" : "-Wall",
\   },
\
\   "watchdogs_checker/clang++" : {
\       "cmdopt" : "-Wall",
\   },
\}

" :QuickRun 時に quickfix の中身をクリアする
" こうしておかないと quickfix の中身が残ったままになってしまうため
let s:hook = {
\   "name" : "clear_quickfix",
\   "kind" : "hook",
\}

" ファイルの保存時にチェックを行う
let g:watchdogs_check_BufWritePost_enable = 1

function! s:hook.on_normalized(session, context)
  call setqflist([])
endfunction

call quickrun#module#register(s:hook, 1)
unlet s:hook

" neosnippet
" スニペットを展開するキーマッピング
" <Tab> で選択されているスニペットの展開を行う
" 選択されている候補がスニペットであれば展開し、
" それ以外であれば次の候補を選択する
" また、既にスニペットが展開されている場合は次のマークへと移動する
imap <expr><Tab> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: "\<TAB>"


" 現在の filetype のスニペットを編集する為のキーマッピング
" こうしておくことでサッと編集や追加などを行うことができる
" 以下の設定では新しいタブでスニペットファイルを開く
nnoremap <Space>ns :execute "tabnew\|:NeoSnippetEdit ".&filetype<CR>

" スニペットファイルの保存ディレクトリを設定
let g:neosnippet#snippets_directory = "~/.neosnippet"

" vim-marching
" 非同期ではなくて同期処理で補完する
let g:marching_backend = "sync_clang_command"

" オプションの設定
" これは clang のコマンドに渡される
let g:marching_clang_command_option="-std=c++1y"


" neocomplete.vim と併用して使用する場合
" neocomplete.vim を使用すれば自動補完になる
let g:marching_enable_neocomplete = 1

if !exists('g:neocomplete#force_omni_input_patterns')
  let g:neocomplete#force_omni_input_patterns = {}
endif

let g:neocomplete#force_omni_input_patterns.cpp =
  \ '[^.[:digit:] *\t]\%(\.\|->\)\w*\|\h\w*::\w*'

" neocomplete
" 補完を有効にする
let g:neocomplete#enable_at_startup = 1

" 補完に時間がかかってもスキップしない
let g:neocomplete#skip_auto_completion_time = ""

" caw vim
" コメントアウトを切り替えるマッピング
" \c でカーソル行をコメントアウト
" 再度 \c でコメントアウトを解除
" 選択してから複数行の \c も可能
nmap \c <Plug>(caw:I:toggle)
vmap \c <Plug>(caw:I:toggle)

" t9md
" <Space>m でカーソル下の単語、もしくは選択した範囲のハイライトを行う
" 再度 <Space>m を行うとカーソル下のハイライトを解除する
" これは複数の単語のハイライトを行う事もできる
" <Space>M で全てのハイライトを解除する
nmap <Space>m <Plug>(quickhl-manual-this)
xmap <Space>m <Plug>(quickhl-manual-this)
nmap <Space>M <Plug>(quickhl-manual-reset)
xmap <Space>M <Plug>(quickhl-manual-reset)

" \C でコメントアウトの解除
nmap \C <Plug>(caw:I:uncomment)
vmap \C <Plug>(caw:I:uncomment)

" display
set showmatch
set number
set ruler
set cursorline
" indent
set smartindent
set autoindent
set tabstop=2
set shiftwidth=2
set expandtab
" etc
set smartcase
set history=50

" colorschehme
colorscheme molokai
let g:molokai_original=1

" neocomplcache
let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_dictionary_filetype_lists = {
    \ 'default' : '',
    \ 'scala' : $HOME . '/.vim/dict/scala.dict',
    \ }

" neosnippet
"   Plugin key-mappings.
imap <C-k> <Plug>(neosnippet_expand_or_jump)
smap <C-k> <Plug>(neosnippet_expand_or_jump)
"   SuperTab like snippets behavior.
imap <expr><TAB> neosnippet#expandable() ? "\<Plug>(neosnippet_expand_or_jump)" : pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
"   For snippet_complete marker.
if has('conceal')
  set conceallevel=2 concealcursor=i
endif
let g:neosnippet#snippets_directory='~/.vim/snippets'

" vimsehll
let g:vimshell_interactive_update_time = 10
let g:vimshell_prompt = $USER."% "
"vimshell map
nmap vs :VimShell<CR>
nmap vp :VimShellPop<CR>

" make
autocmd FileType scala :compiler sbt
autocmd QuickFixCmdPost make if len(getqflist()) != 0 | copen | endif

" marker
let g:errormarker_errortext     = '!!'
let g:errormarker_warningtext   = '??'
let g:errormarker_errorgroup    = 'Error'
let g:errormarker_warninggroup  = 'ToDo'

" TagBar
nmap <F8> :TagbarToggle<CR>

" NERDTree
nmap <silent> <C-e> :NERDTreeToggle<CR>
vmap <silent> <C-e> <Esc> :NERDTreeToggle<CR>
omap <silent> <C-e> :NERDTreeToggle<CR>
imap <silent> <C-e> <Esc> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
let g:NERDTreeShowHidden=1

" vim-tags
nnoremap <C-]> g<C-]>

" indent-guides
let g:indent_guides_guide_size = 1

" include path
setlocal path+=/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.12.sdk/usr/include/c++/4.2.1:/usr/local/include/

" for cpp
function! s:cpp()
  " インクルードパスを設定する
  " gf などでヘッダーファイルを開きたい場合に影響する
  setlocal path+=/usr/local/Cellar/boost/1.49.0/

  "タブ文字の長さ
  setlocal tabstop=4
  setlocal shiftwidth=4

  " 空白文字ではなくてタブ文字を使用する
  setlocal noexpandtab

  " 括弧を構成する設定に <> を追加する
  " template<> を多用するのであれば
  setlocal matchpairs+=<:>

  " 最後に定義された include
  " 箇所へ移動してを挿入モードへ
  nnoremap <buffer><silent> <Space>ii :execute "?".&include<CR> :noh<CR> o

  " BOOST_PP_XXX 等のハイライトを行う
  syntax match boost_pp /BOOST_PP_[A-z0-9_]*/
  highlight link boost_pp cppStatement
endfunction

augroup vimrc-cpp
  autocmd!
  " filetype=cpp が設定された場合に関数を呼ぶ
  autocmd FileType cpp call s:cpp()
augroup END

" 標準ライブラリへのパスを設定
let $CPP_STDLIB = "/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.12.sdk/usr/include/c++/4.2.1"

augroup vimrc-set_filetype_cpp
  autocmd!
  " $CPP_STDLIB よりも下の階層のファイルが開かれて
  " filetype が設定されていない場合に filetype=cpp を設定する
  autocmd BufReadPost $CPP_STDLIB/* if empty(&filetype) | set filetype=cpp | endif
augroup END

" tag jump
nnoremap <C-h> :vsp<CR> :exe("tjump ".expand('<cword>'))<CR>
nnoremap <C-k> :split<CR> :exe("tjump ".expand('<cword>'))<CR>
nnoremap <C-n> :tab sp<CR> :exe("tjump ".expand('<cword>'))<CR>

" Rgrep
nnoremap <C-g> :tab sp<CR> :Rgrep <cword><CR><CR><CR>
nnoremap <C-w><C-g> :tab sp<CR> :Rgrep <cword><CR>

" nodejs complete
:setl omnifunc=jscomplete#CompleteJS
if !exists('g:neocomplcache_omni_functions')
  let g:neocomplcache_omni_functions = {}
endif
let g:neocomplcache_omni_functions.javascript = 'nodejscomplete#CompleteJS'
let g:node_usejscomplete = 1
imap <C-f> <C-x><C-o>

" vim node
autocmd User Node
  \ if &filetype == "javascript" |
  \   nmap <buffer> <C-w>f <Plug>NodeVSplitGotoFile |
  \   nmap <buffer> <C-w><C-f> <Plug>NodeTabGotoFile |
  \ endif
