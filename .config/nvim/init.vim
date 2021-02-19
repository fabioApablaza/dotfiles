
" Plugins will be downloaded under the specified directory.
call plug#begin('~/.vim/plugged')

" Declare the list of plugins.
Plug 'tpope/vim-sensible'

Plug 'junegunn/seoul256.vim'

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
" OPTIONAL: This enables automatic indentation as you type.
" 'plaintex' instead of 'tex', which results in vim-latex not being loaded.
" The following changes the default filetype back to 'tex':
let g:tex_flavor='latex'

"Directorio donde se encuentran las plantillas
let g:Tex_CustomTemplateDirectory = '~/.config/nvim/templates/'

"Configuración para que vim-latex compile y exporte en formato pdf
let g:Tex_CompileRule_pdf  = 'pdf'
"let g:Tex_FormatDependency_dvi = 'dvi,ps,pdf'
let g:Tex_FormatDependency_pdf = 'dvi,ps,pdf'
"Definiendo a zathura como mi visualizador de pdf
let g:Tex_ViewRule_pdf = 'zathura'


map <Leader>ññ :!pdflatex %

"Cada vez que creo un archivo html se genera la plantilla
:autocmd BufNewFile *.html 0r ~/.config/nvim/templates/html.tpl

"Graphviz
"Compila .dot a png
let g:graphviz_output_format = 'png'

"" Open Graphviz results with sxiv
let g:graphviz_viewer = 'sxiv'
