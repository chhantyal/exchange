"""
models for exchange rates app.
"""
import datetime

from django.db import models
from django.utils.translation import ugettext_lazy as _


class Exchange(models.Model):
    """
    Exchange rate table for USD and EURO.
    Exchange is based on EURO, thus default value of euro is 1.0
    """
    usd = models.DecimalField(max_digits=10, decimal_places=2, verbose_name='USD')
    euro = models.DecimalField(max_digits=10, decimal_places=2, default=1.0, verbose_name='EUR')
    exchange_date = models.DateField(verbose_name=_('Exchange date'), db_index=True)
    date_imported = models.DateField(verbose_name=_('Import date'), auto_now_add=True)

    class Meta:
        ordering = ['-exchange_date']

    def __unicode__(self):
        return '{usd}-{eur}'.format(usd=self.usd, eur=self.euro)

    @classmethod
    def get_latest(cls):
        return cls.objects.latest('exchange_date')

    @classmethod
    def get_for_current_month(cls):
        month = datetime.date.today().month
        year = datetime.date.today().year
        return Exchange.objects.filter(exchange_date__year=year, exchange_date__month=month)
