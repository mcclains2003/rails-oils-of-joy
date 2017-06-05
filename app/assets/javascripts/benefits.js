function Benefit(attributes) {
  this.description = attributes.description;
  this.id = attributes.id;
}

$(function() {
  Benefit.templateSource = $("#benefit-template").html();
  Benefit.template = Handlebars.compile(Benefit.templateSource);
})

Benefit.prototype.renderLI = function() {
  return Benefit.template(this)
}

$(function() {
  $("form#new_benefit").on("submit", function(e) {
    e.preventDefault();

    var $form = $(this); // returns jquery form object
    var action = $form.attr("action"); // returns the form action (post, patch)
    var params = $form.serialize(); // returns a serialized string of data, in this case auth token and the value of the input

    $.ajax({
      url: action,
      data: params,
      dataType: "json",
      method: "POST"
    })
    .success(function(json) {
      var benefit = new Benefit(json);

      var benefitLi = benefit.renderLI();

      $("div.benefit ul").append(benefitLi);
      // var source   = $("#benefit-template").html();
      // var template = Handlebars.compile(source);

      // $("div.benefit ul").append(template(json))
    })
    .error(function(response) {
      console.log("You broke it" + response)
    })
  });
});

// $(function() {
//   $("form.new_benefit").on("submit", function(e) {
//     e.preventDefault();

//     var $form = $(this); // returns jquery form object
//     var action = $form.attr("action"); // returns the form action (post, patch)
//     var params = $form.serialize(); // returns a serialized string of data, in this case auth token and the value of the input

//     $.post(action, params)
//     .success(function(json) {
//       console.log(json);
//     })
//     .error(function(response) {
//       console.log("You broke it" + response)
//     })
//   });
// });




// $(function() {
//   $("form.new_benefit").on("submit", function(e) {
//     e.preventDefault();

//     $.ajax({
//       type: ($("input[name='_method']").val() || this.method),
//       url: this.action,
//       data: $(this).serialize(),
//       success: function(response) {
//         $("#benefit_description").val("")
//         var $ol = $("div.benefit ul");
//         $ol.append(response);
//       }
//     });

//   });
// });