# Selenite

Theme based on [Tonksy](https://tonsky.me/blog/syntax-highlighting/).

- Highlighting is a priority system. If everything is highlighted then nothing is
- Cap the palette at what you can recall from memory
- Highlight what's scarce
- Highlight constants
- Highlight declarations, not usages
- Never highlight keywords
- Dim punctuation so names lead
- A real comment is the most important text on screen
- Reserve red for errors
- Highlight with background fills, not text color
- Vary lightness across the palette
- No bold, no italics

## Roadmap

- [x] brackets and punctuation need to be de-emphasized
- [x] md elements need styling (header, bullets, anchors)
- [ ] all light bgs should all match
- [ ] more sample formats (svg, html, css, astro, md, yaml, react, js, env)
- [ ] ghosty theme
- [ ] drop normal variant (keep bg and mono)
- [ ] list old versions of the Nova and Ghostty themes on the demo page, with deep links to each

## Site & downloads

The demo page is published to https://brandonstephens.github.io/selenite/ by
the `Deploy Pages` GitHub Action (`.github/workflows/pages.yml`), which runs on
every push to `master`. It calls `./build-site.sh`, which copies `index.html` and
`demo.html` into `_site/` and builds the downloads linked from the demo page:

- `selenite-nova.zip` — `Selenite.novaextension`; double-click it after unzipping to install in Nova
- `selenite-ghostty.zip` — the Ghostty theme files and their install README

Run `./build-site.sh` locally to preview the output in `_site/` (gitignored).
To redeploy without a code change, run the workflow manually from the Actions tab.
