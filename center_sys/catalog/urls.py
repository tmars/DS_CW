from django.conf.urls import patterns, url

from catalog import views

urlpatterns = patterns('',
    url(r'^$', views.index, name='index'),
    url(r'^(?P<office_name>.+)/(?P<car_id>\d+)/$', views.detail, name='detail'),
    url(r'^(?P<office_name>.+)/(?P<car_id>\d+)/reserve/$', views.reserve, name='reserve'),
)