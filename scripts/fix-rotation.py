#!/usr/bin/env python3
import dbus
import time
import os

time.sleep(3)

uid = os.getuid()

if uid == 0 and not os.path.exists('/run/user/0/bus'):
    bus_path = 'unix:path=/run/gdm/dbus'
else:
    bus_path = f'unix:path=/run/user/{uid}/bus'

os.environ['DBUS_SESSION_BUS_ADDRESS'] = bus_path
os.environ['XDG_RUNTIME_DIR'] = f'/run/user/{uid}'

bus = dbus.SessionBus()
proxy = bus.get_object('org.gnome.Mutter.DisplayConfig', '/org/gnome/Mutter/DisplayConfig')
iface = dbus.Interface(proxy, 'org.gnome.Mutter.DisplayConfig')

current = iface.GetCurrentState()
serial = current[0]

monitor = (
    'DSI-1',
    '1200x1920@50.002',
    dbus.Dictionary({}, signature='sv')
)

logical_monitor = (
    dbus.Int32(0),
    dbus.Int32(0),
    dbus.Double(1.6666666269302368),
    dbus.UInt32(3),
    dbus.Boolean(True),
    [monitor]
)

iface.ApplyMonitorsConfig(
    serial,
    dbus.UInt32(1),
    [logical_monitor],
    dbus.Dictionary({}, signature='sv')
)