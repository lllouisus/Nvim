" 禁用默认按键
let g:VM_default_mappings = 0

let g:VM_maps = {}
let g:VM_leader = '\'

let g:VM_maps['Find Under']         = '<C-w>'           " replace C-n
let g:VM_maps['Find Subword Under'] = '<C-w>'           " replace visual C-n

" let g:VM_maps['Select h'] = '<C-w>'           " replace visual C-n
" let g:VM_maps['Select l'] = '<C-w>'           " replace visual C-n

" let g:VM_maps["Select Cursor Down"] = '<C-Down>'      " start selecting down
" let g:VM_maps["Select Cursor Up"]   = '<C-Up>'        " start selecting up

let g:VM_maps["Select All"]                  = '\A' 
let g:VM_maps["Start Regex Search"]          = '\/'
let g:VM_maps["Add Cursor Down"]             = '<C-Down>'
let g:VM_maps["Add Cursor Up"]               = '<C-Up>'

let g:VM_maps["Find Next"]                   = ']'
let g:VM_maps["Find Prev"]                   = '['

let g:VM_maps["Skip Region"]                 = 'q'
let g:VM_maps["Remove Region"]               = 'Q'
