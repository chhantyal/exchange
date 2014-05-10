from django import forms


class ExchangeForm(forms.Form):
    date = forms.DateField(required=True, label='Exchange Date', widget=forms.DateInput(
                            attrs={'data-date-format': 'dd/mm/yy', 'required': 'required',
                            'placeholder': "Please enter date 01/05/2014"}))