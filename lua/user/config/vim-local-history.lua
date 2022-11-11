vim.cmd([[

let g:local_history_enabled = 1
let g:local_history_path = "./.local-history"
let g:local_history_width = 30
let g:local_history_new_change_delay = 30

let g:local_history_mappings = {
    \ "move_older": ["j"],
    \ "move_newer": ["k"],
    \ "move_oldset": ["G"],
    \ "move_newset": ["gg"],
    \ "revert": ["l"],
    \ "diff": ["d"],
    \ "delete": ["D"],
    \ "quit": ["q", "Q"],
    \ }
]])
