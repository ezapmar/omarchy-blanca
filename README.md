# Blanca clipboard — an Omarchy bar widget

A button on the Omarchy bar for [Blanca](https://github.com/ezapmar/blanca), a clipboard
manager for Omarchy and macOS: everything you copy is kept, and one hotkey brings it back,
one clipping at a time.

Clicking the button opens the newest clippings in Omarchy's own menu, with Clear, Settings,
About and Check for Updates under them. Choosing a clipping puts it on the clipboard and,
unless you turn that off, pastes it where you were.

The icon is drawn in the bar's own text colour, so it follows your theme.

## What it needs

**Blanca itself.** This widget is only the button; the clippings, the history and the
hotkey are Blanca's, and the button runs `blanca menu`. Install Blanca first.

Take a specific release of its pacman package and verify it before installing it:

```bash
v=0.3.8
curl -fLO "https://github.com/ezapmar/blanca/releases/download/v$v/blanca-bin-$v-1-x86_64.pkg.tar.zst"
curl -fLO "https://github.com/ezapmar/blanca/releases/download/v$v/SHA256SUMS"
sha256sum -c --ignore-missing SHA256SUMS &&
  sudo pacman -U "blanca-bin-$v-1-x86_64.pkg.tar.zst"
```

Install 0.3.8 or newer. From 0.3.8 on, Blanca's own update checks the next package
against its release's `SHA256SUMS` before pacman sees it, and runs no script it
downloaded; an older Blanca updates without that check.

The release is an immutable tag, so what you install is the code that was reviewed. Then
run `blanca setup` once: it adds the `Ctrl+Alt+V` keybind, the clipboard watcher and the
window rules. Blanca 0.3.5 or newer leaves this widget alone when it finds it installed
here; an older Blanca writes a copy of the button itself, so install this one and let
`blanca setup` defer to it.

Blanca needs `wl-paste` (wl-clipboard) and `wtype`, which `blanca setup` tells you about if
they are missing. Nothing else: no service of its own, no network, no installer.

## Installing

From the plugin marketplace, or by hand:

```bash
omarchy plugin add https://github.com/ezapmar/omarchy-blanca.git --enable
```

To take it off the bar: `omarchy plugin disable io.github.ezapmar.blanca`, and to remove it
altogether: `omarchy plugin remove io.github.ezapmar.blanca`. Neither touches Blanca, your
clippings or your keybind.

## What it runs

One command, on a left click: `blanca menu`. There is no polling process, no timer and no
exec module behind the icon — the widget is a static icon until you click it.

## Licence

MIT, see [LICENSE](LICENSE). Blanca is MIT too.
