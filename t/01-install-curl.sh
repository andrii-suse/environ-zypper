set -exo pipefail
environ -l $PWD zy1
zy1/refresh
zy1/install curl
# check installation size on each OS
du -hs zy1/*/
zy1/openSUSE_Tumbleweed/install wget
# check again when TW got wget
du -hs zy1/*/
set -e
ls -la zy1/*/usr/bin/curl  | grep -C3 Tumbleweed | grep -C3 Leap_15.2 | grep -C3 Leap_15.3
ls -la zy1/*/usr/bin/wget  | grep -C3 Tumbleweed | grep -v Leap_15.2  | grep -v Leap_15.3
ls -la zy1/*/var/log/zypper.log
