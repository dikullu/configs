set number
set tabstop=4
set shiftwidth=4
set expandtab
execute pathogen#infect()
syntax on
filetype plugin indent on
let g:fsharp_only_check_errors_on_write = 1
let g:fsharp_completion_helptext = 1
let g:fsharp_fsi_show_auto_open = 1
