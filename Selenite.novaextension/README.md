# Selenite for Nova

**Selenite** is a color theme extension for [Nova](https://nova.app) ported
from Nikita Prokopov's [Alabaster](https://github.com/tonsky/sublime-scheme-alabaster)
color scheme for Sublime Text.

Selenite uses a minimal amount of highlighting. It only colors four things:

1. Strings
2. Constants (numbers, symbols, keywords, booleans)
3. Comments
4. Global definitions (functions, classes, methods, types being declared)

Everything else — including standard language keywords like `if`, `else`,
`function` — is left in the default text color on purpose.

## Included themes

Four variants, covering light/dark for two of Alabaster's three upstream
styles — Full and Mono. (Normal isn't included in this port.)

| Style  | Light               | Dark                     |
|--------|---------------------|---------------------------|
| Full   | Selenite Full        | Selenite Dark Full *      |
| Mono   | Selenite Mono        | Selenite Dark Mono        |

`*` **Selenite Dark Full does not exist upstream** — the original repo only
ships a light Full/BG variant. This port constructs a dark counterpart by
applying the same idea (tinted backgrounds instead of colored text) to
Selenite Dark's palette, so it's an original addition rather than a direct
port. Everything else is a faithful translation of the upstream
`.sublime-color-scheme` files.

Select a theme via **Nova → Settings → Theme**, or `Editor Theme` /
`Window Theme` separately if you want to mix, e.g., a dark window chrome
with a light editor.

## Notes on fidelity

Nova's theme CSS and Sublime's `.sublime-color-scheme` format don't expose
exactly the same hooks, so a few upstream details couldn't be carried over
1:1:

- **Nesting-depth bracket dimming.** Alabaster Dark/Mono dim brackets more
  the deeper they're nested (`meta.parens meta.parens punctuation.section`,
  etc). Nova's `bracket` class is flat with no nesting-depth selector, so
  this port uses the single (outermost-equivalent) treatment everywhere.
- **Generic punctuation dimming.** Sublime's plain `punctuation` scope (for
  things like commas/colons, distinct from brackets and operators) has no
  equivalent Nova class, so that specific dimming rule is dropped; brackets
  and operators are themed directly instead.
- **Current-line highlight, search-match highlight, bracket-match
  highlight, and misspelling color** aren't exposed as themeable selectors
  in Nova's documented theme API, so those upstream `globals` values have
  no home here.
- Sublime's `markup.inserted` / `.deleted` / `.changed` diff-highlight
  scopes don't have a Nova equivalent either.

The core experience — document background/foreground, cursor, gutter,
selection, indent guides, and all syntax highlighting for the four
Selenite classes — is fully ported.

Window chrome (titlebar/sidebar/buttons) has no upstream reference at all
(Sublime themes don't touch app chrome), so those colors were designed to
sit quietly next to each variant's editor palette.

## Credits

Original color scheme and design philosophy: [Nikita
Prokopov](https://github.com/tonsky). See the [upstream
README](https://github.com/tonsky/sublime-scheme-alabaster) for the full
rationale behind Alabaster's minimal approach, and his essay [Syntax
Highlighting](https://tonsky.me/blog/syntax-highlighting/) for the broader
argument behind coloring only a few categories of tokens.

## License

MIT — see `LICENSE.txt`.
