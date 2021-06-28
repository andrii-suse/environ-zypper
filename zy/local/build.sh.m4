set -e
host=${ENVIRON_PM_OPENSUSE_HOST:-http://download.opensuse.org}
[ ! -d __workdir/openSUSE_Tumbleweed ] || for oss in oss non-oss; do
        __workdir/openSUSE_Tumbleweed/zypper ar $host/tumbleweed/repo/$oss download-$oss
done
[ ! -d __workdir/openSUSE_Tumbleweed ] || for oss in {,-non-oss}; do
    __workdir/openSUSE_Tumbleweed/zypper ar $host/update/tumbleweed$oss download$oss-update
done

for leap in 15.2 15.3; do
    [ ! -d __workdir/openSUSE_Leap_$leap ] || for oss in oss non-oss; do
        __workdir/openSUSE_Leap_$leap/zypper ar $host/distribution/leap/$leap/repo/$oss download-$oss
        __workdir/openSUSE_Leap_$leap/zypper ar $host/update/leap/$leap/$oss download-update-$oss
    done
done
