"" vimproc
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
" neobundole
set nocompatible               " be iMproved
filetype plugin indent off     " required!
set runtimepath+=~/.cabal/bin/

if has('vim_starting')
set runtimepath+=~/.vim/bundle/neobundle.vim/
call neobundle#rc(expand('~/.vim/bundle/'))
endif

"NeoBundle 'Shougo/clang_complete.git'
"endtagcomment.vim
NeoBundle 'JavaScript-syntax'
NeoBundle 'Lokaltog/powerline', { 'rtp' : 'powerline/bindings/vim'}
NeoBundle 'Shougo/echodoc.git'
NeoBundle 'Shougo/neobundle.vim.git'
NeoBundle 'Shougo/neocomplcache.git'
NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/unite.vim.git'
NeoBundle 'Shougo/vim-vcs.git'
NeoBundle 'Shougo/vimfiler.git'
NeoBundle 'Shougo/vimproc.git'
NeoBundle 'Shougo/vimshell.git'
NeoBundle 'Shougo/vinarise.git'
NeoBundle 'TwitVim'
NeoBundle 'basyura/TweetVim'
NeoBundle 'basyura/bitly.vim'
NeoBundle 'basyura/twibill.vim'
NeoBundle 'dag/vim2hs.git'
NeoBundle 'eagletmt/ghcmod-vim.git'
NeoBundle 'eagletmt/unite-haddock.git'
NeoBundle 'git://gist.github.com/411828.git'
NeoBundle 'h1mesuke/unite-outline'
NeoBundle 'kakkyz81/evervim.git'
NeoBundle 'kana/vim-fakeclip.git'
NeoBundle 'kana/vim-smartchr.git'
NeoBundle 'kchmck/vim-coffee-script.git'
NeoBundle 'leafo/moonscript-vim'
NeoBundle 'majutsushi/tagbar.git'
NeoBundle 'mattn/mkdpreview-vim.git'
NeoBundle 'mattn/webapi-vim'
NeoBundle 'mattn/zencoding-vim.git'
NeoBundle 'mojako/ref-sources.vim'
NeoBundle 'pangloss/vim-javascript'
NeoBundle 'project.tar.gz'
NeoBundle 'scrooloose/nerdtree.git'
NeoBundle 'scrooloose/syntastic.git'
NeoBundle 'taglist.vim'
NeoBundle 'taichouchou2/alpaca_powertabline'
NeoBundle 'thinca/vim-quickrun.git'
NeoBundle 'thinca/vim-ref.git'
NeoBundle 'tpope/vim-fugitive.git'
NeoBundle 'tpope/vim-surround.git'
NeoBundle 'tyru/open-browser.vim'
NeoBundle 'ujihisa/neco-ghc.git'
NeoBundle 'vim-jp/vital.vim.git'
NeoBundle 'vim-scripts/VimRepress'
NeoBundle 'vim-scripts/YankRing.vim.git'
NeoBundle 'yuratomo/w3m.vim'
NeoBundle 'gregsexton/gitv.git'

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

autocmd BufWritePost *.coffee silent CoffeeMake! -cb | cwindow | redraw!
" vimにcoffeeファイルタイプを認識させる
au BufRead,BufNewFile,BufReadPre *.coffee   set filetype=coffee
" インデントを設定
autocmd FileType coffee     setlocal sw=2 sts=2 ts=2 et

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
