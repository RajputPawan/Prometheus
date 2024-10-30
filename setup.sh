#!/bin/bash
set -ex
DEPS='
build-essential
ruby-bundler
ruby-full
zlib1g-dev
'
for dep in $DEPS; do
    /usr/bin/apt list --installed "$dep" ||
        sudo apt-get install "$dep"
done
# Install Ruby Gems to ~/gems
grep GEM_HOME ~/.bashrc || echo 'export GEM_HOME="$HOME/gems"' >> ~/.bashrc
grep -F /gems/ ~/.bashrc || echo 'export PATH="$PATH:$HOME/gems/bin"' >> ~/.bashrc
env | grep GEM_HOME || . ~/.bashrc
gem install jekyll bundler
#sudo chown -R $USER _site/
bundle install
bundle exec jekyll serve
