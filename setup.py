# -*- coding: utf-8 -*-
#!/usr/bin/env python

import os
import sys


try:
    from setuptools import setup
except ImportError:
    from distutils.core import setup

import uhura
version = uhura.__version__

setup(
    name='uhura',
    version=version,
    author='',
    author_email='noblenara@gmail.com',
    packages=[
        'uhura',
    ],
    include_package_data=True,
    install_requires=[
        'Django>=1.6.1',
    ],
    zip_safe=False,
    scripts=['uhura/manage.py'],
)