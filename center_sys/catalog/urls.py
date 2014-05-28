from django.conf.urls import patterns, url

from catalog import views

urlpatterns = patterns('',
    url(r'^$', views.index, name='index'),
    url(r'^(?P<office_name>.+)/(?P<car_id>.+)/$', views.detail, name='detail'),
    url(r'^(?P<office_name>.+)/(?P<car_id>.+)/reserve/$', views.reserve, name='reserve'),
)