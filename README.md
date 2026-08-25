# bazaga.ai

Personal research website of **Adrián Bazaga** — Senior Researcher and Post-Training Lead at Microsoft, PhD from the University of Cambridge.

Live at **[bazaga.ai](https://bazaga.ai)**.

## Overview

A fast, responsive static site with two pages:

- **Home** — [`index.html`](index.html): hero, about, research themes with paper figures, production impact (Aion / Mu), selected publications, news, experience, awards, and academic service.
- **Publications** — [`research/index.html`](research/index.html): the full publication list with links to papers and code.

Light and dark themes are supported, and the homepage **News** section is data-driven.

## Structure

```
index.html                 # homepage
research/index.html        # full publications list
404.html                   # error page
CNAME                      # custom domain (bazaga.ai)
sitemap.xml, robots.txt, feed.xml
assets/
  css/redesign.css         # site design system (layered over main.css)
  js/                      # theme.js + dark_mode.js (themes), news.js, common.js
  data/news.json           # news items rendered on the homepage
  img/                     # photo, paper figures, product images
  files/thesis.pdf         # PhD thesis
```

## Local preview

The site is plain static HTML with no build step:

```bash
make preview            # serves at http://127.0.0.1:4000
# or: python3 -m http.server 4000
```

## Editing

- **Content / layout** — edit `index.html` and `research/index.html` directly.
- **Styling** — edit [`assets/css/redesign.css`](assets/css/redesign.css).
- **News** — add an entry to [`assets/data/news.json`](assets/data/news.json); it renders automatically, no HTML changes needed.

## Deployment

Hosted on **GitHub Pages**, served directly from the `gh-pages` branch (no build or CI step — the served files are exactly what is committed). The `master` branch mirrors the same content. To publish changes, commit and push both branches:

```bash
git push origin gh-pages    # updates the live site
git push origin master      # keep master in sync
```

## Credits

Originally bootstrapped from the [al-folio](https://github.com/alshedivat/al-folio) Jekyll theme by Maruan Al-Shedivat, since rebuilt as a bespoke static site.

## License

Code is released under the [MIT License](LICENSE). Site content and images © Adrián Bazaga.
