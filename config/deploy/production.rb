server '54.150.219.103',
 user: 'ryo',
 roles: %w[app db web],
 ssh_options: {
   port: 22,
   user: "ryo",
   keys: %w('~/.ssh/myapp_key_rsa'),
   forward_agent: true
 }
