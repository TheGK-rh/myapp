server '54.150.219.103',
 user: 'ryo',
 roles: %w[app db web],
 ssh_options: {
   port: 22,
   user: "ryo",
   keys: ["#{ENV.fetch('PRODUCTION_SSH_KEY')}"],
   forward_agent: true
 }
