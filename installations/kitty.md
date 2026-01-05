# Kitty

Kitty + Nautilus fix:

Nautilus GUI apps (with [nautilus-open-any-terminal](https://github.com/Stunkymonkey/nautilus-open-any-terminal)) do not inherit shell PATH.

Kitty was installed in `~/.local/kitty.app/bin`, so Nautilus couldn’t find it.

Fix: expose kitty in a system PATH.

```zsh
sudo ln -s /home/minh711/.local/kitty.app/bin/kitty /usr/local/bin/kitty
```
