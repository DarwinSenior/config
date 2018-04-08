setlocal nofoldenable
setlocal foldlevelstart=0
setlocal include=^\\s*\\(from\\\|import\\)
setlocal includeexpr=substitute(v:fname, '\\.', '/', 'g')

let b:argwarp_tail_command = 1
let b:argwarp_wrap_closing_brace = 0
