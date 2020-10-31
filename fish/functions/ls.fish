function ls --description 'List contents of directory'
    set -l opt --color=auto
            isatty stdout
            and set -a opt -hp
            command ls $opt $argv
end

