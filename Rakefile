require 'rubygems'

desc "Run server"

  task :serverup do
    system 'rackup -p 3000'
  end

desc "Stop server"
  task :serverdown do
    system 'pkill -9 -f rackup'
  end
