server '54.150.219.103', user: 'ryo', roles: %w{app db web}

set :ssh_options, keys: '~/.ssh/myapp_key_rsa'