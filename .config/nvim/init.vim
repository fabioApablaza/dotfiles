
" Plugins will be downloaded under the specified directory.
call plug#begin('~/.vim/plugged')

" Declare the list of plugins.
Plug 'tpope/vim-sensible'
" Para Comentar
Plug 'tpope/vim-commentary'

Plug 'junegunn/seoul256.vim'

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

Plug 'rafi/awesome-vim-colorschemes'

Plug 'gruvbox-community/gruvbox'

"Plug 'powerline/powerline"'

Plug 'ThePrimeagen/vim-be-good'

Plug 'vim-airline/vim-airline'

Plug 'vim-airline/vim-airline-themes'

Plug 'ctrlpvim/ctrlp.vim'

Plug 'vim-latex/vim-latex'

Plug 'tpope/vim-fugitive'

Plug 'preservim/nerdtree'

Plug 'liuchengxu/graphviz.vim'

Plug 'jceb/vim-orgmode'

" List ends here. Plugins become visible to Vim after this call.
call plug#end()

set cursorline " Marca la linea donse se encuentra el cursor
highlight CursorLine term=reverse
highlight CursorColumn term=reverse

set number "Numeración de cada linea de codigo
set relativenumber "Permite ver a cuantas lineas de codigo se encuentran otras lineas desde la que estas parada
set nu "Resalta el número de linea actual
colorscheme gruvbox 
"Transparencia en el fondo
hi Normal guibg=NONE ctermbg=NONE
"Configuracion de Airline
let g:airline#extensions#tabline#enabled = 1

"Configuraciones de latexsuit
" REQUIRED. This makes vim invoke Latex-Suite when you open a tex file.
filetype plugin on
set omnifunc=syntaxcomplete#Complete
set complete+=kspell
" OPTIONAL: This enables automatic indentation as you type.
" 'plaintex' instead of 'tex', which results in vim-latex not being loaded.
" The following changes the default filetype back to 'tex':
let g:tex_flavor='latex'

"Directorio donde se encuentran las plantillas
let g:Tex_CustomTemplateDirectory = '~/.config/nvim/templates/'

"Configuración para que vim-latex compile y exporte en formato pdf
let g:Tex_CompileRule_pdf  = 'pdf'

let g:Tex_FormatDependency_pdf = 'dvi,ps,pdf'
"Definiendo a zathura como visualizador de pdf
let g:Tex_ViewRule_pdf = 'zathura'


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Mapeo de combinacion de teclas
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Compila y genera archivos latex
map <Leader>ññ :!pdflatex % 
"Control+S para guardar
nnoremap <c-s> :w<CR>

"Oculta el subrayado que se genera cuando se busca una palabra
nnoremap <silent> <Esc> <Esc>:nohlsearch<CR><Esc>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"Cada vez que se crea un archivo html se genera la plantilla predefinida
:autocmd BufNewFile *.html 0r ~/.config/nvim/templates/html.tpl
"Lo mismo pero para C
:autocmd BufNewFile *.c 0r ~/.config/nvim/templates/tplc.tpl

"Graphviz
"Compila .dot a png
let g:graphviz_output_format = 'png'

"" Open Graphviz results with sxiv
let g:graphviz_viewer = 'sxiv'


" This is the default option:
"   - Preview window on the right with 50% width
"   - CTRL-/ will toggle preview window.
" - Note that this array is passed as arguments to fzf#vim#with_preview function.
" - To learn more about preview window options, see `--preview-window` section of `man fzf`.
let g:fzf_preview_window = ['right:50%', 'ctrl-/']

" Preview window on the upper side of the window with 40% height,
" hidden by default, ctrl-/ to toggle
"let g:fzf_preview_window = ['up:40%:hidden', 'ctrl-/']

" Empty value to disable preview window altogether
"let g:fzf_preview_window = []

command! -bang -nargs=? -complete=dir Files
    \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)

