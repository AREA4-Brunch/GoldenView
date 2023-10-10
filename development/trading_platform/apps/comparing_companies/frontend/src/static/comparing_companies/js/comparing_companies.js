
document.addEventListener("DOMContentLoaded", () => {
    initButtonCompare();
});


function initButtonCompare() {
    const button = document.getElementById('buttonCompare');

    button.addEventListener('click', () => {
        const company1_banner = document.getElementById('company1-banner');
        const company2_banner = document.getElementById('company2-banner');

        const company1 = document.getElementById('company1-input').value;
        const company2 = document.getElementById('company2-input').value;

        if (company1 === "") {
            company1_banner.parentElement.children[1].style.color = "red";
            company1_banner.parentElement.children[1].textContent = "You need to input both companies";
            company1_banner.parentElement.children[1].style.visibility = "visible";
        }
        if (company2 === "") {
            company2_banner.parentElement.children[1].style.color = "red";
            company2_banner.parentElement.children[1].textContent = "You need to input both companies";
            company2_banner.parentElement.children[1].style.visibility = "visible";
        }
        if (company1 === "" || company2 === "") {
            return;
        }

        const better_company = getBetterCompany(
            company1,
            company2,
            document.getElementById('1').checked,
            document.getElementById('2').checked,
            document.getElementById('3').checked,
            document.getElementById('4').checked
        );

        if (better_company > 0) {  // 1st company is better
            company1_banner.style.color = "#A2E3C4";
            company2_banner.style.color = "#F49393";

            company1_banner.parentElement.children[1].style.color = "#A2E3C4";
            company1_banner.parentElement.children[1].textContent
                = "(more favorable)";
            company2_banner.parentElement.children[1].style.color = "#F49393";
            company2_banner.parentElement.children[1].textContent
                = "(less favorable)";

        } else if (better_company < 0) {  // 2nd company is better
            company1_banner.style.color = "#F49393";
            company2_banner.style.color = "#A2E3C4";

            company1_banner.parentElement.children[1].style.color = "#F49393";
            company1_banner.parentElement.children[1].textContent
                = "(less favorable)";
            company2_banner.parentElement.children[1].style.color = "#A2E3C4";
            company2_banner.parentElement.children[1].textContent
                = "(more favorable)";

        } else {  // they are equally good
            company1_banner.style.color = "#f3d529";
            company2_banner.style.color = "#f3d529";

            company1_banner.parentElement.children[1].style.color = "#f3d529";
            company1_banner.parentElement.children[1].textContent
                = "(equally favorable)";
            company2_banner.parentElement.children[1].style.color = "#f3d529";
            company2_banner.parentElement.children[1].textContent
                = "(equally favorable)";
        }

        // show text which company is more favorable
        company1_banner.parentElement.children[1].style.visibility = "visible";
        company2_banner.parentElement.children[1].style.visibility = "visible";
    });
}


/**
 * 
 * @returns positive value if company1 is better
 *          negative value if company2 is better
 *          zero if they are equally good
 */
function getBetterCompany(
    company1,
    company2,
    do_cmp_stock_prices,
    do_cmp_content_creation,
    do_cmp_company_rating,
    do_cmp_strategy_consulting,
) {
    let amplifier = 0;
    if (do_cmp_stock_prices) { amplifier += 1; }
    if (do_cmp_content_creation) { amplifier += 2; }
    if (do_cmp_company_rating) { amplifier += 3; }
    if (do_cmp_strategy_consulting) { amplifier += 4; }

    const company1_bits = countBitsInModifiedString(company1, amplifier);
    const company2_bits = countBitsInModifiedString(company2, amplifier);

    let company1_set_bits_cnt = company1_bits[1];
    let company2_set_bits_cnt = company2_bits[1];

    // normalize the count
    company1_set_bits_cnt /= company1.length;
    company2_set_bits_cnt /= company2.length;

    return company1_set_bits_cnt - company2_set_bits_cnt;
}


function countBitsInModifiedString(string, multiplier) {
    let ones_cnt = 0;
    let zeros_cnt = 0;

    if (multiplier == 0) { multiplier = 1; }

    for (let i = 0, n = string.length; i < n; ++i) {
        const char_val = string.charCodeAt(i) * multiplier;
        const binary_as_str = char_val.toString(2);
        for (const bit of binary_as_str) {
            if (bit === '1') { ++ones_cnt; }
            else             { ++zeros_cnt }
        }
    }

    return [zeros_cnt, ones_cnt];
}
