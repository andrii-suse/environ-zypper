for s in $(cat __workdir/.service.lst); do
    __workdir/$s/zypper "$@"
done
