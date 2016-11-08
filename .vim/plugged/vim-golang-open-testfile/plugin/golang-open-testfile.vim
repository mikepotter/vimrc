function! GetGoTestFilename(filepath)

  if empty(matchstr(a:filepath, "_test"))
    return split(a:filepath, ".go$")[0] . "_test.go"
  else
    return split(a:filepath, "_test.go$")[0] . ".go"
  endif

endfunction

function! OpenGoTestFile()
  let fName = GetGoTestFilename(expand(bufname("%")))

  if filereadable(fName)
    exec(":vs " . fName)
    exec(":wincmd r")
  else
    echoerr "could not find " . fName
  endif

endfunction
