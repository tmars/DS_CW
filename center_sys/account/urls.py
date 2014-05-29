from django.conf.urls import patterns, url

import views

urlpatterns = patterns('',
    url(r'^$', views.index, name='index'),
    url(r'^login/$', views.login, name='login'),
    url(r'^logout/$', views.logout, name='logout'),
    url(r'^success/$', views.success, name='success'),
    url(r'^pay_order/(?P<order_id>\d+)/$', views.pay_order, name='pay_order'),
    url(r'^cancel_order/(?P<order_id>\d+)/$', views.cancel_order, name='cancel_order'),
)