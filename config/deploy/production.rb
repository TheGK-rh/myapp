server '54.150.219.103',
 user: 'ryo',
 roles: %w[app db web],
 ssh_options: {
   port: 22,
   user: "ryo",
   keys: %w('ryohashiguchi@Ryos.local'),
   forward_agent: true
 }
