" vimproc
"if has('mac')
"  let g:vimproc_dll_path = $HOME.'.vim/bundle/vimproc/autoload/vimproc_mac.so'
"elseif has('win32')
"  let g:vimproc_dll_path = $HOME . '.vim/bundle/vimproc/autoload/vimproc_win32.dll'
"elseif has('win64')
"  let g:vimproc_dll_path = $HOME . '.vim/bundle/vimproc/autoload/vimproc_win64.dll'
"elseif has('unix')
"  let g:vimproc_dll_path = $HOME . '.vim/bundle/vimproc/autoload/vimproc_unix.so'
"endif
" leaderをスペースへ設定
let mapleader = "\<Space>"

" 外部ファイル読み込み
if filereadable(expand('~/.vimrc.local'))
	source ~/.vimrc.local
endif

set fileencodings=euc-jp,iso-2022-jp,sjis,utf-8
set number
set clipboard=unnamed

nmap tc :tabnew<CR>
nmap tn :tabnext<CR>
nmap tp :tabprevious<CR>
nmap tk :tabClose<CR>
nmap tK :tabClose!<CR>
"move window
nmap wh <C-W>h
nmap wj <C-W>j
nmap wk <C-W>k
nmap wl <C-W>l

" coc

" if hidden is not set, TextEdit might fail.
set hidden

" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup

" Better display for messages
set cmdheight=2

" Smaller updatetime for CursorHold & CursorHoldI
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Use `[c` and `]c` to navigate diagnostics
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nnoremap <silent> <leader>co  :<C-u>CocList outline<CR>

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add diagnostic info for https://github.com/itchyny/lightline.vim
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'cocstatus', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'cocstatus': 'coc#status'
      \ },
      \ }

" Using CocList
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

" 以下プラグイン設定
" vim-plug

call plug#begin('~/.vim/plugged')
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'Shougo/echodoc'
Plug 'Shougo/neocomplcache'
Plug 'Shougo/neosnippet'
Plug 'Shougo/unite.vim'
Plug 'Shougo/vim-vcs'
Plug 'Shougo/vimfiler'
Plug 'Shougo/vimproc'
Plug 'Shougo/vimshell'
Plug 'Shougo/vinarise'
Plug 'dag/vim2hs'
Plug 'eagletmt/ghcmod-vim'
Plug 'eagletmt/unite-haddock'
Plug 'h1mesuke/unite-outline'
Plug 'kana/vim-fakeclip'
Plug 'kana/vim-smartchr'
Plug 'majutsushi/tagbar'
Plug 'mattn/mkdpreview-vim'
Plug 'mattn/webapi-vim'
Plug 'mattn/emmet-vim'
Plug 'mojako/ref-sources.vim'
Plug 'pangloss/vim-javascript'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/syntastic'
Plug 'taichouchou2/alpaca_powertabline'
Plug 'thinca/vim-quickrun'
Plug 'thinca/vim-ref'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tyru/open-browser.vim'
Plug 'ujihisa/neco-ghc'
Plug 'vim-jp/vital.vim'
Plug 'vim-scripts/VimRepress'
Plug 'vim-scripts/YankRing.vim'
Plug 'yuratomo/w3m.vim'
Plug 'gregsexton/gitv'
Plug 'kana/vim-filetype-haskell'
Plug 'osyo-manga/vim-watchdogs'
Plug 'ujihisa/ref-hoogle'
Plug 'ujihisa/unite-haskellimport'
Plug 'koron/chalice'
Plug 'elixir-editors/vim-elixir'
Plug 'mattreduce/vim-mix'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'amiralies/coc-elixir', {'do': 'yarn install && yarn prepack'}
Plug 'prabirshrestha/vim-lsp'
Plug 'dense-analysis/ale'
Plug 'vim-test/vim-test'
Plug 'kassio/neoterm'
Plug 'junegunn/fzf'
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-telescope/telescope.nvim'
Plug 'kyazdani42/nvim-tree.lua'
Plug 'godlygeek/tabular'
Plug 'preservim/vim-markdown'
Plug 'itchyny/lightline.vim'
call plug#end()

filetype plugin on
filetype indent on

"vimtest 
let test#strategy = "neoterm"

"unite prefix key.
nnoremap [unite] <Nop>
nmap <Space>f [unite]

"unite general settings
"インサートモードで開始
let g:unite_enable_start_insert = 1
"最近開いたファイル履歴の保存数
let g:unite_source_file_mru_limit = 50

"file_mruの表示フォーマットを指定。空にすると表示スピードが高速化される
let g:unite_source_file_mru_filename_format = ''

"現在開いているファイルのディレクトリ下のファイル一覧。
"開いていない場合はカレントディレクトリ
nnoremap <silent> [unite]f :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
"バッファ一覧
nnoremap <silent> [unite]b :<C-u>Unite buffer<CR>
"レジスタ一覧
nnoremap <silent> [unite]r :<C-u>Unite -buffer-name=register register<CR>
"最近使用したファイル一覧
nnoremap <silent> [unite]m :<C-u>Unite file_mru<CR>
"ブックマーク一覧
nnoremap <silent> [unite]c :<C-u>Unite bookmark<CR>
"ブックマークに追加
nnoremap <silent> [unite]a :<C-u>UniteBookmarkAdd<CR>
"uniteを開いている間のキーマッピング
autocmd FileType unite call s:unite_my_settings()
function! s:unite_my_settings()"{{{
        "ESCでuniteを終了
        nmap <buffer> <ESC> <Plug>(unite_exit)
        "入力モードのときjjでノーマルモードに移動
        imap <buffer> jj <Plug>(unite_insert_leave)
        "入力モードのときctrl+wでバックスラッシュも削除
        imap <buffer> <C-w> <Plug>(unite_delete_backward_path)
        "ctrl+jで縦に分割して開く
        nnoremap <silent> <buffer> <expr> <C-j> unite#do_action('split')
        inoremap <silent> <buffer> <expr> <C-j> unite#do_action('split')
        "ctrl+jで横に分割して開く
        nnoremap <silent> <buffer> <expr> <C-l> unite#do_action('vsplit')
        inoremap <silent> <buffer> <expr> <C-l> unite#do_action('vsplit')
        "ctrl+oでその場所に開く
        nnoremap <silent> <buffer> <expr> <C-o> unite#do_action('open')
        inoremap <silent> <buffer> <expr> <C-o> unite#do_action('open')
endfunction"}}}

" :Ref alcの上書き 
let g:ref_alc2_overwrite_alc = 1
" jquery doc
let g:ref_jquery_doc_path = $HOME. '/public_html/repos/manual/jquery'
" 結果に合わせて、開かれるウインドウの縦サイズを調節します。 “
let g:ref_auto_resize = 1
" wikipedia に加え、英語版で検索する為の wikipedia_en が登録されます。 
let g:ref_wikipedia_lang = ['ja', 'en']
" キャッシュを有効にする 
let g:ref_use_cache = 1

" NeoCompleCash
let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_enable_smart_case = 1
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_enable_underbar_completion = 1
let g:neocomplcache_include_paths = {'phtml': 'Users/yoshida/development/ZendFramework/library'}
let g:neocomplcache_include_paths = {'php': 'Users/yoshida/development/ZendFramework/library'}

"タグ補完 "タグファイルの場所 
augroup SetTagsFile 
	autocmd! 
	autocmd FileType php set tags+=tags;./,/Users/yoshida/development/ZendFramework/library/tags
augroup END 
"タグ補完の呼び出しパターン
if !exists('g:neocomplcache_member_prefix_patterns') 
	let g:neocomplcache_member_prefix_patterns = {} 
endif 
let g:neocomplcache_member_prefix_patterns['php'] = '->\|::'

""" twitvim
let twitvim_count = 40
nnoremap ,tp :<C-u>PosttoTwitter<CR>
nnoremap ,tf :<C-u>FriendsTwitter<CR><C-w>j
nnoremap ,tu :<C-u>UserTwitter<CR><C-w>j
nnoremap ,tr :<C-u>RepliesTwitter<CR><C-w>j
nnoremap ,tn :<C-u>NextTwitter<CR>

autocmd FileType twitvim call s:twitvim_my_settings()
function! s:twitvim_my_settings()
	  set nowrap
  endfunction

" Project.vim
" ファイルが選択されたら、ウィンドウを閉じる
:let g:proj_flags = "imstc"
" <Leader>Pで、プロジェクトをトグルで開閉する
:nmap <silent> ,P <Plug>ToggleProject
" <Leader>pで、デフォルトのプロジェクトを開く
:nmap <silent> ,p :Project<CR>

" tags
if has('path_extra')
    set tags+=tags;/Users/myuser
endif

set backupskip=/var/tmp/*,/tmp/*,/private/tmp/*
let Tlist_Show_One_File = 1
let Tlist_Use_Right_Window = 1
let Tlist_Exit_OnlyWindow = 1

let g:quickrun_config = {}

" ghcmod-vim
let g:ghcmod_ghc_options = ['-idir1', '-idir2']
autocmd BufRead,BufNewFile ~/.xmonad/* call s:add_xmonad_path()
function! s:add_xmonad_path()
  if !exists('b:ghcmod_ghc_options')
    let b:ghcmod_ghc_options = []
  endif
  call add(b:ghcmod_ghc_options, '-i' . expand('~/.xmonad/lib'))
endfunction

" w3m
let g:w3m#external_browser = 'goole-chrome'
nnoremap <leader>E :W3mShowExtenalBrowser 

" vimfiler
let g:vimfiler_as_default_explorer=1
let g:vimfiler_safe_mode_by_default=0

" * evervim {{{
nnoremap <silent> ,el :<C-u>EvervimNotebookList<CR>
nnoremap <silent> ,eT :<C-u>EvervimListTags<CR>
nnoremap <silent> ,en :<C-u>EvervimCreateNote<CR>
nnoremap <silent> ,eb :<C-u>EvervimOpenBrowser<CR>
nnoremap <silent> ,ec :<C-u>EvervimOpenClient<CR>
nnoremap ,es :<C-u>EvervimSearchByQuery<SPACE>
nnoremap <silent> ,et :<C-u>EvervimSearchByQuery<SPACE>tag:todo -tag:done -tag:someday<CR>
nnoremap <silent> ,eta :<C-u>EvervimSearchByQuery<SPACE>tag:todo  -tag:done<CR>
let g:evervim_splitoption=''
 " ------------------------ }}}

" 文字コードの自動認識
if &encoding !=# 'utf-8'
  set encoding=japan
  set fileencoding=japan
endif
if has('iconv')
  let s:enc_euc = 'euc-jp'
  let s:enc_jis = 'iso-2022-jp'
  " iconvがeucJP-msに対応しているかをチェック
  if iconv("\x87\x64\x87\x6a", 'cp932', 'eucjp-ms') ==# "\xad\xc5\xad\xcb"
    let s:enc_euc = 'eucjp-ms'
    let s:enc_jis = 'iso-2022-jp-3'
  " iconvがJISX0213に対応しているかをチェック
  elseif iconv("\x87\x64\x87\x6a", 'cp932', 'euc-jisx0213') ==# "\xad\xc5\xad\xcb"
    let s:enc_euc = 'euc-jisx0213'
    let s:enc_jis = 'iso-2022-jp-3'
  endif
  " fileencodingsを構築
  if &encoding ==# 'utf-8'
    let s:fileencodings_default = &fileencodings
    let &fileencodings = s:enc_jis .','. s:enc_euc .',cp932'
    let &fileencodings = &fileencodings .','. s:fileencodings_default
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
  " 定数を処分
  unlet s:enc_euc
  unlet s:enc_jis
endif
" 日本語を含まない場合は fileencoding に encoding を使うようにする
if has('autocmd')
  function! AU_ReCheck_FENC()
    if &fileencoding =~# 'iso-2022-jp' && search("[^\x01-\x7e]", 'n') == 0
      let &fileencoding=&encoding
    endif
  endfunction
  autocmd BufReadPost * call AU_ReCheck_FENC()
endif
" 改行コードの自動認識
set fileformats=unix,dos,mac
" □とか○の文字があってもカーソル位置がずれないようにする
if exists('&ambiwidth')
  set ambiwidth=double
endif
"ale
let g:ale_fixers = { 'elixir': ['mix_format'] }

"migemo
let g:ctrlp_use_migemo = 1
" migemo割り当て
noremap  // :<C-u>Migemo<CR>

if has('nvim')
 " neovim 限定の設定
endif

