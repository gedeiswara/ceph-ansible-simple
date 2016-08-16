#/bin/bash
monmaptool --create --clobber --fsid {{ceph_fsid}} \
{% for i in ceph_mon_map %}
--add {{i.id}} {{ hostvars[i.inventory]['ansible_' + i.interface]['ipv4']['address'] }} \
{% endfor -%}
/etc/ceph/monmap
