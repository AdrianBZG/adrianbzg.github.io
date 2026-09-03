# bazaga.ai

Personal research website of **Adrián Bazaga** — Principal Research Scientist, Tech Lead (SLM) and Post-Training Lead at Microsoft, PhD from the University of Cambridge.

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
sitemap.xml, robots.txt, llms.txt
assets/
  css/redesign.css         # site design system (layered over main.css)
  js/                      # theme.js + dark_mode.js (themes), common.js
  img/                     # photo, paper figures, product images, social-card SVG and PNG
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
- **News** — add a `.rx-news-item` block at the top of the `#rx-news` timeline in `index.html`. It is static HTML so that crawlers and link previews can read it.
- **SEO** — each page carries its own `<title>`, meta description, Open Graph/Twitter tags and JSON-LD. Update the JSON-LD `Person` block in `index.html` when your role changes, and add new papers to the `ItemList` in `research/index.html`.
- **Social card** — edit `assets/img/og-card-1200x630.svg`, then export it at 1200×630 to `assets/img/og-card-1200x630.png`, which is referenced by every page's `og:image`.

## Deployment

Hosted on **GitHub Pages**, served directly from the `gh-pages` branch (no build or CI step). Day-to-day work happens on `master`; `make deploy` pushes `master` and force-mirrors it to `gh-pages`:

```bash
make deploy
```

## Credits

Originally bootstrapped from the [al-folio](https://github.com/alshedivat/al-folio) Jekyll theme by Maruan Al-Shedivat, since rebuilt as a bespoke static site.

## License

Code is released under the [MIT License](LICENSE). Site content and images © Adrián Bazaga.
