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

/var/www/nginx:
  file.directory:
    - user: root
    - group: www-data
    - mode: 774
    - makedirs: True

/var/www/nginx/boxes:
  file.directory:
    - user: rainmaker
    - group: www-data
    - mode: 2775
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

nginx:
  service.running:
    - enable: True
    - reload: True
