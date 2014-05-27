from django.conf.urls import patterns, url

from catalog import views

urlpatterns = patterns('',
    # /catalog/
    url(r'^$', views.index, name='index'),
    
    # /catalog/test/
    url(r'^(?P<car_id>.+)/$', views.detail, name='detail'),
)