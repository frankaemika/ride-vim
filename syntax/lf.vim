" Vim syntax file
" Language: Lingua Franka files
" Latest Revision: 2018-02-21

if exists("b:current_syntax")
  finish
endif

let b:current_syntax = "lf"

function! TextEnableCodeSnip(filetype,start,end,textSnipHl) abort
  let ft=toupper(a:filetype)
  let group='textGroup'.ft
  if exists('b:current_syntax')
    let s:current_syntax=b:current_syntax
    " Remove current syntax definition, as some syntax files (e.g. cpp.vim)
    " do nothing if b:current_syntax is defined.
    unlet b:current_syntax
  endif
  execute 'syntax include @'.group.' syntax/'.a:filetype.'.vim'
  try
    execute 'syntax include @'.group.' after/syntax/'.a:filetype.'.vim'
  catch
  endtry
  if exists('s:current_syntax')
    let b:current_syntax=s:current_syntax
  else
    unlet b:current_syntax
  endif
  execute 'syntax region textSnip'.ft.'
  \ matchgroup='.a:textSnipHl.'
  \ start="'.a:start.'" end="'.a:end.'"
  \ contains=@'.group
endfunction

call TextEnableCodeSnip('lua', '@{', '}@', 'SpecialComment')

hi def link lfKeywordRequire        Include
hi def link lfLibIdentifier         Identifier

hi def link lfInteger               Number
hi def link lfFloat                 Float
hi def link lfNil                   Constant
hi def link lfBoolean               Boolean
hi def link lfString                String

hi def link lfBaseTypeIdentifiers   Type
hi def link lfTypeHead              Type

hi def link lfOperatorConnection    Operator
hi def link lfOperatorFirst         Error
hi def link lfOperatorLink          Operator

hi def link lfIdentifier            Identifier
hi def link lfConnectionDestination Identifier
hi def link lfPortName              Identifier
hi def link lfLink                  Underlined

hi def link lfKeyword               Keyword
hi def link lfKeywordPort           Keyword
hi def link lfActionKeyword         Function

hi def link lfOperatorKeywords      Statement

hi def link lfComment               Comment

" we don't highlight function calls in conditions etc. since lua also doesn't
"hi def link lfFunction Function

syn match   lfComment "\v--.*$"

syn match   lfOperatorConnection "->"
syn match   lfOperatorFirst "-->"
syn match   lfOperatorLink "<-" contained

syn region  lfString start=/\v"/ skip=/\v\\./ end=/\v"/

syn match   lfLibIdentifier '\h\w*' contained
syn keyword lfKeywordRequire require contained
syn match   lfRequireLine "require\s\+\h\w*"he=s+7 contains=lfLibIdentifier,lfKeywordRequire

syn match   lfIdentifier '\h\w*\s*{'me=e-1
syn match   lfIdentifier '\h\w*\s*<-'me=e-2
syn match   lfConnectionDestination '->\s*\h\w*'hs=s+2 contains=lfOperatorConnection

syn keyword lfKeyword entry exit action clientData where
syn keyword lfKeywordPort port contained
syn keyword lfActionKeyword entry exit action

syn match   lfPortName 'port\s\+\w\+' contains=lfKeywordPort

syn match   lfFunction '\h\w*('he=e-1
syn match   lfLink "<-\s*\h\w*"

syn keyword lfBaseTypeIdentifiers int float string bool
syn keyword lfTypeHead resultType parameterType

syn keyword lfNil nil
syn keyword lfBoolean true false
syn match   lfInteger '\d\+'
syn match   lfFloat '\d+.\d+'
syn keyword lfOperatorKeywords and or not if then else

