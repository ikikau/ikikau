namespace :unicorn do

  task :environment do
    set :unicorn_pid, "#{shared_path}/tmp/pids/unicorn.pid"
    set :unicorn_config, "#{current_path}/config/unicorn.rb"
  end

  def start_unicorn
    within current_path do
      execute :bundle, :exec, :unicorn_rails, "-c #{fetch(:unicorn_config)} -E #{fetch(:stage)} -D"
    end
  end

  def stop_unicorn
    execute :kill, "-s QUIT $(< #{fetch(:unicorn_pid)})"
  end

  def reload_unicorn
    execute :kill, "-s USR2 $(< #{fetch(:unicorn_pid)})"
  end

  def force_stop_unicorn
    execute :kill, "$(< #{fetch(:unicorn_pid)})"
  end

  def increment_unicorn
    execute :kill, "-s TTIN $(< #{fetch(:unicorn_pid)})"
  end

  def decrement_unicorn
    execute :kill, "-s TTOU $(< #{fetch(:unicorn_pid)})"
  end

  def pstree_unicorn
    execute "cat '#{fetch(:unicorn_pid)}' | xargs pstree"
  end

  desc 'Start unicorn server'
  task start: :environment do
    on roles(:app) do
      start_unicorn
    end
  end

  desc 'Stop unicorn server gracefully'
  task stop: :environment do
    on roles(:app) do
      stop_unicorn
    end
  end

  desc 'Restart unicorn server gracefully'
  task restart: :environment do
    on roles(:app) do
      if test("[ -f #{fetch(:unicorn_pid)} ]")
        reload_unicorn
      else
        start_unicorn
      end
    end
  end

  desc 'Stop unicorn server immediately'
  task force_stop: :environment do
    on roles(:app) do
      force_stop_unicorn
    end
  end

  desc 'Increment number of unicorn worker processes'
  task increment: :environment do
    on roles(:app) do
      increment_unicorn
    end
  end

  desc 'Decrement number of unicorn worker processes'
  task decrement: :environment do
    on roles(:app) do
      decrement_unicorn
    end
  end

  desc 'Unicorn pstree (depends on pstree command)'
  task pstree: :environment do
    on roles(:app) do
      if test "[ -f #{fetch(:unicorn_pid)} ]"
        pstree_unicorn
      end
    end
  end

end
