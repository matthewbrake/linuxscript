curl \
  --silent \
  --show-error \
  https://raw.githubusercontent.com/tiny-pilot/tinypilot/master/get-tinypilot.sh | \
    bash - && \
  sudo reboot
