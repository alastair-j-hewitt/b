# b: scan-to-pay prototype (Rails)

The most complete Rails version of the 2020 QR "scan to pay" prototype:

`home` → `scanner` (camera reads a QR code) → `transactions/:id` → `pin` → `summary`

## Run locally

Requires Ruby 2.6.3 (see `.ruby-version`), PostgreSQL, Bundler and Yarn.

```bash
bundle install
yarn install
bin/rails db:create
bin/rails server     # http://localhost:3000
bin/rails test
```

## Notes

- **Camera access needs HTTPS.** Browsers only allow `getUserMedia` on `https://` or `localhost`; test on a phone through a tunnel such as ngrok.
- **QR library.** Instascan is served from `public/js/instascan.min.js` (MIT licence alongside it); rawgit.com, the original source, has shut down. Instascan is unmaintained, so replace it before any real use.
- **Scanned content** travels in `sessionStorage` and is displayed with `textContent`, so it cannot inject HTML.
- **PIN** is posted, filtered from logs and only format-checked. Nothing is charged.
- **Transactions** are three hard-coded demo records in `PagesController::DEMO_TRANSACTIONS`.
- **Stack age.** Ruby 2.6 and Rails 5.2 are past end of life; upgrade before deploying anywhere public.
