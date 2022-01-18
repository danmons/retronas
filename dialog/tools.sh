#!/bin/bash

clear
source /opt/retronas/dialog/retronas.cfg
cd ${DIDIR}

rn_tools() {
source /opt/retronas/dialog/retronas.cfg
dialog \
  --backtitle "RetroNAS" \
  --title "RetroNAS Tools menu" \
  --clear \
  --menu "My IP addresses: ${MY_IPS} \
  \n
  \nPlease select an service to check" ${MG} 10 \
  "01" "Main Menu" \
  "02" "GOG - Download your GOG installers and extras" \
  "03" "Nintendo 3DS QR code generate" \
  2> ${TDIR}/rn_tools
}

SC="systemctl --no-pager --full"

while true
do
  rn_tools
  CHOICE=$( cat ${TDIR}/rn_tools )
  PAUSEMSG='Press [Enter] to continue...'
  case ${CHOICE} in
  02)
    # gogrepo
    bash gogrepo.sh
    ;;
  03)
    # 3DS QR
    echo "3DS QR TBA"
    echo "${PAUSEMSG}"
    read -s
    ;;
  *)
    exit 1
    ;;
  esac
done