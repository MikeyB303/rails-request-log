$(document).on('turbolinks:load', function () {
  $('#logs').change(function () {
    console.log("ayyyyyyy");
    var selection_value = $(this).val();
    var xhr = new XMLHttpRequest();
    xhr.open('GET', "/requests/" + selection_value, true);
    xhr.send();
    show(xhr.responseText);
  });
});