from django.conf.urls import patterns, include, url
from django.contrib import admin
import settings
from catalog import views
import xml_rpc

admin.autodiscover()

urlpatterns = patterns('',
    url(r'^admin/', include(admin.site.urls)),

    url(r'^media/(?P<path>.*)$', 'django.views.static.serve',
            {'document_root': settings.MEDIA_ROOT, }),

    url(r'^catalog/', include('catalog.urls')),
    
    url(r'^xmlrpc/$', 'django_xmlrpc.views.handle_xmlrpc', name='xmlrpc'),
)
