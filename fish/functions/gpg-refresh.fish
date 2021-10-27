function gpg-refresh -a cmd -d "update GPG terminal"
  command gpg-connect-agent updatestartuptty /bye 2>/dev/null
  set -xg GPG_TTY (tty)
end
