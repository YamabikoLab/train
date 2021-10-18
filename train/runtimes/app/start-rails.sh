#!/usr/bin/env bash
export PATH=$PATH:/home/train/.rbenv/shims
export PATH=$PATH:/home/train/homebrew/bin
bundle exec rdebug-ide --host 0.0.0.0 --port 1234 --dispatcher-port 26162 -- /var/www/html/bin/rails s -p 80 -b 0.0.0.0