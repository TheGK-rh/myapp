server '54.150.219.103', user: 'ryo', roles: %w[app db web]
set :ssh_options, {
  forward_agent: true,
  user: 'ryo',
  keys: '~/.ssh/my-key.pem'
}
