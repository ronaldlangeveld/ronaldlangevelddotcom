# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

Personal/consulting site for Ronald Langeveld. Built with **Middleman 4.5** (Ruby static site generator) with **Bulma 1.x** (SCSS) compiled via Dart Sass through Middleman's external pipeline.

## Commands

```bash
bundle install                 # install Ruby gems
npm install                    # install Bulma + Sass (first time / after package.json changes)
bundle exec middleman server   # dev server at http://localhost:4567 (sass runs in --watch)
bundle exec middleman build    # production build → build/ (sass runs with --style=compressed)
```

There is no test suite (`npm test` is a placeholder).

## Architecture

- **`config.rb`** wires the SCSS compile into Middleman as an `:external_pipeline`. In dev it runs `npx sass --load-path=node_modules --watch ./site.scss:.tmp/dist/stylesheets/site.css`; in build mode it runs with `--style=compressed --no-source-map`. The pipeline's `source: ".tmp/dist"` means the compiled CSS is merged into Middleman's asset pipeline from there — do **not** edit `.tmp/`.
- **`site.scss`** (repo root — intentionally **not** under `source/`) is the single SCSS entry. It does `@use "bulma/bulma";` to pull in all of Bulma, resolved via the `--load-path=node_modules` flag on the sass command. Bulma variable overrides go **above** the `@use` line. Custom CSS goes below it. Keeping this file at the repo root avoids Middleman also serving it as an asset (which would produce a stale extensionless `site` file in `build/stylesheets/`).
- **`source/layouts/layout.erb`** is the single site layout. Links the compiled stylesheet via `stylesheet_link_tag "site"`. Also holds the site-wide SEO/OG/Twitter meta (see local vars at the top of the `<head>` — `site_url`, `page_title`, `page_description`, `page_image` — overridden per-page via frontmatter).
- **`source/index.html.erb`** is a thin manifest of partial includes — the page is assembled from `source/partials/_navbar.erb`, `_hero.erb`, `_case_study.erb`, `_timeline.erb`, `_pricing.erb`, `_portfolio.erb`, `_calculator_teaser.erb`, `_footer.erb`. Edit the partial for that section, not the index. Front matter on `index.html.erb` provides `title`. XML/JSON/TXT pages render without a layout.
- **`data/*.rb`** holds structured Ruby data consumed by partials (currently `data/logos.rb` → `SiteData::LOGOS` and `data/repos.rb` → `SiteData::REPOS`). `config.rb` requires these files at boot and exposes them to templates via `logos` / `repos` helpers. Note: Middleman's built-in `data.*` loader only parses YAML/JSON in `data/`, so the `.rb` files here don't collide with that convention.
- The `middleman-autoprefixer` gem in `Gemfile` is unused but harmless.

## Conventions

- Styling is **Bulma class-first** in the ERB (`navbar`, `hero`, `container`, `title`, etc.). Customize Bulma by overriding its Sass variables in `site.scss` *before* `@use "bulma/bulma"` — see the comment block at the top of that file for the syntax.
- Build output (`build/`) and `.tmp/` are gitignored; never commit them.
- `node_modules/` is gitignored; `package.json` is the source of truth for Bulma / Sass versions.

## gstack

Use the `/browse` skill from gstack for all web browsing. Never use `mcp__claude-in-chrome__*` tools.

### Available skills

- `/office-hours`
- `/plan-ceo-review`
- `/plan-eng-review`
- `/plan-design-review`
- `/design-consultation`
- `/design-shotgun`
- `/design-html`
- `/review`
- `/ship`
- `/land-and-deploy`
- `/canary`
- `/benchmark`
- `/browse`
- `/connect-chrome`
- `/qa`
- `/qa-only`
- `/design-review`
- `/setup-browser-cookies`
- `/setup-deploy`
- `/retro`
- `/investigate`
- `/document-release`
- `/codex`
- `/cso`
- `/autoplan`
- `/plan-devex-review`
- `/devex-review`
- `/careful`
- `/freeze`
- `/guard`
- `/unfreeze`
- `/gstack-upgrade`
- `/learn`

## Skill routing

When the user's request matches an available skill, ALWAYS invoke it using the Skill
tool as your FIRST action. Do NOT answer directly, do NOT use other tools first.
The skill has specialized workflows that produce better results than ad-hoc answers.

Key routing rules:
- Product ideas, "is this worth building", brainstorming → invoke office-hours
- Bugs, errors, "why is this broken", 500 errors → invoke investigate
- Ship, deploy, push, create PR → invoke ship
- QA, test the site, find bugs → invoke qa
- Code review, check my diff → invoke review
- Update docs after shipping → invoke document-release
- Weekly retro → invoke retro
- Design system, brand → invoke design-consultation
- Visual audit, design polish → invoke design-review
- Architecture review → invoke plan-eng-review
- Save progress, checkpoint, resume → invoke checkpoint
- Code quality, health check → invoke health
