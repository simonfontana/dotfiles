README
======

These are my dotfiles, managed with [yadm](https://yadm.io).
Instructions below are mostly for myself, but the project is public so that anyone can use it as a reference. Do so at your own risk.

> Work in progress: the setup is being rebuilt for Fedora with Sway, one item at a time, see [CHECKLIST.md](CHECKLIST.md).
> The old Ubuntu and i3 setup lives on the `master` branch.

## Install

yadm is not packaged for Fedora, so download a pinned release into `~/.local/bin`:

```
mkdir -p ~/.local/bin
curl -fLo ~/.local/bin/yadm https://github.com/yadm-dev/yadm/raw/3.5.0/yadm
chmod +x ~/.local/bin/yadm
```

To upgrade, run the same commands with a newer version number.

Clone into the home directory. yadm will not overwrite existing files, it reports the conflicts instead.

```
yadm clone -b main https://github.com/simonfontana/dotfiles.git
```
