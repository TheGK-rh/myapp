server '54.150.219.103', user: 'ryo', roles: %w[app db web]
set :ssh_options, {
  forward_agent: true,
  user: fetch(:user),
  keys: %w(~/.ssh/my-key.pem)
}
