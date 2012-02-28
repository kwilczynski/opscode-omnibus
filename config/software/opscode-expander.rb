name "opscode-expander"
version "pc-rel-1.0.0.1"

dependencies ["ruby", "bundler", "rsync"]

source :git => "git@github.com:opscode/opscode-expander"

relative_path "opscode-expander"

bundle_env = {"GEM_PATH" => nil, "GEM_HOME" => nil}

build do
  command "#{install_dir}/embedded/bin/bundle install --without mysql"
  command "mkdir -p #{install_dir}/embedded/service/opscode-expander"
  command "#{install_dir}/embedded/bin/rsync -a --delete --exclude=.git/*** --exclude=.gitignore ./ #{install_dir}/embedded/service/opscode-expander/"
end