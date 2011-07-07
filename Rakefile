def puts_red(str)
  puts "  \e[00;31m#{str}\e[00m"
end
def puts_green(str)
  puts "  \e[00;32m#{str}\e[00m"
end
def puts_blue(str)
  puts "  \e[00;34m#{str}\e[00m"
end

# Create a simlink in the user's home directory from the files in ./home
# src - file name of a file in .home/
# dest - name of the symlink to create in $HOME
def symlink_home(src, dest)
  home_dir = ENV['HOME']
  if( !File.exists?(File.join(home_dir, dest)) || File.symlink?(File.join(home_dir, dest)) )
    # FileUtils.ln_sf was making odd nested links, and this works.
    FileUtils.rm(File.join(home_dir, dest)) if File.symlink?(File.join(home_dir, dest))
    FileUtils.ln_s(File.join(File.dirname(__FILE__), src), File.join(home_dir, dest))
    puts_green "  #{dest} -> #{src}"
  else
    puts_red "  Unable to symlink #{dest} because it exists and is not a symlink"
  end
end 

desc "Init and update submodules"
task :submodule do
  system "git submodule init"
  system "git submodule update"
end

desc "Compile Command-T plugin for vim"
task :"command-t" do
  if File.exists? "bundle/command-t"
    if system "cd bundle/command-t/ruby/command-t && ruby extconf.rb && make && make install"
      puts_green "Command-T installed. You win!"
    end
  else
    puts_red "Command T submodule not found, run `rake submodule` to fetch it"
  end
end

desc "create simlinks to the files in the user's home dir"
task :home do
  puts_blue "linking files"
  symlink_home('vimrc', '.vimrc')
  symlink_home('gvimrc', '.gvimrc')
end

desc "Update all bundles"
task :updatebundle do
  dir = File.dirname(__FILE__)
  Dir["bundle/*"].each do |n|
    puts "Updating #{n}"
    `cd #{n};git checkout master; git pull; cd #{dir}`
  end

end

desc "Install dotvim"
task :install do
  Rake::Task["home"].invoke
  Rake::Task["submodule"].invoke
  Rake::Task["command-t"].invoke
end
