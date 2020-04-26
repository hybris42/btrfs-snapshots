install:
	#######################################
	# Install default configuration files #
	#######################################
	[ -e /etc/default/snapshots ] || cp snapshots.default /etc/default/snapshots
	[ -e /etc/snapshots.list ]    || cp snapshots.list    /etc/snapshots.list
	################
	# Copy scripts #
	################
	cp bin/snapshots       /usr/local/sbin/
	cp bin/snapshots-send  /usr/local/sbin/
	##########################
	# Install systemd timers #
	##########################
	[ -e /etc/systemd/system/snapshots.timer ]        || cp snapshots.timer        /etc/systemd/system/snapshots.timer
	[ -e /etc/systemd/system/snapshots.service ]      || cp snapshots.service      /etc/systemd/system/snapshots.service
	[ -e /etc/systemd/system/snapshots-send.timer ]   || cp snapshots-send.timer   /etc/systemd/system/snapshots-send.timer
	[ -e /etc/systemd/system/snapshots-send.service ] || cp snapshots-send.service /etc/systemd/system/snapshots-send.service
	systemctl daemon-reload
	systemctl start snapshots.timer
	systemctl start snapshots-send.timer
	systemctl enable snapshots.timer
	systemctl enable snapshots-send.timer
