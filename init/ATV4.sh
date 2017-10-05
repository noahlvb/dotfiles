#!/bin/sh

sudo -v

# Install xscreensaver and addons:

sudo apt-get install -y \
    xscreensaver xscreensaver-data-extra \
    xscreensaver-gl xscreensaver-gl-extra mpv

# Uninstall the gnome-screensaver package:

sudo apt-get remove -y gnome-screensaver

# Make GNOME's "Lock Screen" use xscreensaver:

sudo ln -sf /usr/bin/xscreensaver-command \
            /usr/bin/gnome-screensaver-command

# Turn off Unity's built-in blanking.
# NOTE: For more options see 'gsettings list-keys org.gnome.desktop.screensaver'

# These two are equivalent to going to "System Settings / Brightness & Lock" and:
# * Setting "Turn screen off when inactive for" to "Never"
# * Switching the "Lock" toggle button to OFF
gsettings set org.gnome.desktop.session idle-delay 0
gsettings set org.gnome.desktop.screensaver lock-enabled false

# Configure xscreensaver as a startup application:

sudo mkdir -p ~/.config/autostart

sudo echo "[Desktop Entry]
Type=Application
Exec=xscreensaver -nosplash
Hidden=false
NoDisplay=false
X-GNOME-Autostart-enabled=true
Name[en_US]=xscreensaver
Name=xscreensaver
Comment[en_US]=
Comment=
" > ~/.config/autostart/xscreensaver.desktop

# Installing the ATV4 screensaver
sudo wget https://raw.githubusercontent.com/graysky2/xscreensaver-aerial/master/atv4.sh -O /usr/lib/xscreensaver/atv4
sudo chmod +x /usr/lib/xscreensaver/atv4

# run this from /opt/ATV4 which you created and assigned 755 premissions manually

sudo mkdir /opt/ATV4
sudo chmod 755 /opt/ATV4

url="http://a1.phobos.apple.com/us/r1000/000/Features/atv/AutumnResources/videos"
for i in b10-1.mov b10-2.mov b10-3.mov b10-4.mov b1-1.mov b1-2.mov b1-3.mov b1-4.mov \
	b2-1.mov b2-2.mov b2-3.mov b2-4.mov b3-1.mov b3-2.mov b3-3.mov b4-1.mov b4-2.mov \
	b4-3.mov b5-1.mov b5-2.mov b5-3.mov b6-1.mov b6-2.mov b6-3.mov b6-4.mov b7-1.mov \
	b7-2.mov b7-3.mov b8-1.mov b8-2.mov b8-3.mov b9-1.mov b9-2.mov b9-3.mov \
	comp_GL_G004_C010_v03_6Mbps.mov comp_DB_D011_D009_SIGNCMP_v15_6Mbps.mov \
	comp_HK_H004_C008_v10_6Mbps.mov comp_LA_A009_C009_t9_6M_tag0.mov \
	comp_C002_C005_0818SC_001_v01_6M_HB_tag0.mov comp_GL_G010_C006_v08_6Mbps.mov \
	comp_LW_L001_C006_t9_6M_tag0.mov comp_DB_D011_C010_v10_6Mbps.mov \
	comp_LA_A005_C009_v05_t9_6M.mov comp_HK_B005_C011_t9_6M_tag0.mov \
	plate_G002_C002_BG_t9_6M_HB_tag0.mov comp_C007_C011_08244D_001_v01_6M_HB_tag0.mov \
	comp_LA_A006_C008_t9_6M_HB_tag0.mov comp_DB_D001_C001_v03_6Mbps.mov \
	comp_HK_H004_C010_4k_v01_6Mbps.mov comp_LA_A008_C004_ALT_v33_6Mbps.mov \
	comp_DB_D002_C003_t9_6M_HB_tag0.mov comp_C007_C004_0824AJ_001_v01_6M_HB_tag0.mov \
	comp_DB_D001_C005_t9_6M_HB_tag0.mov comp_HK_H004_C013_t9_6M_HB_tag0.mov \
	comp_DB_D008_C010_v04_6Mbps.mov; do
	sudo wget -nc "$url/$i" -O "/opt/ATV4/$i"
	sudo chmod 644 "/opt/ATV4/$i"
done
