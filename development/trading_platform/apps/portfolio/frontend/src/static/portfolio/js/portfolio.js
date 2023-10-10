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
    initTransactionsViewDetails();
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


function initTransactionsViewDetails() {
    $('#trade-requests tr').click(function(e) {
        console.log(`Hello I have been clicked!`);
        if (e.target.tagName !== "TR" && e.target.tagName !== "TD") {
            return;
        }
        console.log(`proceeding...`);

        const tr = e.target.tagName === 'TR' ?
                   e.target
                 : e.target.parentNode;  // tagName == 'TD'
        const idtraderequest = tr.getAttribute('data-trade-request-id');
        const request_type = tr.getAttribute('data-request-type');
        const asset_ticker = tr.children[0].textContent;

        const form_data = {
            "idtraderequest": parseInt(idtraderequest, 10),
            "request_type": request_type
        };

        $.ajax({
            url: tr.getAttribute('data-view-details-url'),
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
                let err_msg = '';
                for (let error of response.errors) {
                    err_msg += error;
                }
                if (err_msg.length > 0) {
                    alert(`Failed to fetch the request details: ${err_msg}`);
                } else {
                    displayTradeRequestDetails(
                        response.trade_request_details,
                        response.asset_transactions,
                        response.contract_details,
                        idtraderequest,
                        request_type,
                        asset_ticker,
                    );
                }
            },
            error: function(xhr, status, error) {
                console.log(`Error`);
                console.log(error);
                alert(`It seems an error ocurred: ${error}`);
            }
        });
    });
}


function displayTradeRequestDetails(
    trade_request_details,
    asset_transactions,
    contract_details,
    idtraderequest,
    request_type,
    asset_ticker
) {
    function displayContractDetails() {
        let contract_details_dom = document.getElementById('trade-request-contract-details');
        
    console.log(`Recieved contract_details: ${contract_details}`);
    console.log(`2Recieved contract_details: ${contract_details['id']}`);
    console.log(`Recieved contract_details: ${contract_details['fee_percentage']}`);

        contract_details_dom.innerHTML = `
            <div>
                <h5 class="fs-5">Contract Details</h5>
                <hr>
            </div>
            <div style="margin-left: 4%;">
                <span><strong>Contract ID:</strong> ${contract_details['id']}</span>
                <br/>
                <span><strong>Broker's Fee Percentage:</strong> ${contract_details['fee_percentage']}</span>
                <br/>
                ${
                    'fee_paid' in contract_details ?
                      ` <span><strong>Fee Paid:</strong> ${contract_details['fee_paid']} US$</span>
                        <br/>
                      `
                    : ''
                }
                ${
                    'time_fee_paid' in contract_details ?
                      ` <span><strong>Time Fee Paid:</strong> ${contract_details['time_fee_paid']}</span>
                        <br/>
                      `
                    : ''
                }
                ${
                    'status' in contract_details ?
                      ` <span><strong>Fee Payment Status:</strong></span><span data-bs-toggle="popover" title="Paid in full."> ${contract_details['status']}</span>
                        <br/>
                      `
                    : ''
                }
            </div>
        `;
    }

    function displayTradeRequestDetails() {
        let trade_request_details_dom = document.getElementById('trade-request-status-details');
        trade_request_details_dom.innerHTML = `
            <div>
                <h5 class="fs-5">Additional Info</h5>
                <hr>
            </div>
            <div style="margin-left: 4%;">
                <span><strong>Asset:</strong> ${asset_ticker}</span>
                <br/>
                <span>
                    <strong>Quantity Fulfilled: </strong>
                    ${trade_request_details['quantity_requested'] - trade_request_details['quantity_required']}/${trade_request_details['quantity_requested']}
                </span>
                <br/>
                <span><strong>Total Transactions Value:</strong> ${trade_request_details['total_transactions_val']} US$</span>
                <br/>
            </div>
        `;
    }

    function displayTransactions() {
        let thead = document.querySelector('#trade-request-transactions thead');
        thead.children[0].children[0].innerHTML = `${asset_ticker} Shares`;

        let tbody = document.querySelector('#trade-request-transactions tbody');
        let new_tbody = document.createElement('tbody');
        for (transaction of asset_transactions) {
            let tr = document.createElement('tr');
            tr.innerHTML = `
                <td>${transaction['quantity']}</td>
                <td>${transaction['unit_price']} US$</td>
                <td>${transaction['quantity'] * transaction['unit_price']} US$</td>
                <td>${transaction['time']}</td>
            `;
            new_tbody.appendChild(tr);
        }
        tbody.parentNode.replaceChild(new_tbody, tbody);
    }

    let title = document.getElementById('trade-request-details-modal-title');
    title.textContent = `Details of ${request_type === 'BUY' ? 'Purchase' : 'Sales'} Request #${idtraderequest}`;

    if (contract_details !== undefined && contract_details !== null) {
        displayContractDetails();
    }

    displayTradeRequestDetails();
    displayTransactions();

    // show the modal
    const trade_request_details_modal
        = new bootstrap.Modal('#trade-request-details-modal', {});

    trade_request_details_modal.toggle();
}
