(/opt/gitlab/embedded/bin/runsvdir-start &) && gitlab-ctl reconfigure
echo "Port 2222" >> /etc/ssh/ssh_config
cat gitlab.rb > /etc/gitlab/gitlab.rb
#echo -e "external_url 'https://localhost' \n
#		nginx['enable'] = true \n
#		nginx['redirect_http_to_https'] = true \n
#		nginx['redirect_http_to_https_port'] = 80 \n
#		nginx['ssl_certificate'] = \"/etc/gitlab/ssl/gitlab.crt\" \n
#		nginx['ssl_certificate_key'] = \"/etc/gitlab/ssl/gitlab.key\" \n
#		gitlab_rails['gitlab_shell_ssh_port'] = 2222" > /etc/gitlab/gitlab.rb
service ssh restart
(/opt/gitlab/embedded/bin/runsvdir-start &) && gitlab-ctl reconfigure && tail -f /dev/null
