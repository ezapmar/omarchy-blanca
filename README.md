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
hotkey are Blanca's, and the button runs `blanca menu`. Install Blanca first — on Omarchy:

```bash
curl -fsSL https://raw.githubusercontent.com/ezapmar/blanca/master/install.sh | sh
```

Or take the [pacman package](https://github.com/ezapmar/blanca/releases/latest/download/blanca-x86_64.pkg.tar.zst)
from the latest release. Then run `blanca setup` once: it adds the `Ctrl+Alt+V` keybind,
the clipboard watcher and the window rules. Blanca 0.3.5 or newer leaves this widget alone
when it finds it installed here; an older Blanca writes a copy of the button itself, so
install this one and let `blanca setup` defer to it.

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
