hook global BufCreate .*\.(sv|svh)$ %{
  set-option buffer filetype sv
}

add-highlighter shared/sv regions
add-highlighter shared/sv/code default-region group
add-highlighter shared/sv/comment region // $ fill comment
add-highlighter shared/sv/macro region %{^\h*`} %{(?<!\\)\n} group
add-highlighter shared/sv/macro/ fill meta

evaluate-commands %sh{
  keywords="accept_on|alias|always|always_comb|always_ff|always_latch|assert|assign|assume"
  keywords="${keywords}|before|begin|bind|bins|binsof|break|buf|bufif0|bufif1|case"
  keywords="${keywords}|casex|casez|cell|checker|class|clocking|cmos|config|constraint"
  keywords="${keywords}|context|continue|cover|covergroup|coverpoint|cross|deassign|default"
  keywords="${keywords}|defparam|design|disable|dist|do|edge|else|end|endcase|endchecker"
  keywords="${keywords}|endclass|endclocking|endconfig|endfunction|endgenerate|endgroup"
  keywords="${keywords}|endinterface|endmodule|endpackage|endprimitive|endprogram|endproperty"
  keywords="${keywords}|endspecify|endsequence|endtable|endtask|enum|event|expect"
  keywords="${keywords}|export|extends|extern|final|first_match|for|force|foreach|forever|fork"
  keywords="${keywords}|forkjoin|function|generate|genvar|global|highz0|highz1|if|iff|ifnone"
  keywords="${keywords}|ignore_bins|illegal_bins|implements|implies|import|incdir|include"
  keywords="${keywords}|initial|inout|input|instance|interconnect|interface"
  keywords="${keywords}|join|join_any|join_none|large|let|liblist|library|local|localparam"
  keywords="${keywords}|macromodule|medium|modport|module|negedge|nettype|new"
  keywords="${keywords}|nexttime|nmos|noshowcancelled|notif0|notif1|output|package"
  keywords="${keywords}|packed|parameter|pmos|posedge|primitive|priority|program|property"
  keywords="${keywords}|protected|pull0|pull1|pulldown|pullup|pulsestyle_ondetect|pulsestyle_onevent"
  keywords="${keywords}|pure|rand|randc|randcase|randsequence|rcmos|ref|reject_on|release"
  keywords="${keywords}|repeat|restrict|return|rnmos|rpmos|rtran|rtranif0|rtranif1|s_always"
  keywords="${keywords}|s_eventually|s_nexttime|s_until|s_until_with|scalared|sequence"
  keywords="${keywords}|showcancelled|signed|small|soft|solve|specify|specparam|strong"
  keywords="${keywords}|strong0|strong1|struct|super|supply0|supply1|sync_accept_on|sync_reject_on"
  keywords="${keywords}|table|tagged|task|throughout|timeprecision|timeunit|tran|tranif0"
  keywords="${keywords}|tranif1|tri|tri0|tri1|triand|trior|trireg|type|typedef|union|unique"
  keywords="${keywords}|unique0|unsigned|until|until_with|untyped|use|vectored|virtual|wait"
  keywords="${keywords}|wait_order|wand|weak|weak0|weak1|while|wildcard|with|within|xor|xnor|xor"
  keywords="${keywords}|and|nand|nor|not|or"
  types="bit|byte|chandle|int|integer|logic|longint|real|realtime|reg|shortint|shortreal"
  types="${types}|string|time|uwire|var|void|wire"
  values="null|this"
  operators="eventually|inside|intersect|matches"
  attributes="automatic|const|static"
  printf %s\\n "hook global WinSetOption filetype=sv %{
    set-option window static_words ${keywords} ${types} ${values} ${operators} ${attributes}
  }" | tr | '|' ' '
  printf %s "
    add-highlighter shared/sv/code/ regex \b(${keywords})\b 0:keyword
    add-highlighter shared/sv/code/ regex \b(${types})\b 0:type
    add-highlighter shared/sv/code/ regex \b(${values})\b 0:value
    add-highlighter shared/sv/code/ regex \b(${operators})\b 0:operator
    add-highlighter shared/sv/code/ regex \b(${attributes})\b 0:attribute
  "
}

define-command -hidden sv-indent-on-new-line %< evaluate-commands -draft -itersel %<
  execute-keys \;
  try %<
    # do nothing if previously a comment
    execute-keys -draft <a-?>/\*<ret> <a-K>^\h*[^/*\h]<ret>
  > catch %<
    # if closed paren, copy indent of opening paren line
    execute-keys -draft k<a-x> 1s(\))(\h+\w+)*\h*(\;\h*)?$<ret> m<a-\;>] <a-S> 1<a-&>
  > catch %<
    # copy indent from previous line
    execute-keys -draft K <a-&>
  >
  # remove empty lines
  try %< execute-keys -draft k <a-x> <a-k>^\h+$<ret> Hd >
  # indent after opening brace or parens
  try %< execute-keys -draft k <a-x> s[{(]\h*$<ret> j <a-gt> >
> >

hook -group sv-highlight global WinSetOption filetype=sv %{ add-highlighter window/sv ref sv }

hook global WinSetOption filetype=sv %{
  hook window InsertChar \n -group sv-indent sv-indent-on-new-line
  hook window ModeChange insert:.* -group sv-indent %{ try %{ execute-keys -draft \; <a-x> s ^\h+$ <ret> d } }
}

hook -group sv-highlight global WinSetOption filetype=(?!sv).* %{ remove-highlighter window/sv }

hook global WinSetOption filetype=(?!sv).* %{
  remove-hooks window sv-indent
}

