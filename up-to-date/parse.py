#!/usr/bin/env python3
from xml.etree import ElementTree
from sys import stdin

if __name__ == '__main__':
    e = ElementTree.ElementTree()
    with open('dehs.xml') as f:
        tree = e.parse(f)

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
        print(f'Package: {package} - local {local} - remote {remote} : {status}')
