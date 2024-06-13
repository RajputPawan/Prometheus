#!/bin/bash

export GEM_HOME=$HOME/.gem
export PATH=$HOME/.gem/ruby/2.7.0/bin:$PATH

#for focal
gem install --user-install bundler -v 2.4.22
gem install --user-install sass-embedded -v 1.54.2
gem install --user-install jekyll

bundle install
bundle exec jekyll serve
