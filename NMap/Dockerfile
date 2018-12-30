FROM ubuntu:18.04

LABEL "com.github.actions.name"="NMap"
LABEL "com.github.actions.description"="NMaps Host And Uploads Findings To Issue"
LABEL "com.github.actions.icon"="cloud-lightning"
LABEL "com.github.actions.color"="Red"
LABEL "maintainer"="JGamblin <Jerry.Gamblin@Gmail.com>"

RUN apt-get update && apt-get install -y \
  curl \
  git \
  wget \
  nmap && \
  cd /usr/share/nmap/scripts/ && \
  git clone https://github.com/vulnersCom/nmap-vulners.git && \
  git clone https://github.com/scipag/vulscan.git && \
  ls vulscan/*.csv && \
  cd vulscan/utilities/updater/ && \
  chmod +x updateFiles.sh && \
  ./updateFiles.sh

ADD entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
