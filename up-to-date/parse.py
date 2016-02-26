#!/usr/bin/env python
from xml.etree import ElementTree
from sys import stdin

if __name__ == '__main__':
    e = ElementTree.ElementTree()
    tree = e.parse(open('dehs.xml'))
    pkgs = tree.findall('dehs')
    for p in pkgs:
        package = p.find('package')
        status = p.find('status')
        local = 'n/a'
        remote = 'n/a'
        if package is None:
            status = p.find('errors').text
        elif status is None:
            status = p.find('warnings').text
        else:
            package = package.text
            local = p.find('debian-mangled-uversion').text
            remote = p.find('upstream-version').text
            status = p.find('status').text
        if status.find('newer') != -1:
            status = status + ' ' + p.find('upstream-url').text
        print 'Package: %s - local %s - remote %s : %s' % (package, local, remote, status)
