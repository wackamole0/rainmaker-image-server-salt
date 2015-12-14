{% if grains['id'] == 'image.rainmaker.localdev' %}
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

/etc/network/interfaces.d/eth1.cfg:
  file.managed:
    - source: salt://rainmaker/image-server/networking/files/eth1.cfg
    - template: jinja
    - user: root
    - group: root
    - mode: 644

restart eth1:
  cmd.run:
    - name: "ifdown eth1; sleep 2; ifup eth1; sleep 2"

/etc/network/interfaces.d/eth2.cfg:
  file.managed:
    - source: salt://rainmaker/image-server/networking/files/eth2.cfg
    - template: jinja
    - user: root
    - group: root
    - mode: 644

restart eth2:
  cmd.run:
    - name: "ifdown eth2; sleep 2; ifup eth2; sleep 2"

/etc/network/interfaces.d/eth3.cfg:
  file.managed:
    - source: salt://rainmaker/image-server/networking/files/eth3.cfg
    - template: jinja
    - user: root
    - group: root
    - mode: 644

restart eth3:
  cmd.run:
    - name: "ifdown eth3; sleep 2; ifup eth3; sleep 2"
{% endif %}
