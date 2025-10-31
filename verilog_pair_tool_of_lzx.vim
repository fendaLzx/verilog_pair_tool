" my verilog autopair tool
" 1. auto pair begin-end and etc. for verilog.
" 2. 

" useage:
" 1.add this file to ~/.vim/config/
" 2.append command to ~/.vimrc file:
" autocmd BufRead,BufNewFile *.v,*.vh,*.sv,*.svh source ~/.vim/config/verilog_pair_tool_of_lzx.vim
" author: lzx
" auto complete end when type begin<CR>
let s:pair_map = {
  \ 'begin': 'end',
  \ 'case': 'endcase',
  \ 'generate': 'endgenerate',
  \ 'module': 'endmodule',
  \ }

function! InsertPair()
  let line = getline('.')
  for [start, stop] in items(s:pair_map)
    if line =~ '\<' . start . '\>$'
      return "\<CR>" . stop . "\<Esc>O"
    endif
  endfor
  return "\<CR>"
endfunction

inoremap <expr> <CR> InsertPair()

