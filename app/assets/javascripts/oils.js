$(function() {
  $("input.delete-button").on("click", function(e) {
    e.preventDefault();
    var $item = $(this).parent("form");
    var action = $item.attr("action");
    var params = $item.serialize();

    $.ajax({
      url: action,
      data: params,
      dataType: "json",
      method: "DELETE"
    })

  });
})