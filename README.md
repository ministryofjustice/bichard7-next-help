# bichard7-next-help

A static site containing the help files for Bichard 7, built with Jekyll

## Running locally

To run the site locally for development, run

```bash
make run
```

This will install, build and run the site with Jekyll and run the dev server in watch mode so that it picks up any changes in the source. You can view the site on [http://localhost:4000/help/](http://localhost:4000/help/).

To test the built site and make sure there are no dead links / images, run:

```bash
make test
```

## Updating the `govuk-frontend`

We have a script which update the version, you can run this by:

```bash
./bin/update-govuk.sh
```

You will have to manually rename the JS files in the `site/_layouts/default.html` to match the version in the `site/assets/govuk` folder

```html
<script type="module" src="{{ site.baseurl }}/assets/govuk/govuk-frontend-5.9.0.min.js"></script>
<script type="module">
    import { initAll } from "{{ site.baseurl}}/assets/govuk/govuk-frontend-5.9.0.min.js"
    initAll()
</script>
```

You will have to go [GOV.UK Frontend](https://frontend.design-system.service.gov.uk/installing-with-npm/#get-the-javascript-working) to see if any of the commands for initialisation of the JS.
