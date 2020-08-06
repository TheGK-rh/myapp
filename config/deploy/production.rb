server '54.150.219.103', user: 'ryo', roles: %w{app db web}

set :ssh_options, {
  port: 22,
  forward_agent: true,
  keys: ['~/.ssh/myapp_key_rsa']
}
