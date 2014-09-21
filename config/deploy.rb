lock '3.2.1'

set :application, 'ikikau'

set :keep_releases, 5

set :scm,      :git
set :repo_url, 'git@bitbucket.org:marcierge_project/ikikau.git'

set :rvm_type,         :user
set :rvm_ruby_version, 'ruby-2.1.1@ikikau'
set :rvm_custom_path,  '~/.rvm'

set :user,       'webapp'
set :use_sudo,   false
set :deploy_to,  '/home/webapp/project/ikikau.com'
set :deploy_via, :remote_cache

set :linked_dirs, %w[log tmp/pids tmp/cache tmp/sockets public/assets]


namespace :deploy do

  desc 'Restart application'
  task :restart do
    on roles(:web), in: :sequence, wait: 5 do
      if ENV['downless']
        invoke 'unicorn:restart'
      else
        invoke 'unicorn:stop'
        invoke 'unicorn:start'
      end
    end
  end

  desc 'Restart jobs'
  task :restart_jobs do
    invoke 'delayed_job:restart'
  end

  desc 'Run rake tasks'
  task :run_rake_tasks do
    on roles(:web), in: :sequence, wait: 5 do
      within current_path do
        # execute :bundle, :exec, :rake, 'dely:setup', "RAILS_ENV=#{fetch(:rails_env)}"
      end
    end
  end


  after :publishing, :restart
  after :publishing, :restart_jobs

  before :restart, :run_rake_tasks
  after :restart, 'deploy:cleanup'

end
