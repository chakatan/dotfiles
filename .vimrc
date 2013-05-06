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
"Shift
nmap <S-h> <C-W>h
nmap <S-j> <C-W>j
nmap <S-k> <C-W>k
nmap <S-l> <C-W>l

" 以下プラグイン設定
" neobundole
set nocompatible               " be iMproved
filetype plugin indent off     " required!
set runtimepath+=~/.cabal/bin/

if has('vim_starting')
set runtimepath+=~/.vim/bundle/neobundle.vim/
call neobundle#rc(expand('~/.vim/bundle/'))
endif

"NeoBundle 'git://github.com/Shougo/clang_complete.git'
NeoBundle 'git://github.com/Shougo/echodoc.git'
NeoBundle 'git://github.com/Shougo/neocomplcache.git'
NeoBundle 'git://github.com/Shougo/neobundle.vim.git'
NeoBundle 'git://github.com/Shougo/unite.vim.git'
NeoBundle 'git://github.com/Shougo/vim-vcs.git'
NeoBundle 'git://github.com/Shougo/vimfiler.git'
NeoBundle 'git://github.com/Shougo/vimshell.git'
NeoBundle 'git://github.com/Shougo/vimproc.git'
NeoBundle 'git://github.com/Shougo/vinarise.git'
NeoBundle 'git://github.com/thinca/vim-quickrun.git'
NeoBundle 'git://github.com/tpope/vim-surround.git'
NeoBundle 'git://github.com/thinca/vim-ref.git'
NeoBundle 'git://github.com/mattn/zencoding-vim.git'
NeoBundle 'git://github.com/vim-scripts/YankRing.vim.git'
NeoBundle 'git://github.com/kana/vim-smartchr.git'
"endtagcomment.vim
NeoBundle 'git://gist.github.com/411828.git'
NeoBundle 'git://github.com/kakkyz81/evervim.git'
NeoBundle 'TwitVim'
NeoBundle 'w3m.vim'
NeoBundle 'JavaScript-syntax'
NeoBundle 'pangloss/vim-javascript'
NeoBundle 'mojako/ref-sources.vim'
NeoBundle 'taglist.vim'
NeoBundle 'project.tar.gz'
NeoBundle 'git://github.com/kana/vim-fakeclip.git'
NeoBundle 'git://github.com/tpope/vim-fugitive.git'
NeoBundle 'git://github.com/scrooloose/nerdtree.git'
NeoBundle 'git://github.com/majutsushi/tagbar.git'
NeoBundle 'git://github.com/kchmck/vim-coffee-script.git'
NeoBundle 'basyura/TweetVim'
NeoBundle 'mattn/webapi-vim'
NeoBundle 'basyura/twibill.vim'
NeoBundle 'tyru/open-browser.vim'
NeoBundle 'h1mesuke/unite-outline'
NeoBundle 'basyura/bitly.vim'
NeoBundle 'Shougo/neosnippet'
NeoBundle 'honza/snipmate-snippets.git'
NeoBundle 'vim-scripts/VimRepress'
NeoBundle 'scrooloose/syntastic.git'
NeoBundle 'git://github.com/dag/vim2hs.git'
NeoBundle 'git://github.com/eagletmt/ghcmod-vim.git'
NeoBundle 'git://github.com/eagletmt/unite-haddock.git'
NeoBundle 'git://github.com/ujihisa/neco-ghc.git'
NeoBundle 'vim-jp/vital.vim.git'
NeoBundle 'leafo/moonscript-vim'
NeoBundle 'taichouchou2/alpaca_powertabline'
NeoBundle 'Lokaltog/powerline', { 'rtp' : 'powerline/bindings/vim'}

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
