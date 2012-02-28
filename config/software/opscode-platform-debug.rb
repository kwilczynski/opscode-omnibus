name "opscode-platform-debug"
version "pc-rel-0.2.8"

dependencies ["ruby", "bundler", "postgresql", "rsync"]

source :git => "git@github.com:opscode/opscode-platform-debug"

relative_path "opscode-plaform-debug"

bundle_env = {"GEM_HOME" => nil, "GEM_PATH" => nil}
orgmapper_dir = "#{project_dir}/orgmapper"

build do
  # bundle install orgmapper
  command "#{install_dir}/embedded/bin/bundle install --without mysql", :env => bundle_env, :cwd => orgmapper_dir

  command "mkdir -p #{install_dir}/embedded/service/opscode-platform-debug"
  command "#{install_dir}/embedded/bin/rsync -a --delete --exclude=.git/*** --exclude=.gitignore ./ #{install_dir}/embedded/service/opscode-platform-debug/"
end