install:
	[ -e snapshots.list ] && cp snapshots.list /etc/snapshots.list || true
	cp snapshots.logrotate /etc/logrotate.d/snapshots
	cp snapshots.cron /etc/cron.d/snapshots
	cp snapshots /usr/sbin/snapshots
