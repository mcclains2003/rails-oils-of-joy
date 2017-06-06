function Benefit(attributes) {
  this.description = attributes.description;
};

Benefit.prototype.renderLI = function() {
  return `<li>${this.description}</li>`
};

$(function() {
  $("form.new_benefit").on("submit", function(e) {
    e.preventDefault();

    var $form = $(this);
    var action = $form.attr("action");
    var params = $form.serialize();

    $.ajax({
      method: "POST",
      url: action,
      data: params,
      dataType: "json"
    })
    .success(successCallback)
    .error(errorCallback)
  });
});

var successCallback = function(json) {
  var benefit = new Benefit(json);
  var benefitLi = benefit.renderLI();
  var $ol = $("div.benefit ul")
  $ol.append(benefitLi);
}

var errorCallback = function(response) {
  console.log("You broke it" + response)
}