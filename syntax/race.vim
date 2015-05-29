" Vim syntax file
" Language: RACE files
" Maintainer: Nico Blodow
" Latest Revision: 5.5.2015

if exists("b:current_syntax")
  finish
endif

let b:current_syntax = "race"

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

hi def link raceKeywordRequire        Include
hi def link raceLibIdentifier         Identifier

hi def link raceInteger               Number
hi def link raceFloat                 Float
hi def link raceNil                   Constant
hi def link raceBoolean               Boolean
hi def link raceString                String

hi def link raceBaseTypeIdentifiers   Type
hi def link raceTypeHead              Type

hi def link raceOperatorConnection    Operator
hi def link raceOperatorFirst         Error
hi def link raceOperatorLink          Operator

hi def link raceIdentifier            Identifier
hi def link raceConnectionDestination Identifier
hi def link racePortName              Identifier
hi def link raceLink                  Underlined

hi def link raceKeyword               Keyword
hi def link raceKeywordPort           Keyword
hi def link raceActionKeyword         Function

hi def link raceOperatorKeywords      Statement

hi def link raceComment               Comment

" we don't highlight function calls in conditions etc. since lua also doesn't
"hi def link raceFunction Function

syn match   raceComment "\v--.*$"

syn match   raceOperatorConnection "->"
syn match   raceOperatorFirst "-->"
syn match   raceOperatorLink "<-" contained

syn region  raceString start=/\v"/ skip=/\v\\./ end=/\v"/

syn match   raceLibIdentifier '\h\w*' contained
syn keyword raceKeywordRequire require contained
syn match   raceRequireLine "require\s\+\h\w*"he=s+7 contains=raceLibIdentifier,raceKeywordRequire

syn match   raceIdentifier '\h\w*\s*{'me=e-1
syn match   raceIdentifier '\h\w*\s*<-'me=e-2
syn match   raceConnectionDestination '->\s*\h\w*'hs=s+2 contains=raceOperatorConnection

syn keyword raceKeyword entry exit action clientData where
syn keyword raceKeywordPort port contained
syn keyword raceActionKeyword entry exit action

syn match   racePortName 'port\s\+\w\+' contains=raceKeywordPort

syn match   raceFunction '\h\w*('he=e-1
syn match   raceLink "<-\s*\h\w*"

syn keyword raceBaseTypeIdentifiers int float string bool
syn keyword raceTypeHead resultType parameterType

syn keyword raceNil nil
syn keyword raceBoolean true false
syn match   raceInteger '\d\+'
syn match   raceFloat '\d+.\d+'
syn keyword raceOperatorKeywords and or not if then else

