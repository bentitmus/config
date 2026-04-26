#!/usr/bin/env fish

brew update
brew upgrade
brew cleanup

sdk selfupdate
sdk update
sdk upgrade
sdk flush

juliaup update

rustup update
cargo install-update -a

ktsctl sync awk bash css fish javascript jq julia nu toml typescript

Rscript -e "update()"
