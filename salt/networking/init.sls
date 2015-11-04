/etc/network/interfaces:
  file.managed:
    - source: salt://rainmaker/image-server/networking/files/interfaces
    - user: root
    - group: root
    - mode: 644

/etc/network/interfaces.d:
  file.directory:
    - user: root
    - group: root
    - mode: 755
    - makedirs: True

# todo - only configure eth1, eth2 and eth3 if in dev environment

/etc/network/interfaces.d/eth1.cfg:
  file.managed:
    - source: salt://rainmaker/image-server/networking/files/eth1.cfg
    - template: jinja
    - user: root
    - group: root
    - mode: 644

stop eth1:
  cmd.run:
    - name: ifdown eth1

start eth1:
  cmd.run:
    - name: ifup eth1

/etc/network/interfaces.d/eth2.cfg:
  file.managed:
    - source: salt://rainmaker/image-server/networking/files/eth2.cfg
    - template: jinja
    - user: root
    - group: root
    - mode: 644

stop eth2:
  cmd.run:
    - name: ifdown eth2

start eth2:
  cmd.run:
    - name: ifup eth2

/etc/network/interfaces.d/eth3.cfg:
  file.managed:
    - source: salt://rainmaker/image-server/networking/files/eth3.cfg
    - template: jinja
    - user: root
    - group: root
    - mode: 644

stop eth3:
  cmd.run:
    - name: ifdown eth3

start eth3:
  cmd.run:
    - name: ifup eth3
