FROM ubuntu:16.04
RUN apt-get update
RUN apt-get install -y curl openssh-server ca-certificates
RUN apt install -y tzdata
EXPOSE 443 80 22
RUN curl https://packages.gitlab.com/install/repositories/gitlab/gitlab-ce/script.deb.sh | bash
RUN apt-get -y install gitlab-ce
COPY gitlab.rb script.sh ./
ENTRYPOINT sh script.sh
#ENTRYPOINT (/opt/gitlab/embedded/bin/runsvdir-start &) && gitlab-ctl reconfigure && tail -f /dev/null
