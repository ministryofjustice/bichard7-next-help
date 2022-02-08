#!/bin/bash

bundle exec jekyll build
bundle exec htmlproofer --disable-external ./_site