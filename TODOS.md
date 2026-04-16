# TODOS

## Context Accumulation Calculator

**What:** Build an interactive calculator that shows prospects the hidden cost of contractor churn vs. a retained engineer.

**Why:** Reframes the buying decision from "$9k/month vs hourly contractor" to "what does losing context every 3 months actually cost your team?" Gives you something concrete to send in outbound emails and forces you to quantify your own value proposition.

**How:** Single-page interactive tool. Prospect enters team size, codebase age, number of repos, contractor churn rate. Outputs: estimated ramp-up cost per new contractor, cumulative context loss, breakeven chart showing when a retained engineer becomes cheaper.

**Tech:** Vanilla JS in `source/javascripts/calculator.js`. Middleman serves JS natively via Sprockets. No new build pipeline needed. Could also be a dedicated page (`source/calculator.html.erb`) rather than a section on the index.

**Depends on:** Repositioned site ships first. Calculator teaser is already on the page as a static card.

**Origin:** Proposed by cross-model second opinion during /office-hours (2026-04-16). Design doc: `~/.gstack/projects/ronaldlangeveld-ronaldlangevelddotcom/ronaldlangeveld-main-design-20260416-111619.md`

## Design System (DESIGN.md)

**What:** Run `/design-consultation` to create a formal DESIGN.md for the site.

**Why:** Typography, colours, spacing, and component patterns are currently scattered across `site.scss` and the design doc. As the site evolves (calculator, more case studies, potential blog integration), a centralised design system prevents visual drift.

**How:** Run `/design-consultation` which produces a DESIGN.md with colour palette, typography scale, spacing system, and component patterns.

**Depends on:** Repositioned site ships first. The inline visual specs from /plan-design-review are sufficient for v1.

**Origin:** Flagged by /plan-design-review outside voice (2026-04-16).
