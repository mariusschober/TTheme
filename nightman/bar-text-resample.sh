#!/bin/bash
# Workaround for omacom/omarchy#10289: the transparent bar can keep the previous
# theme's text color when a theme switch's re-sample request is dropped. Once
# the switch has settled, nudge the bar's watcher so it samples the new
# wallpaper again. Remove once #13914 (or #14148) has landed.
(
  sleep 3
  touch "$HOME/.local/state/omarchy/current/theme/colors.toml"
) >/dev/null 2>&1 &
