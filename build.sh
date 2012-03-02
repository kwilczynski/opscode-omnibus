#!/bin/bash -xe
sudo chef-solo -c /srv/opscode-omnibus/shared/solo.rb -j /srv/opscode-omnibus/shared/solo.json
cp omnibus.rb.example omnibus.rb
rm pkg/* || true
bundle install --deployment --without development
bundle exec rake projects:private-chef:deb