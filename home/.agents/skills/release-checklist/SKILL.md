---
name: release-checklist
description: Run this release checklist before any prod deployment, production deploy, go-live, website launch, or ship to prod. Verifies legal, security, SEO, performance, UX, and analytics readiness.
---

Production release gate. Run through every item before shipping to prod. No partial runs.

## Steps

1. Confirm release scope: production URL, what changed, rollback plan.
   - Done when you can state the URL under test and the deploy commit.
2. Check every item in Reference below against the production build (not dev). Mark each PASS, FAIL, or N/A with evidence (file path, URL, or command output).
   - Done when all 20 items have a verdict.
3. Report a table of verdicts. Block the release on any FAIL in items 3, 4, 18. For other FAILs, list the fix and let the user decide ship vs. fix.
   - Done when the user sees what blocks ship and what is advisory.

## Reference

### Legal

1. **Privacy policy page** — `/privacy` exists, linked from footer, covers data collected, cookies, contact. PASS when route returns 200 on prod build.
2. **Terms & conditions page** — `/terms` exists, linked from footer. PASS when route returns 200.
3. **Secrets off the frontend** — no API keys, tokens, or private URLs in client bundle. Check with `grep -rEn "sk-|AKIA|api[_-]?key|secret|BEGIN.*PRIVATE" src/ dist/` and inspect network calls + `NEXT_PUBLIC_` / `VITE_` / `PUBLIC_` vars. PASS when only public keys ship and secrets live server-side or in bindings/secrets store.
5. **Cookie consent banner** — banner shows on first visit if non-essential cookies, trackers, or embeds are used. Consent choice persists and blocks trackers until accepted. N/A only when zero non-essential cookies.

### Security / correctness

4. **Force HTTPS** — all HTTP redirects to HTTPS, HSTS enabled where hosted, no `http://` hardcodes or mixed-content warnings. PASS when `curl -I http://<prod-domain>` 301s to https.
16. **Fix broken links** — crawl internal links, nav, footer, CTA buttons. PASS when no 404s in internal links (`npx broken-link-checker` or manual click-through of prod build).
17. **Form validation** — every form validates client-side and server-side, shows inline errors, blocks empty/bad submits, handles failure states. Test one valid + one invalid submit per form.
18. **Spam protection** — public forms, comments, signups, and auth endpoints have CAPTCHA / Turnstile, rate limiting, or equivalent. See `turnstile-spin` skill when missing. PASS when bot submits are rejected.

### SEO / sharing

6. **Meta titles + descriptions** — every route has a unique `<title>` (50-60 chars) and `meta[name=description]` (120-160 chars). View source on key routes.
7. **Social preview image** — `og:title`, `og:description`, `og:image` (1200x630), `twitter:card` set and image resolves absolutely (`https://...`). Test with a link-preview debugger.
8. **Add a favicon** — `/favicon.ico` plus SVG/PNG + `apple-touch-icon` render in tab and bookmarks. PASS when no 404 for favicon and icon is visible.
9. **Sitemap + robots.txt** — `/sitemap.xml` lists canonical URLs, `/robots.txt` points at it and does not disallow prod. PASS when both return 200 on the prod domain.

### Performance / accessibility

10. **Alt text on images** — every meaningful `<img>` has descriptive `alt`; decorative images use `alt=""`. Grep for `<img` without `alt`.
11. **Compress your images** — images use modern formats (WebP/AVIF), are sized to display, lazy-load below fold. PASS when no image over ~300KB without justification and Lighthouse image audit is clean.
12. **Check page load speed** — run `web-perf` skill or Lighthouse on homepage + heaviest route. PASS when LCP < 2.5s, CLS < 0.1, INP < 200ms on mobile or a recorded exception exists.
13. **Fix color contrast** — body text meets WCAG AA (4.5:1, 3:1 for large text). Check with DevTools contrast audit or axe. PASS when zero contrast violations on key flows.
14. **Make it mobile friendly** — test at 390px width: no horizontal scroll, tap targets >= 44px, nav usable, no overlapping text. PASS on real-device or emulated check of top 3 pages.
15. **Custom 404 page** — unknown route renders branded 404 with nav/search/home link and returns HTTP 404 status (not 200). PASS when `/__missing-route-xyz` meets both.

### Growth

19. **Set up analytics** — privacy-respecting analytics fires pageviews + key events only after consent (if consent required), no PII in payloads. PASS when a prod visit appears in the dashboard.
20. **One clear call to action** — every key page has a single primary CTA above the fold with one next step. PASS when you can name the CTA per page in one sentence.

Source: pre-launch list from `IMG_9428.PNG` (millee.md reel, 20 items).
