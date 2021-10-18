function gpg-refresh -a cmd -d "update GPG terminal"
  command gpg-connect-agent updatestartuptty /bye
  set -xg GPG_TTY (tty)
end
