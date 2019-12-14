install:
	[ -e /etc/cron.d/snapshots ]  || cp snapshots.cron    /etc/cron.d/snapshots
	[ -e /etc/default/snapshots ] || cp snapshots.default /etc/default/snapshots
	[ -e /etc/snapshots.list ]    || cp snapshots.list    /etc/snapshots.list
	cp snapshots.logrotate /etc/logrotate.d/snapshots
	cp bin/snapshots       /usr/local/sbin/
	cp bin/snapshots-send  /usr/local/sbin/
