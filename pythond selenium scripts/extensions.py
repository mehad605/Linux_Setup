import requests
import os

extension_links = [
    'https://chrome.google.com/webstore/detail/competitive-companion/cjnmckjndlpiamhfimnnjmnckgghkjbl',
    'https://chrome.google.com/webstore/detail/grammarly-for-chrome/kbfnbcaeplbcioakkpcpgfkobkghlhen',
    'https://chrome.google.com/webstore/detail/print-friendly-pdf/ohlencieiipommannpdfcmfdpjjmeolj?hl=bn',
    'https://chrome.google.com/webstore/detail/tab-for-a-cause/gibkoahgjfhphbmeiphbcnhehbfdlcgo',
    'https://chrome.google.com/webstore/detail/video-speed-controller/nffaoalbilbmmfgbnbgppjihopabppdk',
    'https://chrome.google.com/webstore/detail/volume-master/jghecgabfgfdldnmbfkhmffcabddioke',
    'https://chrome.google.com/webstore/detail/zenmate-free-vpn%E2%80%93best-vpn/fdcgdnkidjaadafnichfpabhfomcebme',
    'https://chrome.google.com/webstore/detail/charcoal-dark-mode-for-me/aaekanoannlhnajolbijaoflfhikcgng',
    'https://chrome.google.com/webstore/detail/gnome-shell-integration/gphhapmejobijbbhgpjhcjognlahblep',
    'https://chrome.google.com/webstore/detail/dark-reader/eimadpbcbfnmbkopoojfekhnkhdbieeh',
    'https://chrome.google.com/webstore/detail/free-download-manager/ahmpjcflkgiildlgicmcieglgoilbfdp',
    # Add more extension links here
]



if not os.path.exists('extensions'):
    os.mkdir('extensions')


for link in extension_links:
    # Extract the extension ID from the link
    extension_id = link.split('/')[-1]

    # Build the URL for the CRX file
    crx_url = f'https://clients2.google.com/service/update2/crx?response=redirect&prodversion=84.0.4147.89&x=id%3D{extension_id}%26installsource%3Dondemand%26uc'

    # Send a request to download the CRX file
    response = requests.get(crx_url)

    # Save the CRX file
    with open(f'extensions/{extension_id}.crx', 'wb') as f:
        f.write(response.content)