// Jovana Bjelica 2020/0349
// Country data
const countryData = [
    { id: "us", text: "United States", flag: "us" },
    { id: "ca", text: "Canada", flag: "ca" },
    { id: "mx", text: "Mexico", flag: "mx" },
    { id :"rs", text: "Serbia", flag: "rs"},
    { id: "ru", text: "Russia", flag: "ru"},
    { id: "hr", text: "Croatia", flag: "hr"},
    { id: "me", text: "Montenegro", flag: "me"},
];


window.addEventListener("load", function() {
  // Initialize Select2 on country field
  $("#country").select2({
    data: countryData,
    templateResult: formatCountry,
    templateSelection: formatCountry
  });
});


// Function to format country option
function formatCountry(country) {
    if (!country.id) {
        return country.text;
    }
    const $country = $(
          '<span class="flag-icon flag-icon-' + country.flag + '"></span>'
        + '<span class="flag-text">' + country.text + "</span>"
    );
    return $country;
}
