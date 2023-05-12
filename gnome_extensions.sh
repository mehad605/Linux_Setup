#!/bin/bash

# Define the list of links
    links=(
    "https://extensions.gnome.org/extension/1634/resource-monitor/"
    "https://extensions.gnome.org/extension/5237/rounded-window-corners/"
    "https://extensions.gnome.org/extension/4679/burn-my-windows/"
    "https://extensions.gnome.org/extension/3193/blur-my-shell/"
    "https://extensions.gnome.org/extension/3740/compiz-alike-magic-lamp-effect/"
    "https://extensions.gnome.org/extension/3210/compiz-windows-effect/"
    "https://extensions.gnome.org/extension/517/caffeine/"
    "https://extensions.gnome.org/extension/19/user-themes/"
    "https://extensions.gnome.org/extension/5338/aylurs-widgets/"
)

# Loop through the links and open each one in a new tab
for link in "${links[@]}"
do
  xdg-open "$link"
done