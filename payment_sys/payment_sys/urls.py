from django.conf.urls import patterns, include, url

from django.contrib import admin
admin.autodiscover()

import views

urlpatterns = patterns('',
    url(r'^admin/', include(admin.site.urls)),
    url(r'^tranfer/', views.transfer, name='transfer'),
    url(r'^xmlrpc/$', 'django_xmlrpc.views.handle_xmlrpc', name='xmlrpc'),
)
