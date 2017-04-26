#!/usr/bin/expect
# Example aliases:
#alias ssh_to_place="./ssh_login_expect.ex username@place"
#!/usr/bin/expect
set timeout 20

set passwd $::env(SSH_EXPECT_PW)
set host $::env(DEFAULT_SSH_PROXY_HOST)
set portflag [lindex $argv 0] 
set postflags [lrange $argv 1 end]

spawn ssh -L $portflag:localhost:$portflag $host {*}$postflags
expect "password:"
send "$passwd\r";
interact
