nginx-package:
  pkg.installed:
    - pkgs:
      - nginx

/etc/nginx/sites-available/default:
  file.managed:
    - source: salt://rainmaker/image-server/nginx/files/nginx-default
    - template: jinja
    - user: root
    - group: root
    - mode: 644
    - replace: True

{% if grains['id'] == 'image.rainmaker.localdev' %}
/var/www/nginx:
  file.directory:
    - user: root
    - group: www-data
    - mode: 775
    - makedirs: True

/var/www/nginx/rootfs:
  file.directory:
    - user: root
    - group: www-data
    - mode: 2775
    - makedirs: True

/var/www/nginx/rootfs/project:
  file.directory:
    - user: root
    - group: www-data
    - mode: 2775
    - makedirs: True

/var/www/nginx/rootfs/project-branch:
  file.directory:
    - user: root
    - group: www-data
    - mode: 2775
    - makedirs: True
{% endif %}

nginx:
  service.running:
    - enable: True
    - reload: True
