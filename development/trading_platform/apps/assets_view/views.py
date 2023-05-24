from django.shortcuts import render

# Create your views here.


def assets_list(request):
    return render(
        request=request,
        template_name='assets_view/assets_list/assets_list.html',
    )


def asset_view(request, asset_id: int):
    return render(
        request=request,
        template_name='assets_view/asset_view/asset_view.html',
    )
