document.addEventListener("DOMContentLoaded", () => {

});


window.addEventListener("load", () => {
    initTransferMethodOptions();
    initMakeDefaultFundsTransferMethod();
});


function initTransferMethodOptions() {
    const select = document.getElementById('transfer-methods');
    // when select option is chosen form is immediately submitted
    select.addEventListener('change', (e) => {
        console.log(`Sleected val: ${select.value}`);
        document.getElementById('transfer-methods-form').submit();
    });
}


function initMakeDefaultFundsTransferMethod() {
    const submit_btn = document.getElementById('make-tm-default');
    submit_btn.addEventListener('click', (e) => {
        e.preventDefault();
        const form = document.getElementById('transfer-methods-form');
        form.action = submit_btn.dataset.url;
        form.submit();
    });
}
