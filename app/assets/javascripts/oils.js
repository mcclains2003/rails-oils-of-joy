function Oil(oil) {
  this.id = oil.id
  this.name = oil.name
  this.description = oil.description
};

Oil.destroy = function(oil) {
  var oil = new Oil(oil);
  oil.destroy();
}

Oil.prototype.destroy = function() {
  $("li#oil_" + this.id).remove();
}

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
    .success(Oil.destroy)
  });
})