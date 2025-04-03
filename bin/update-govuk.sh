#! /bin/bash

TMPDIR=site/assets/govuk/tmp

# Remove the existing directory and create new
rm -rf site/assets/govuk
rm -rf site/_sass/govuk
mkdir -p $TMPDIR/govuk-frontend
mkdir -p $TMPDIR/govuk-frontend

# Get the latest version download URL
DOWNLOAD_URL=$(curl -s https://api.github.com/repos/alphagov/govuk-frontend/releases/latest \
    | grep tarball_url \
    | cut -d : -f 2,3 \
    | tr -d \",)

echo "Downloading latest release from $DOWNLOAD_URL"
curl -s -L -o $TMPDIR/govuk-frontend.tar.gz $DOWNLOAD_URL

echo "Unarchiving latest release"
tar -xzf $TMPDIR/govuk-frontend.tar.gz -C $TMPDIR/govuk-frontend

echo "Copying files"

# Copying Scss files
cp -r $TMPDIR/govuk-frontend/**/packages/govuk-frontend/src/govuk site/_sass/govuk
find site/_sass/govuk -type f -not -name '*.scss' -delete

# Copying JS files
cp -r $TMPDIR/govuk-frontend/**/dist/assets site/assets/govuk
cp $TMPDIR/govuk-frontend/**/dist/govuk-frontend-*.min.js site/assets/govuk/
cp $TMPDIR/govuk-frontend/**/dist/govuk-frontend-*.min.js.map site/assets/govuk/

rm -rf $TMPDIR
