exchange
==============================

A simple currency exchange app :)


Install
-------

Base requirements are::
* pip
* virtualenv
* PostgreSQL

First make sure to create and activate a virtualenv::

    $ pip install -r requirements/local.txt

You can now run the usual Django ``runserver`` command. Off course django setting module env
variable must be set::

    $ add2virtualenv .
    $ echo "export DJANGO_SETTINGS_MODULE=uhura.config.settings" >> $VIRTUAL_ENV/bin/postactivate
    $ python uhura/manage.py runserver

Create Postgres database with name ``uhura``::

    $ create database uhura;

There is Postgres dump file ``uhura.sql``, which can be restored for testing purpose

    $ psql -U [user] -d uhura -f uhura.sql

Celery and Celery Beat are used for periodic background jobs. To run celery::

    $ python uhura/manage.py celery worker --loglevel=info -B


Other Details
-------------

The exchange data is taken from http://quandl.com via API. The data is retrived and saved
to database.

Periodic tasks run in background every day to update and sync the data. For that, distributed task
queue package ``celery`` is used, especially `Beat` feature which works like crontab in Unix.