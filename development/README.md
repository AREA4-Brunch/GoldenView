## **Environment**

All the requirements to be installed to run the app are listed in
the `requirements.txt`.
(
    pip install django
    pip install mysqlclient
    pip install pymongo
    pip install requests
    pip install mongoengine
)

Environment setup instructions are in the `documentation/environment-setup.md`.

<br/>

## **Relative Files**

<Br/>

***Always use forward slashes not backslashes in relative paths in Django!***<br/>
<br/>
***Wherever using static files in HTML code somewhere at top place the following line:***
```
{% load static %}
```

### **Relative files' URLs in code:**
<br/>

1. ***Static App*** Files<br/>
    Within development code to link to some static file that is inside any app:<br/>
    ```
    href="{% static 'app_name/css/landing_page.css' %}"
    ```
    where that path corresponds to:<br/>
    `.\development\trading_platform\apps\app_name\frontend\src\static\app_name\css\landing_page.css`<br/>


2. ***Static Common*** Files<br/>
    Within development code to link to some static file from common dir:<br/>
    ```
    href="{% static 'common/components/footer/footer.css' %}"
    ```
    where that path corresponds to:<br/>
    `.\development\trading_platform\apps\common\frontend\src\static\common\components\footer\footer.css`<br/>


3. ***Template App*** Files<br/>
    Within development code to link to some template file that is inside any app:<br/>
    ```
    {% include 'app_name/components/dashboard/dashboard.html' %}
    ```
    where that path corresponds to:<br/>
    `.\development\trading_platform\apps\app_name\frontend\src\static\app_name\components\dashboard\dashboard.html`<br/>


4. ***Template Common*** Files<br/>
    Within development code to link to some template file from common dir:<br/>
    ```
    {% include 'common/components/header/header.html' %}
    ```
    where that path corresponds to:<br/>
    `.\development\trading_platform\apps\common\frontend\src\static\common\components\header\header.html`<br/>
