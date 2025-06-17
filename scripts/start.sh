#!/usr/bin/env bash

REPO_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )/.." && pwd )"

parallel -j 4 --line-buffer --retry-failed <<END
bash $REPO_DIR/scripts/mavproxy/start_mavproxy.sh
bash $REPO_DIR/scripts/gstreamer/start_gstreamer.sh
bash $REPO_DIR/scripts/selk_rc_receiver/start_selk_rc_receiver.sh
bash $REPO_DIR/scripts/rov-temperature-broadcaster/start-rov-temperature-broadcaster.sh
END


