//= require rails-ujs
//= require moment
//= require bootstrap-datetimepicker
//= require_tree .

$(document).on("ready turbolinks:load", () => {
  $("#duration").durationPicker();
})
