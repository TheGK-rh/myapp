#unicornのpidファイル、設定ファイルのディレクトリを設定
namespace :unicorn do
  task :environment do
    set :unicorn_pid, "#{current_path}/tmp/pids/unicorn_pid"
    set :unicorn_config, "#{current_path}/config/unicorn/production.rb"
  end

  #unicornをスタートさせるメソッド
  def start_unicorn
    within current_path do
      execute :bundle, :exec, :unicorn, "-c #{fetch(:unicorn_config)} -E #{fetch(:rails_env)} -D"
    end
  end

  #unicornを停止させるメソッド
  def stop_unicorn
    execute :kill, "-s QUIT $(< #{fetch(:unicorn_pid)})"
  end

  #unicornを再起動するメソッド
  def force_stop_unicorn
    execute :kill, "$(< #{fetch(:unicorn_pid)})"
  end

  #unicornをスタートさせるtask
  desc "Start unicorn server"
  task start: :environment do
    on roles(:app) do
      start_unicorn
    end
  end

  #unicornを停止させるタスク
  desc "Stop unicorn server gracefully"
  task restart: :environment do
    if test("[ -f #{fetch(unicorn_pid)} ]")
      reload_unicorn
    else
      start_unicorn
  end

  #unicornを強制終了させるtask
  desc "Stop unicorn server immediately"
  task force_stop: :environment do
    on roles(:app) do
      force_stop_unicorn
    end
  end

end
