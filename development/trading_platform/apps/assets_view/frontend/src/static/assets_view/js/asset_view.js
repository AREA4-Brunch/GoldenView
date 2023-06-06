let $ = null;

function csrfSafeMethod(method) {
    return (/^(GET|HEAD|OPTIONS|TRACE)$/.test(method));
}


document.addEventListener('DOMContentLoaded', () => {
    $ = django.jQuery;
    initTradingViewWidget();
    initSlider();
});


window.addEventListener('load', () => {
    // setup the buy and sell form functionality
    initBuySellForm();
});


function initTradingViewWidget() {
    // setup the symbol from django embedded variable into html
    let symbol = document.getElementById('asset_view-content').dataset.assetTicker;
    // console.log(`Caught asset ticker: ${symbol}`);

    if (symbol === null) {
        symbol = "NASDAQ:AAPL";
    }
    else {
        symbol = "NASDAQ:" + symbol;
    }

    new TradingView.widget(
        {
            "width": 1000,
            "height": 400,
            "symbol": symbol,
            "interval": "1",
            "timezone": "Etc/UTC",
            "theme": "light",
            "style": "1",
            "locale": "en",
            "toolbar_bg": "#f1f3f6",
            "enable_publishing": false,
            "allow_symbol_change": true,
            "container_id": "tradingview_3edba"
        }
    );
}


function initSlider() {
    $(function () {
        $("#slider-range").slider({
            range: true,
            min: 0,
            max: 5000,
            values: [1500, 3000],
            slide: function (event, ui) {
                $("#amount").val("$" + ui.values[0].toFixed(2) + " - $" + ui.values[1].toFixed(2));
                $("#min-price").val(ui.values[0].toFixed(2));
                $("#max-price").val(ui.values[1].toFixed(2));
            }
        });
        $("#amount").val("$" + $("#slider-range").slider("values", 0) +
            " - $" + $("#slider-range").slider("values", 1));
        $("#min-price").val($("#slider-range").slider("values", 0));
        $("#max-price").val($("#slider-range").slider("values", 1));

        $("#min-price").on("input", function() {
            if (parseFloat(($("#min-price").val())) <= parseFloat($("#max-price").val())) {
                $("#slider-range").slider("values", [parseFloat($("#min-price").val()), parseFloat($("#max-price").val())]);
                $("#amount").val("$" + parseFloat(($("#min-price").val())).toFixed(2) + " - $" + parseFloat($("#max-price").val()).toFixed(2));
            }
        });

        $("#max-price").on("input", function() {
           if (parseFloat(($("#max-price").val())) >= parseFloat($("#min-price").val())) {
                $("#slider-range").slider("values", [parseFloat($("#min-price").val()), parseFloat($("#max-price").val())]);
                $("#amount").val("$" + parseFloat(($("#min-price").val())).toFixed(2) + " - $" + parseFloat($("#max-price").val()).toFixed(2));
           }
        });
    });
}


function initBuySellForm() {
    // const $ = django.jQuery;
    const form = document.getElementById('buy-sell-form');

    document.addEventListener('submit', function(e) {
        e.preventDefault();
    });

    // setup buy button to submit the form to appropriate url
    initBuyButton(form);

    // setup sell button to submit the form to appropriate url
    initSellButton(form);
}


function initBuyButton(form) {
    $('#buy-btn').click(function(e) {
        e.preventDefault();
        // set the endpoint for the form to buy
        form.action = this.dataset.url;
        // form.submit();
        submitForm();
    });
}


function initSellButton(form) {
    $('#sell-btn').click(function(e) {
        e.preventDefault();
        // set the endpoint for the form to sell
        form.action = this.dataset.url;
        // form.submit();
        submitForm();
    });
}


function submitForm(endpoint) {
    const form = document.getElementById('buy-sell-form');
    // const form_data = $(form).serialize();
    const symbol = document.getElementById('asset_view-content')
                           .dataset.assetTicker;
    // const form_data = {
    //     'quantity': 15,
    //     'min': 250,
    //     'max': 275,
    //     'ticker': symbol
    // };
    const quantity = parseInt(document.getElementById('quantity').value, 10);
    const min = parseFloat(document.getElementById('min-price').value);
    const max = parseFloat(document.getElementById('max-price').value);
    const contract = document.getElementById('contract').value;
    let form_data = {
        'quantity': quantity,
        'min': min,
        'max': max,
        'ticker': symbol,
    };

    if (contract) {
        form_data['contract'] = parseInt(contract, 10);
    }

    $.ajax({
        url: form.action,
        xhrFields: {
            withCredentials: true
        },
        type: 'POST',
        dataType: 'json',
        data: form_data,
        beforeSend: function(xhr, settings) {
            // set the CSRF token header
            if (!csrfSafeMethod(settings.type) && !this.crossDomain) {
                xhr.setRequestHeader('X-CSRFToken', form.dataset.csrfToken);
            }

            // TODO: add some loading/spinner notification/animation
        },
        success: function(response) {
            // handle the response from the backend
            console.log(`Success`);
            console.log(response);
        },
        error: function(xhr, status, error) {
            // if 404 then user is not in group `can_trade`
            // handle any errors
            console.log(`Error`);
            console.log(error);
        }
    });
}
