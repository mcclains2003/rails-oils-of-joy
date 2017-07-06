/*
  1. Add event listeners to your delete buttons on the oils page 
  2. on successfull AJAX delete request (201 status) of the oil 
       -> Make sure to unbind the event listener for the delete button taht was clicked
      -> remove the item, edit and delete dynamically from the DOM 
*/

// Create an Oil constructor
function Oil(oil) {
  this.id = oil.id
  this.name = oil.name
  this.description = oil.description
};

// "instantiates" an oil object and calls the destroy prototype function
Oil.setAndDestroy = function(oil) {
  var oil = new Oil(oil);
  oil.destroy();
}

// gets the id from the just created oil object and runs .remove() which rids us of any listeners - no need for unbind() or off()
Oil.prototype.destroy = function() {
  $("li#oil_" + this.id).remove();
}

// .on "click" will get the specific input that clicked, prevent default, and then run an ajax delete call, on success it will run functions above
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
    .success(function(resp) {
      Oil.setAndDestroy(resp)
    })
  });
})