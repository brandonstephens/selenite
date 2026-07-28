# Changelog

## 1.0.0

- Initial release.
- Ported Selenite Full and Selenite Mono from
  [tonsky/sublime-scheme-alabaster](https://github.com/tonsky/sublime-scheme-alabaster).
- Added Selenite Dark Full, a dark counterpart to Selenite Full that doesn't
  exist upstream, derived from Selenite Dark's palette using the same
  background-tint approach as the light Full variant.
- Dimmed brackets and operators below body text in all four variants,
  matching upstream Alabaster's own punctuation-dimming colors where they
  exist (Selenite Full, Selenite Dark Full/Mono) or reusing an existing grey
  from the same palette where they don't (Selenite Mono).
- Styled Markdown in all four variants: heading/list markers and link
  brackets dim like punctuation, heading/link text stays in the default
  text color, and inline code reuses each variant's string treatment.
  (Blockquote markers are left as-is — Nova's Markdown grammar doesn't
  emit a highlight scope for them, so they can't be dimmed.)
- Switched constants to a tinted background in Selenite Full and Selenite
  Dark Full, matching the comment/string/definition treatment. Upstream
  Alabaster BG leaves constants as colored text (its own background rule
  for this is present but commented out); we use that unused magenta tint
  instead for consistency across the Full variants.
