name "libjpeg"
version "8d"

source :url => "http://www.ijg.org/files/jpegsrc.v8d.tar.gz",
       :md5 => "52654eb3b2e60c35731ea8fc87f1bd29"

relative_path "jpeg-8d"

configure_env = {
  "LDFLAGS" => "-L#{install_dir}/embedded/lib -I#{install_dir}/embedded/include",
  "CFLAGS" => "-L#{install_dir}/embedded/lib -I#{install_dir}/embedded/include",
  "LD_RUN_PATH" => "#{install_dir}/embedded/lib",
  "PATH" => "#{install_dir}/embedded/bin:#{ENV["PATH"]}"
}

build do
  command "./configure --prefix=#{install_dir}/embedded --enable-shared --enable-static", :env => configure_env
  command "mkdir -p #{install_dir}/embedded/man/man1"
  command "make", :env => {"LD_RUN_PATH" => "#{install_dir}/embedded/lib"}
  command "make install"
  command "rm -rf #{install_dir}/embedded/man"
end