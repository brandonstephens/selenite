# Selenite for Ghostty

A port of the [Selenite](../Selenite.novaextension) Nova theme to
[Ghostty](https://ghostty.org). Same four variants, using each theme's
document background/foreground, cursor, selection, and 16-color terminal
palette from the Nova port.

| Style | Light              | Dark                    |
|-------|--------------------|--------------------------|
| Full  | Selenite Full      | Selenite Dark Full      |
| Mono  | Selenite Mono      | Selenite Dark Mono      |

## Install

Copy the theme file(s) you want into Ghostty's themes directory:

```sh
mkdir -p ~/.config/ghostty/themes
cp "Selenite Full" "Selenite Dark Full" "Selenite Mono" "Selenite Dark Mono" \
  ~/.config/ghostty/themes/
```

Then set one in `~/.config/ghostty/config`:

```
theme = Selenite Full
```

Or let Ghostty switch automatically with the system appearance:

```
theme = light:Selenite Full,dark:Selenite Dark Full
```

(swap in `Selenite Mono` / `Selenite Dark Mono` for the Mono pair). Run
`ghostty +list-themes` to confirm they're picked up.

## Notes

Terminal apps don't have a syntax tree the way an editor does, so there's
no equivalent to Selenite's four highlighting categories here — this port
only covers what a terminal theme actually controls: background,
foreground, cursor, selection, and the 16 ANSI colors, taken directly from
each Nova variant's own `terminal.*` and window/document colors.
