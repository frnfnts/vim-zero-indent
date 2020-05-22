function! zero_indent#RemoveIndentRange() range abort
    let lines = getline(a:firstline, a:lastline)
    let indent_less_lines = zero_indent#RemoveIndent(lines)
    for i in range(len(lines))
        call setline(a:firstline+i, indent_less_lines[i])
    endfor
endfunction

function! zero_indent#RemoveIndent(lines) abort
    let minimun_indent_count = zero_indent#CountMinimumIndent(a:lines)
    let pattern = printf('^\s\{%d\}', minimun_indent_count)
    let indent_less_lines = []
    for l in a:lines
        call add(indent_less_lines, substitute(l, pattern, '', ""))
    endfor
    return indent_less_lines
endfunction

function! zero_indent#CountMinimumIndent(lines) abort
    let minimun_indent_count = 1000000
    for l in a:lines
        let indent = matchstr(l, '^\s*')
        let minimun_indent_count = min([strlen(indent), minimun_indent_count])
    endfor
    return minimun_indent_count
endfunction
