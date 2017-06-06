// function Benefit(attributes) {
//   this.description = attributes.description;
//   // this.id = attributes.id;
// };

Benefit.success = function(json) {
  var benefit = new Benefit(json);
  var benefitLi = benefit.renderLI();
  var $ol = $("div.benefit ul")
  $ol.append(benefitLi);
}

Benefit.error = function(response) {
  console.log("You broke it" + response)
}

$(function() {
  Benefit.templateSource = $("#benefit-template").html();
  Benefit.template = Handlebars.compile(Benefit.templateSource);
});

Benefit.prototype.renderLI = function() {
  return Benefit.template(this);
};

// $(function() {
//   $("form#new_benefit").on("submit", function(e) {
//     e.preventDefault();

//     var $form = $(this); // returns jquery form object
//     var action = $form.attr("action"); // returns the form action (post, patch)
//     var params = $form.serialize(); // returns a serialized string of data, in this case auth token and the value of the input

//     $.ajax({
//       url: action,
//       data: params,
//       dataType: "json",
//       method: "POST"
//     })
//     // .success(function(json) {
//     //   $("#benefit_description").val("")
//     //   var $ol = $("div.benefit ul");
//     //   $ol.append(response);
//     // })
//     .success(Benefit.success)
//     .error(Benefit.error)
//   })
// })

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
    .success(Benefit.success)
    // .success(function(json) {
    //   $("#benefit_description").val("")
    //   var $ol = $("div.benefit ul");
    //   source = $("#benefit-template").html();
    //   template = Handlebars.compile(source);
      
    //   $ol.append(template(json));
    // })
    .error(Benefit.error)
  });
}); 