FROM ubuntu:16.04
RUN apt-get update
RUN apt-get install -y curl openssh-server ca-certificates git
RUN apt install -y tzdata
EXPOSE 443 80 22
RUN curl https://packages.gitlab.com/install/repositories/gitlab/gitlab-ce/script.deb.sh | bash
RUN apt-get -y install gitlab-ce
RUN git clone https://github.com/fdrissi/mygitlab.git
WORKDIR mygitlab
ENTRYPOINT sh script.sh
#ENTRYPOINT (/opt/gitlab/embedded/bin/runsvdir-start &) && gitlab-ctl reconfigure && tail -f /dev/null
#docker run --name git -p 80:80 -p 443:443 -p 2222:22 -e "GITLAB_SHELL_SSH_PORT=2222" -ti gitlab
