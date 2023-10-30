set -e
host=${ENVIRON_PM_OPENSUSE_HOST:-http://download.opensuse.org}
[ ! -d __workdir/openSUSE_Tumbleweed ] || for oss in oss non-oss; do
        __workdir/openSUSE_Tumbleweed/zypper ar $host/tumbleweed/repo/$oss download-$oss
done
[ ! -d __workdir/openSUSE_Tumbleweed ] || for oss in {,-non-oss}; do
    __workdir/openSUSE_Tumbleweed/zypper ar $host/update/tumbleweed$oss download$oss-update
done

for leap in $(grep 15 __libdir/.service.lst); do
    [ ! -d __workdir/$leap ] || for oss in oss non-oss; do
        id=${leap//[!0-9\.]/}
        __workdir/$leap/zypper ar $host/distribution/leap/$id/repo/$oss download-$oss
        __workdir/$leap/zypper ar $host/update/leap/$id/$oss download-update-$oss
    done
done
