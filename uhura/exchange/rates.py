"""
Utilities to get rates from www.quandl.com
Quandl.com provides official Python API wrapper called Quandl. Since we are doing simple data
retrival, we don't have to use their heavy package. For advanced, usage Quandl package looks great.
"""

import requests

from django.conf import settings

from models import Exchange

API_ENDPOINT = settings.QUANDL_API_URL
EXCHANGE_CODE = settings.QUANDL_EXCHANGE_CODE
AUTH_TOKEN = settings.QUANDL_AUTH_TOKEN


def get_exchange_rates():
    """
    Returns raw data as list of date and exchange rate from Quandl.com
    """
    url = '{base_url}/{code}.json?auth_token={auth_token}'.format(base_url=API_ENDPOINT,
                                                                  code=EXCHANGE_CODE,
                                                                  auth_token=AUTH_TOKEN)
    r = requests.get(url=url)
    assert r.status_code == 200
    data = r.json()
    return data['data']


def get_new_data():
    """
    Returns only new data as dict based on previous data import job.
    """
    data = get_exchange_rates()
    last_imported_date = Exchange.get_latest().date
    index = get_index(data, last_imported_date)
    if index:
        return data[index]
    return []


def get_index(lst, index_param):
    """
    Returns index of a list from given parameter
    """
    for item in enumerate(lst):
        if index_param in item[1]:
            index, value = item
            return index
        else:
            continue