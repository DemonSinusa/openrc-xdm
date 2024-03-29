#!/bin/sh
# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License, v2

# We need to source /etc/profile for stuff like $LANG to work
# bug #10190.
. /etc/profile

. /etc/openrc/init.d/functions.sh

# Great new Gnome2 feature, AA
# We enable this by default
export GDK_USE_XFT=1

export SVCNAME=xdm
EXEC="$(get_options service)"
NAME="$(get_options name)"
PIDFILE="$(get_options pidfile)"
START_STOP_ARGS="$(get_options start_stop_args)"

start-stop-daemon --start --exec ${EXEC} \
${NAME:+--name} ${NAME} ${PIDFILE:+--pidfile} ${PIDFILE} ${START_STOP_ARGS} || \
eerror "ERROR: could not start the Display Manager"

# vim:ts=4
