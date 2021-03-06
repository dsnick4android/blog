# config valid for current version and patch releases of Capistrano
lock "~> 3.11.0"

set :application, "blog"
set :repo_url, "https://github.com/dsnick4android/blog.git"

server '192.168.17.160', roles: %w(app db)
set :ssh_options, user: 'dsnick'
set(:branch, proc { `git rev-parse --abbrev-ref HEAD`.chomp }.call)
set(:branch, ENV['BRANCH']) if ENV['BRANCH']
set :deploy_to, '/home/dsnick/www/blog' # => production
set :bundle_jobs, 4
set :format, :pretty
set :log_level, :debug
set :pty, true
append :linked_dirs, 'log', 'tmp/pids', 'sockets', 'public/static'
set :rvm_type, :user
set :rvm_ruby_version, '2.4.5'
set :default_env, rails_env: fetch(:stage)


# Default branch is :master
# ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp

# Default deploy_to directory is /var/www/my_app_name
# set :deploy_to, "/var/www/my_app_name"

# Default value for :format is :airbrussh.
# set :format, :airbrussh

# You can configure the Airbrussh format using :format_options.
# These are the defaults.
# set :format_options, command_output: true, log_file: "log/capistrano.log", color: :auto, truncate: :auto

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
# append :linked_files, "config/database.yml"

# Default value for linked_dirs is []
# append :linked_dirs, "log", "tmp/pids", "tmp/cache", "tmp/sockets", "public/system"

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for local_user is ENV['USER']
# set :local_user, -> { `git config user.name`.chomp }

# Default value for keep_releases is 5
# set :keep_releases, 5

# Uncomment the following to require manually verifying the host key before first deploy.
# set :ssh_options, verify_host_key: :secure
