FROM linuxserver/nzbget
	
RUN \
  echo "**** install packages ****" && \
  apk add --no-cache \
    ffmpeg \
    git && \
  curl https://bootstrap.pypa.io/ez_setup.py -o - | python && \
  easy_install pip && \
  pip install requests \
    requests[security] \
    requests-cache \
    babelfish \
    'guessit<2' \
    'subliminal<2' \
    'stevedore==1.19.1' \
    python-dateutil \
    qtfaststart

RUN \
  echo "**** install sickbeard_mp4_automator ****" && \
  git clone git://github.com/mdhiggins/sickbeard_mp4_automator.git /sickbeard_mp4_automator/ && \
  touch /sickbeard_mp4_automator/info.log && \
  chown -R abc:abc /sickbeard_mp4_automator && \
  ln -s /config_mp4_automator/autoProcess.ini /sickbeard_mp4_automator/autoProcess.ini && \
  rm -rf \
    /tmp/* \
    /var/lib/apt/lists/* \
    /var/tmp/*

VOLUME /config_mp4_automator
