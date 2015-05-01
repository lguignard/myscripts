#!/bin/bash
#
#    <Script to execute at fluxbox start>
#    Copyright (C) 2006  Laurent Guignard
#
#   This program is free software; you can redistribute it and/or modify
#    it under the terms of the GNU General Public License as published by
#    the Free Software Foundation; version 2 of the License
#
#    This program is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#    GNU General Public License for more details.
#
#    You should have received a copy of the GNU General Public License
#    along with this program; if not, write to the Free Software
#    Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
#

FBSETBG=`which fbsetbg`
FBPANEL=`which fbpanel`

#FBSETBG='/home/metro-gi/bin/fluxbox/bin/fbsetbg'
#FBPANEL='/home/metro-gi/bin/fluxbox/bin/fbpanel'


#
# Gestion dynamique des volumes
#/usr/bin/gnome-volume-manager &
#/usr/bin/gnome-power-manager &

#
# Set the background of environment
#$FBSETBG -a /home/metro-gi/photos/2006/elise_3-4_mois/elise_0001.jpeg
#$FBSETBG -a /home/metro-gi/photos/2006/elise_3-4_mois/elise_0003.jpeg
#$FBSETBG -c /home/metro-gi/photos/2006/elise_5_mois/elise_0009.jpeg
#$FBSETBG -c /home/metro-gi/images/Debian-swirl-clean.jpg
#$FBSETBG -c /home/metro-gi/images/01926.jpg
#$FBSETBG -c /home/metro-gi/images/terre-2.jpg
#$FBSETBG -c /home/metro-gi//photos/2007/elise_14_mois/IMG_2131.JPG
#$FBSETBG -c /home/metro-gi/images/meditate-deb-1024.jpg
#$FBSETBG -c /home/dwnl/background/OTHER-IntoTheOpen_1024x768.png

#$FBPANEL &

#xscreensaver -no-splash &
#wmmon &
#wmacpi &
#wmwork &
#/usr/bin/gaim &
#/usr/bin/tomboy &
#/usr/bin/stardict &
/usr/bin/conky -d 
#/home/metro-gi/bin/sunbird/sunbird &
