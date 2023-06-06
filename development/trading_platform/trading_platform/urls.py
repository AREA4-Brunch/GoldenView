"""
URL configuration for trading_platform project.

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/4.2/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path, include


urlpatterns = [
    path('', include('apps.common.backend.urls')),
    path('admin/', admin.site.urls),
    path('website/', include('apps.website.urls')),
    path('assets/', include('apps.assets_view.urls')),
    path('login/', include('apps.user_login.urls')),
    path('register/', include('apps.user_registration.urls')),
    path('disclaimer/', include('apps.disclaimer.urls')),
    path('password_reset/', include('apps.password_reset.urls')),
    path('contact_page/', include('apps.contact_page.urls')),
    path('broker_request/', include('apps.broker_request.urls')),
    path('logout/', include('apps.user_logout.urls')),
    path('administrator_dashboard/', include('apps.administrator_dashboard.urls')),
    path('broker_dashboard/', include('apps.broker_dashboard.urls')),
    path('user_dashboard/', include('apps.user_dashboard.urls')),
    path('portfolio/', include('apps.portfolio.urls')),
    # path('api/user/', include('apps.user_management.urls')),
]
