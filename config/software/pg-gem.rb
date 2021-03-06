#
# Copyright:: Copyright (c) 2012-2014 Chef Software, Inc.
# License:: Apache License, Version 2.0
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

name "pg-gem"
default_version "0.17.1"

dependency "ruby"
dependency "rubygems"

env = {
  'PATH' => "#{install_dir}/embedded/bin:#{ENV['PATH']}"
}

# env is so the pg gem can find the pg_config binary on the PATH so the
# correct library and header locations can be found
build do
  gem "install pg -n #{install_dir}/embedded/bin --no-rdoc --no-ri -v #{version}", :env => env
end
