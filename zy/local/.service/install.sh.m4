(
SECONDS=0
mkdir -p __workdir/__service/var/log
export ZYPP_LOGFILE=__workdir/__service/var/log/zypper.log
zypper --root __workdir/__service -n in "$@"
echo $SECONDS > __workdir/__service/.times_install
)