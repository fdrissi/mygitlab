echo "Port 2222" >> /etc/ssh/ssh_config
cat gitlab.rb > /etc/gitlab/gitlab.rb
service ssh restart
(/opt/gitlab/embedded/bin/runsvdir-start &) && gitlab-ctl reconfigure && tail -f /dev/null
