"""
Background worker jobs to process exchange rate date every day.
"""
from celery.task.schedules import crontab
from celery.decorators import periodic_task

from models import Exchange
from rates import get_exchange_rates, get_new_data


@periodic_task(run_every=crontab(hour=12, minute=0, day_of_week="*"))
def periodic_import_data():
    """
    A periodic task which runs as specified in above crontab
   If API gives new data which is not in our db, it saves the data.
    """
    if Exchange.objects.exists():
        data = get_new_data()
    else:
        data = get_exchange_rates()

    for exchange_rate in data:
        Exchange.objects.create(exchange_date=exchange_rate[0], usd=exchange_rate[1])
