{% if grains['id'] == 'image.rainmaker.localdev' %}
rainmaker_uid: 1002
rainmaker_gid: 1002
{% else %}
rainmaker_uid: 1000
rainmaker_gid: 1000
{% endif %}

box_builder_ip: 10.252.0.250
box_builder_gateway_ip: 10.252.0.1

profile_builder_ip: 10.251.0.250
profile_builder_gateway_ip: 10.251.0.1

testbed_ip: 10.250.0.250
testbed_gateway_ip: 10.250.0.1

{% if grains['id'] == 'image.rainmaker.localdev' %}
image_webserver_host: image.rainmaker.localdev
{% else %}
image_webserver_host: image.rainmaker-dev.com
{% endif %}
