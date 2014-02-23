set :application, 'elizabeth_portfolio'
set :repo_url, 'git@bitbucket.org:lmcphetridge/elizabethportfolio.git'

#server "www.elizabethmcphetridge.com", :app, :web, :db, :primary => true
# ask :branch, proc { `git rev-parse --abbrev-ref HEAD`.chomp }

set :deploy_to, "/var/www/projects/"
set :scm, :git
set :branch, 'deployment_tests'
set :user, 'developer'
set :use_sudo, false
set :rails_env, "production"

set :deploy_via, :copy

set :ssh_options, { :forward_agent => true }

# set :format, :pretty
# set :log_level, :debug
# set :pty, true

# set :linked_files, %w{config/database.yml}
# set :linked_dirs, %w{bin log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system}

# set :default_env, { path: "/opt/ruby/bin:$PATH" }
 set :keep_releases, 5


namespace :deploy do

  desc 'Restart application'
  task :restart do
    on roles(:app), in: :sequence, wait: 5 do
      # Your restart mechanism here, for example:
      # execute :touch, release_path.join('tmp/restart.txt')
    end
  end

  after :restart, :clear_cache do
    on roles(:web), in: :groups, limit: 3, wait: 10 do
      # Here we can do anything such as:
      # within release_path do
      #   execute :rake, 'cache:clear'
      # end
    end
  end

  task :symlink_shared do 
      on "developer@www.elizabethmcphetridge.com" do
          execute "ln -nfs #{shared_path}/config/database.yml #{release_path}/config/database.yml"
          execute "ln -nfs #{shared_path}/assets #{release_path}/public/assets"
      end
  end
  
  after :finishing, 'deploy:cleanup'

end

before 'deploy:restart', 'deploy:symlink_shared'
