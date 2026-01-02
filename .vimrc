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

" 以下プラグイン設定
" vim-plug

call plug#begin('~/.vim/plugged')
Plug 'powrline/powerline', { 'rtp' : 'powerline/bindings/vim'}
Plug 'Shougo/echodoc.git'
Plug 'Shougo/neocomplcache.git'
Plug 'Shougo/neosnippet'
Plug 'Shougo/unite.vim.git'
Plug 'Shougo/vim-vcs.git'
Plug 'Shougo/vimfiler.git'
Plug 'Shougo/vimproc.git'
Plug 'Shougo/vimshell.git'
Plug 'Shougo/vinarise.git'
Plug 'basyura/bitly.vim'
Plug 'basyura/twibill.vim'
Plug 'dag/vim2hs.git'
Plug 'eagletmt/ghcmod-vim.git'
Plug 'eagletmt/unite-haddock.git'
Plug 'h1mesuke/unite-outline'
Plug 'kakkyz81/evervim.git'
Plug 'kana/vim-fakeclip.git'
Plug 'kana/vim-smartchr.git'
Plug 'leafo/moonscript-vim'
Plug 'majutsushi/tagbar.git'
Plug 'mattn/mkdpreview-vim.git'
Plug 'mattn/webapi-vim'
Plug 'mattn/zencoding-vim.git'
Plug 'mojako/ref-sources.vim'
Plug 'pangloss/vim-javascript'
Plug 'scrooloose/nerdtree.git'
Plug 'scrooloose/syntastic.git'
Plug 'taichouchou2/alpaca_powertabline'
Plug 'thinca/vim-quickrun.git'
Plug 'thinca/vim-ref.git'
Plug 'tpope/vim-fugitive.git'
Plug 'tpope/vim-surround.git'
Plug 'tyru/open-browser.vim'
Plug 'ujihisa/neco-ghc.git'
Plug 'vim-jp/vital.vim.git'
Plug 'vim-scripts/VimRepress'
Plug 'vim-scripts/YankRing.vim.git'
Plug 'yuratomo/w3m.vim'
Plug 'gregsexton/gitv.git'
Plug 'kana/vim-filetype-haskell'
Plug 'osyo-manga/vim-watchdogs'
Plug 'ujihisa/ref-hoogle'
Plug 'ujihisa/unite-haskellimport'
Plug 'koron/chalice'
call plug#end()

filetype plugin on
filetype indent on

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

"migemo
let g:ctrlp_use_migemo = 1
" migemo割り当て
noremap  // :<C-u>Migemo<CR>

