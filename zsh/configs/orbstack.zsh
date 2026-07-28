# OrbStack's installer writes this line into ~/.zprofile, which rcm symlinks
# into the thoughtbot clone -- so it lives here instead. Has to load before
# compinit (thoughtbot runs it in zsh/configs/post/completion.zsh) because
# init.zsh does fpath+= for orb's completions; the main configs phase does.
if [ -f "$HOME/.orbstack/shell/init.zsh" ]; then
  . "$HOME/.orbstack/shell/init.zsh"
fi
