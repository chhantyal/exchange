from django.views.generic import FormView, TemplateView
from django.shortcuts import redirect

from braces.views import LoginRequiredMixin

from models import Exchange
from forms import ExchangeForm
from utils import get_object_or_none


class AjaxMixin(object):
    """
    This mixin is used for views which handle ajax requests because ajax request expects diffrent
    response than normal views return.
    """
    ajax_template_name = None

    def ajax_render_to_response(self, context, **response_kwargs):
        response_kwargs.setdefault('content_type', self.content_type)
        return self.response_class(
            request = self.request,
            template = [self.ajax_template_name],
            context = context,
            **response_kwargs
        )

    def render_to_response(self, context, **response_kwargs):
        if self.request.is_ajax():
            return self.ajax_render_to_response(context, **response_kwargs)
        return super(AjaxMixin, self).render_to_response(context)


class Dashboard(TemplateView):
    """
    Landing page view
    """
    template_name = 'exchange/exchange_form.html'

    def get(self, request, *args, **kwargs):
        if self.request.user.is_authenticated():
            return redirect('exchange')
        return super(Dashboard, self).get(request, *args, **kwargs)

    def get_context_data(self, **kwargs):
        context = super(Dashboard, self).get_context_data(**kwargs)
        context['latest_updates'] = Exchange.objects.all()[:10]
        return context


class ExchangeFormView(LoginRequiredMixin, AjaxMixin, FormView):
    """
    Main view for exchange rates.
    When user enters date, we show the exchange rate for the selected date
    """
    form_class = ExchangeForm
    template_name = 'exchange/exchange_form.html'
    ajax_template_name = 'exchange/ajax_partial.html'

    def get_context_data(self, **kwargs):
        context = super(ExchangeFormView, self).get_context_data(**kwargs)
        context['latest_updates'] = Exchange.objects.all()[:10]
        return context

    def form_valid(self, form):
        context = self.get_context_data()
        date = form.cleaned_data['date']
        context['rate_asked'] = get_object_or_none(Exchange, exchange_date=date)
        return super(ExchangeFormView, self).ajax_render_to_response(context)
