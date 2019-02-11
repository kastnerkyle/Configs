#!/usr/bin/expect
# Example aliases:
#alias ssh_to_place="./ssh_login_expect.ex username@place"
#!/usr/bin/expect
set timeout 45

set passwd $::env(SSH_EXPECT_PW)
set postflags [lrange $argv 0 end]

spawn ssh -p 8002 {*}$postflags
expect "Password:"
send "$passwd\r";
interact
