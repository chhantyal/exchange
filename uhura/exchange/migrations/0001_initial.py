# -*- coding: utf-8 -*-
from south.utils import datetime_utils as datetime
from south.db import db
from south.v2 import SchemaMigration
from django.db import models


class Migration(SchemaMigration):

    def forwards(self, orm):
        # Adding model 'Exchange'
        db.create_table(u'exchange_exchange', (
            (u'id', self.gf('django.db.models.fields.AutoField')(primary_key=True)),
            ('usd', self.gf('django.db.models.fields.DecimalField')(max_digits=10, decimal_places=2)),
            ('euro', self.gf('django.db.models.fields.DecimalField')(default=1.0, max_digits=10, decimal_places=2)),
            ('exchange_date', self.gf('django.db.models.fields.DateField')(db_index=True)),
            ('date_imported', self.gf('django.db.models.fields.DateField')(auto_now_add=True, blank=True)),
        ))
        db.send_create_signal(u'exchange', ['Exchange'])


    def backwards(self, orm):
        # Deleting model 'Exchange'
        db.delete_table(u'exchange_exchange')


    models = {
        u'exchange.exchange': {
            'Meta': {'object_name': 'Exchange'},
            'date_imported': ('django.db.models.fields.DateField', [], {'auto_now_add': 'True', 'blank': 'True'}),
            'euro': ('django.db.models.fields.DecimalField', [], {'default': '1.0', 'max_digits': '10', 'decimal_places': '2'}),
            'exchange_date': ('django.db.models.fields.DateField', [], {'db_index': 'True'}),
            u'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'usd': ('django.db.models.fields.DecimalField', [], {'max_digits': '10', 'decimal_places': '2'})
        }
    }

    complete_apps = ['exchange']