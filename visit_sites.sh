#!/bin/bash


GREEN='\033[0;32m'  # Define the GREEN color
NC='\033[0m'  # Define the default color

# Define the list of links
section1=(
    "https://chrome.google.com/webstore/detail/competitive-companion/cjnmckjndlpiamhfimnnjmnckgghkjbl"
    "https://chrome.google.com/webstore/detail/grammarly-for-chrome/kbfnbcaeplbcioakkpcpgfkobkghlhen"
    "https://chrome.google.com/webstore/detail/print-friendly-pdf/ohlencieiipommannpdfcmfdpjjmeolj?hl=bn"
    "https://chrome.google.com/webstore/detail/tab-for-a-cause/gibkoahgjfhphbmeiphbcnhehbfdlcgo"
    "https://chrome.google.com/webstore/detail/video-speed-controller/nffaoalbilbmmfgbnbgppjihopabppdk"
    "https://chrome.google.com/webstore/detail/volume-master/jghecgabfgfdldnmbfkhmffcabddioke"
    "https://chrome.google.com/webstore/detail/zenmate-free-vpn%E2%80%93best-vpn/fdcgdnkidjaadafnichfpabhfomcebme"
    "https://chrome.google.com/webstore/detail/charcoal-dark-mode-for-me/aaekanoannlhnajolbijaoflfhikcgng"
    "https://chrome.google.com/webstore/detail/dark-reader/eimadpbcbfnmbkopoojfekhnkhdbieeh"
    "https://chrome.google.com/webstore/detail/free-download-manager/ahmpjcflkgiildlgicmcieglgoilbfdp"
    #brave-extensions done
)

    section2=("https://extensions.gnome.org/extension/1634/resource-monitor/"
    "https://extensions.gnome.org/extension/5237/rounded-window-corners/"
    "https://extensions.gnome.org/extension/4679/burn-my-windows/"
    "https://extensions.gnome.org/extension/3193/blur-my-shell/"
    "https://extensions.gnome.org/extension/3740/compiz-alike-magic-lamp-effect/"
    "https://extensions.gnome.org/extension/3210/compiz-windows-effect/"
    "https://extensions.gnome.org/extension/517/caffeine/"
    "https://extensions.gnome.org/extension/19/user-themes/"
    "https://extensions.gnome.org/extension/5338/aylurs-widgets/"
)

   section3=(
    "https://www.facebook.com/"
    "https://www.messenger.com/"
    "https://www.reddit.com/"
    "https://twitter.com/home"
    "https://www.twitch.tv/"
    "http://www.youtube.com/"
    "https://www.notion.so/"
    "https://habitica.com/"
    "https://www.bilibili.tv/en/anime"
    "https://www.webtoons.com/en/#"
    "https://myanimelist.net/animelist/Maruf605"
    "https://myanimelist.net/"
    "https://store.steampowered.com/"
    "https://www.epicgames.com/store/en-US/"
    "https://ubisoftconnect.com/en-US/dashboard/"
    "https://itch.io/my-feed"
    "https://www.gog.com/"
    "https://play.typeracer.com/"
    "https://monkeytype.com/"
    "https://chat.openai.com/chat"
    "https://chess.com/"
    #Google accounts
    "https://accounts.google.com/v3/signin/identifier?dsh=S-989664206%3A1676807599044047&continue=https%3A%2F%2Fmail.google.com%2Fmail%2F&emr=1&ltmpl=default&ltmplcache=2&osid=1&passive=true&rm=false&scc=1&service=mail&ss=1&flowName=GlifWebSignIn&flowEntry=ServiceLogin&ifkv=AWnogHd_OVxyShMmp0I3TjgjwAwKJhWTicsAkFY85Ybj88o-1T8CQwpFJTYwsAEhqj9hPvmCRfJz"
    "https://accounts.google.com/v3/signin/identifier?dsh=S-989664206%3A1676807599044047&continue=https%3A%2F%2Fmail.google.com%2Fmail%2F&emr=1&ltmpl=default&ltmplcache=2&osid=1&passive=true&rm=false&scc=1&service=mail&ss=1&flowName=GlifWebSignIn&flowEntry=ServiceLogin&ifkv=AWnogHd_OVxyShMmp0I3TjgjwAwKJhWTicsAkFY85Ybj88o-1T8CQwpFJTYwsAEhqj9hPvmCRfJz"
    "https://accounts.google.com/v3/signin/identifier?dsh=S-989664206%3A1676807599044047&continue=https%3A%2F%2Fmail.google.com%2Fmail%2F&emr=1&ltmpl=default&ltmplcache=2&osid=1&passive=true&rm=false&scc=1&service=mail&ss=1&flowName=GlifWebSignIn&flowEntry=ServiceLogin&ifkv=AWnogHd_OVxyShMmp0I3TjgjwAwKJhWTicsAkFY85Ybj88o-1T8CQwpFJTYwsAEhqj9hPvmCRfJz"
    "https://accounts.google.com/v3/signin/identifier?dsh=S-989664206%3A1676807599044047&continue=https%3A%2F%2Fmail.google.com%2Fmail%2F&emr=1&ltmpl=default&ltmplcache=2&osid=1&passive=true&rm=false&scc=1&service=mail&ss=1&flowName=GlifWebSignIn&flowEntry=ServiceLogin&ifkv=AWnogHd_OVxyShMmp0I3TjgjwAwKJhWTicsAkFY85Ybj88o-1T8CQwpFJTYwsAEhqj9hPvmCRfJz"
    "https://accounts.google.com/v3/signin/identifier?dsh=S-989664206%3A1676807599044047&continue=https%3A%2F%2Fmail.google.com%2Fmail%2F&emr=1&ltmpl=default&ltmplcache=2&osid=1&passive=true&rm=false&scc=1&service=mail&ss=1&flowName=GlifWebSignIn&flowEntry=ServiceLogin&ifkv=AWnogHd_OVxyShMmp0I3TjgjwAwKJhWTicsAkFY85Ybj88o-1T8CQwpFJTYwsAEhqj9hPvmCRfJz"
    "https://accounts.google.com/v3/signin/identifier?dsh=S-989664206%3A1676807599044047&continue=https%3A%2F%2Fmail.google.com%2Fmail%2F&emr=1&ltmpl=default&ltmplcache=2&osid=1&passive=true&rm=false&scc=1&service=mail&ss=1&flowName=GlifWebSignIn&flowEntry=ServiceLogin&ifkv=AWnogHd_OVxyShMmp0I3TjgjwAwKJhWTicsAkFY85Ybj88o-1T8CQwpFJTYwsAEhqj9hPvmCRfJz"
)

# Open each link in a new tab for section 1
for link in "${section1[@]}"
do
  xdg-open "$link"
done

# Wait for the browser window to be closed before proceeding to the next section
echo -e "${GREEN}Section 1 is done. Press Enter to continue to the next section...${NC}"
read

# Open each link in a new tab for section 2
for link in "${section2[@]}"
do
  xdg-open "$link"
done

# Wait for the browser window to be closed before proceeding to the next section
echo -e "${GREEN}Section 2 is done. Press Enter to continue to the next section...${NC}"
read

# Open each link in a new tab for section 3
for link in "${section3[@]}"
do
  xdg-open "$link"
done

# Wait for the browser window to be closed before exiting
echo -e "${GREEN}Section 3 is done. Press Enter to exit...${NC}"
read
