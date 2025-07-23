#!/bin/bash

JEKYLL_ENV=production bundle exec jekyll b
cp _site/ ../website/
