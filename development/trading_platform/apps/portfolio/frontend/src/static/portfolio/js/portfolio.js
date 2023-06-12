// Aleksandar Radenkovic 2020/0272

let $ = null;
let CSRF_TOKEN = null;


function csrfSafeMethod(method) {
    return (/^(GET|HEAD|OPTIONS|TRACE)$/.test(method));
}


document.addEventListener('DOMContentLoaded', () => {
    $ = django.jQuery;
    CSRF_TOKEN = document.getElementById("trade-requests").dataset.csrfToken;
});


window.addEventListener('load', () => {
    initCancelButtons();
    initInputFieldsTradeRequestsRows();
});


function initCancelButtons() {
    $('.cancel-request').click(function(e) {
        if (window.confirm("Are you certain you want to cancel this trade request?") === false) {
            return;
        }

        const tr = e.target.parentNode.parentNode;
        const idtraderequest = tr.getAttribute('data-trade-request-id');
        const request_type = tr.getAttribute('data-request-type');

        const form_data = {
            "idtraderequest": parseInt(idtraderequest, 10),
            "request_type": request_type
        };

        $.ajax({
            url: e.target.dataset.url,
            xhrFields: {
                withCredentials: true
            },
            type: 'POST',
            dataType: 'json',
            data: form_data,
            beforeSend: function(xhr, settings) {
                // set the CSRF token header
                if (!csrfSafeMethod(settings.type) && !this.crossDomain) {
                    xhr.setRequestHeader('X-CSRFToken', CSRF_TOKEN);
                }

                // TODO: add some loading/spinner notification/animation
            },
            success: function(response) {
                // handle the response from the backend
                // console.log(`Success`);
                console.log(response);

                let err_msg = '';
                for (let error of response.errors) {
                    err_msg += error;
                }
                if (err_msg.length > 0) {
                    alert(`Failed to submit the request: ${err_msg}`);
                } else {
                    updateCancelledTradeRequestRow(
                        tr,
                        response.quantity_at_which_stopped,
                        parseFloat(response.value_at_which_stopped)
                    );
                    alert(`Success: ${response.success_msg}`);
                }
            },
            error: function(xhr, status, error) {
                // if 404 then user is not in group `can_trade`
                // handle any errors
                console.log(`Error`);
                console.log(error);
                alert(`It seems an error ocurred: ${error}`);
            }
        });
    });
}


function updateCancelledTradeRequestRow(table_row, new_quantity, new_value) {
    // remove is active style off the name
    let name = document.createElement('td');
    name.textContent = table_row.children[0].textContent;

    let quantity = document.createElement('td');
    quantity.textContent = new_quantity;

    let value = document.createElement('td');
    value.textContent = new_value.toFixed(2);  // 2 decimal places

    table_row.replaceChild(name, table_row.children[0]);
    // cancel button should no longer exist
    table_row.children[1].innerHTML = "";
    // contract should not be changed
    // min/max should no longer exist
    table_row.children[3].innerHTML = "";
    table_row.children[4].innerHTML = "";
    table_row.replaceChild(quantity, table_row.children[5]);
    table_row.replaceChild(value, table_row.children[6]);
    // type should not be changed
}


function initInputFieldsTradeRequestsRows() {
    // prevent user from entering more than 2 digits
    // after decimal place
    $('.modify-lower-bound').on('input', function(e) {
        e.target.value = e.target.value.replace(/(\.\d{2})\d+/, '$1');
    });

    // prevent user from entering more than 2 digits
    // after decimal place
    $('.modify-upper-bound').on('input', function(e) {
        e.target.value = e.target.value.replace(/(\.\d{2})\d+/, '$1');
    });

    // prevent user from entering anything but integer
    $('.modify-quantity-requested').on('input', function(e) {
        e.target.value = e.target.value.replace(/\D/g, '');
    });

    $('.modify-lower-bound').keyup(function(e) {
        if (e.key !== "Enter") { return; }

        const tr = e.target.parentNode.parentNode.parentNode;
        const idtraderequest = tr.getAttribute('data-trade-request-id');
        const request_type = tr.getAttribute('data-request-type');
        const url = tr.getAttribute('data-modify-url');

        let form_data = {
            "idtraderequest": parseInt(idtraderequest, 10),
            "request_type": request_type
        };

        const lower_bound = parseFloat(e.target.value);
        if (lower_bound > 0) {
            form_data["lowerbound"] = lower_bound;
        }

        sendModifyActiveTradeRequest(tr, url, form_data);
    });

    $('.modify-upper-bound').keyup(function(e) {
        if (e.key !== "Enter") { return; }

        const tr = e.target.parentNode.parentNode.parentNode;
        const idtraderequest = tr.getAttribute('data-trade-request-id');
        const request_type = tr.getAttribute('data-request-type');
        const url = tr.getAttribute('data-modify-url');

        let form_data = {
            "idtraderequest": parseInt(idtraderequest, 10),
            "request_type": request_type
        };

        const upper_bound = parseFloat(e.target.value);
        if (upper_bound > 0) {
            form_data["upperbound"] = upper_bound;
        }

        sendModifyActiveTradeRequest(tr, url, form_data);
    });

    $('.modify-quantity-requested').keyup(function(e) {
        if (e.key !== "Enter") { return; }

        const tr = e.target.parentNode.parentNode.parentNode;
        const idtraderequest = tr.getAttribute('data-trade-request-id');
        const request_type = tr.getAttribute('data-request-type');
        const url = tr.getAttribute('data-modify-url');

        let form_data = {
            "idtraderequest": parseInt(idtraderequest, 10),
            "request_type": request_type
        };

        const quantity_requested = parseFloat(e.target.value);
        if (quantity_requested > 0) {
            form_data["quantity"] = quantity_requested;
        }

        sendModifyActiveTradeRequest(tr, url, form_data);
    });
}


function sendModifyActiveTradeRequest(table_row, form_action, form_data) {
    if (window.confirm("Are you certain you want to update this trade request?") === false) {
        return;
    }

    $.ajax({
        url: form_action,
        xhrFields: {
            withCredentials: true
        },
        type: 'POST',
        dataType: 'json',
        data: form_data,
        beforeSend: function(xhr, settings) {
            // set the CSRF token header
            if (!csrfSafeMethod(settings.type) && !this.crossDomain) {
                xhr.setRequestHeader('X-CSRFToken', CSRF_TOKEN);
            }

            // TODO: add some loading/spinner notification/animation
        },
        success: function(response) {
            // handle the response from the backend
            // console.log(`Success`);
            console.log(response);

            let err_msg = '';
            for (let error of response.errors) {
                err_msg += error;
            }
            if (err_msg.length > 0) {
                alert(`Failed to submit the request: ${err_msg}`);
            } else {  // success
                updateModifiedTradeRequestRow(
                    table_row,
                    response.quantity_required_at_which_stopped,
                    response.quantity_requested_at_which_stopped,
                    parseFloat(response.value_at_which_stopped),
                    response.did_fulfill,
                    parseFloat(response.lower_bound_at_which_stopped),
                    parseFloat(response.upper_bound_at_which_stopped)
                );
                alert(`Success: ${response.success_msg}`);
            }
        },
        error: function(xhr, status, error) {
            // if 404 then user is not in group `can_trade`
            // handle any errors
            console.log(`Error`);
            console.log(error);
            alert(`It seems an error ocurred: ${error}`);
        }
    });
}


function updateModifiedTradeRequestRow(
    table_row,
    new_quantity_required,
    new_quantity_requested,
    new_value,
    did_fulfill,
    new_lower_bound,
    new_upper_bound
) {
    if (did_fulfill) {
        updateCancelledTradeRequestRow(table_row, new_quantity_requested, new_value);
        return;
    }

    const quantity_acquired = new_quantity_requested - new_quantity_required;

    let value = document.createElement('td');
    value.textContent = new_value.toFixed(2);  // 2 decimal places

    // name style should not be changed
    // cancel button should not be changed
    // contract should not be changed

    // update min
    console.log(`Children: ${table_row.children[3]}`);
    console.log(table_row.children[3]);
    table_row.children[3].children[0].children[0].value = new_lower_bound;

    // update max
    table_row.children[4].children[0].children[0].value = new_upper_bound;

    // update quantity acquired:
    table_row.children[5].children[0].children[0].value = quantity_acquired;

    // update quantity requested:
    table_row.children[5].children[0].children[2].value = new_quantity_requested;

    // update the total transactions value
    table_row.replaceChild(value, table_row.children[6]);

    // type should not be changed
}
