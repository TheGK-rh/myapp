#capistranoのバージョン固定
lock "~> 3.14.1"
#デプロイするアプリケーション名
set :application, "myapp"
#cloneするgitレポジトリ
set :repo_url, "git@github.com:TheGK-rh/myapp.git"
#deploy先のディレクトリ
set :deploy_to, 'var/www/rails/myapp'
#シンボリックリンクを貼るファイル
set :linked_files, fetch(:linked_files, []).push('config/setting.yml')
set :linked_files, fetch(:linked_files, []).push('config/database.yml')
#シンボリックリンクを貼るディレクトリ
set :linked_dirs, fetch(:linked_dirs, []).push('log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle', 'public/system')
set :linked_files, fetch(:linked_files, []).push('config/master.key')
#保持するバージョンの個数
set :keep_releases, 5
#rubyのバージョン
set :rbenv_ruby, '2.6.6'
#出力するログのレベル。
set :log_level, :debug
#コネクション機能
set :ssh_options, keepalive: true

namespace :deploy do
  desc 'Restart application'
  task :restart do
    invoke 'unicorn:restart'
  end

  desc 'Create database'
  task :db_create do
    on roles(:db) do |host|
      with rails_env: fetch(:rails_env) do
        within current_path do
          execute :bundle, :exec, :rake, 'db:create'
        end
      end
    end
  end

  desc 'Run seed'
  task :seed do
    on roles(:app) do
      with rails_env: fetch(:rails_env) do
        within current_path do
          execute :bundle, :exec, :rake, 'db:seed'
        end
      end
    end
  end

  after :publishing, :restart

  after :restart, :clear_cache do
    on roles(:web), in: :groups, limit: 3, wait: 10 do
    end
  end
end
