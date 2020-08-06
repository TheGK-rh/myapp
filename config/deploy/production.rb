server '54.150.219.103',
user: "ryo",
roles: %w{app db web},
ssh_options: {
  port: 22,
  user: "ryo",
  forward_agent: true,
  keys: ['~/.ssh/myapp_key_rsa']
}
