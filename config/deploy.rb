set :application, 'elizabeth_portfolio'
set :repo_url, 'git@bitbucket.org:lmcphetridge/elizabethportfolio.git'

#server "www.elizabethmcphetridge.com", :app, :web, :db, :primary => true
# ask :branch, proc { `git rev-parse --abbrev-ref HEAD`.chomp }

set :deploy_to, "/var/www/projects/"
set :scm, :git
set :branch, 'master'
set :user, 'developer'
set :use_sudo, false
set :rails_env, "production"

set :deploy_via, :copy

set :ssh_options, { :forward_agent => true }

set :linked_files, %w{config/database.yml}
set :linked_dirs, %w{public/assets/uploaded_images}


# set :default_env, { path: "/opt/ruby/bin:$PATH" }
set :keep_releases, 5

namespace :deploy do
    namespace :assets do
        desc 'Run the precompile task locally before deploying'
        task :precompile do
            %x{rake assets:precompile RAILS_ENV=production}
            %x{rsync --recursive --times --rsh=ssh --compress --human-readable --progress public/assets developer@www.elizabethmcphetridge.com:#{release_path}}
            %x{rake assets:clobber}
        end
    end

    desc 'Restart application'
    task :restart  do
        on "developer@www.elizabethmcphetridge.com" do
            execute "sudo /etc/init.d/thin restart"
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

    after :finishing, 'deploy:cleanup'
end
