if exists('g:loaded_zero_indent')
    echo "already loaded"
    finish
endif
let g:loaded_zero_indent = 1

command! -range ZeroIndent <line1>,<line2>call zero_indent#RemoveIndentRange()
vnoremap <silent><Plug>(zero-indent) :ZeroIndent<CR>
