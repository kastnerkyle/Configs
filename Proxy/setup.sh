sudo apt-get install expect
chmod +x ssh_expect.ex
chmod +x ssh_forward_expect.ex
ln -s `pwd`/ssh_expect.ex ~/ssh_expect.ex
ln -s `pwd`/ssh_forward_expect.ex ~/ssh_forward_expect.ex
ln -s `pwd`/ssh_forward_functions.sh ~/ssh_forward_functions.sh

username="defaultusername"
proxyhost="defaultproxyhost"
password="defaultpassword"

echo "Enter username for the proxy host"
read username

echo "Enter proxy host DNS name or IP"
read proxyhost

echo "Password for username@proxyhost ... WARNING: will be stored in plain text!"
read password

echo "export DEFAULT_SSH_PROXY_HOST=$username@$proxyhost" >> ~/.bashrc
echo "export SSH_EXPECT_PW=$password" >> ~/.bashrc
echo "source ~/ssh_forward_functions.sh" >> ~/.bashrc
echo '# forwarding' >> ~/.bashrc
echo '# ssh -p 8000 -L 9999:localhost:9999 username@hostname -nNT' >> ~/.bashrc
echo 'function ssh_to_lab { expect ssh_expect.ex '"$username"'@$1; }' >> ~/.bashrc
echo 'function qssh { expect ssh_expect.ex '"$username"'@'"$proxyhost"'; }' >> ~/.bashrc
