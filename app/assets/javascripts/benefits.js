// $(function() {
//   $("form.new_benefit").on("submit", function(e) {
//     e.preventDefault();

//     var $form = $(this);
//     var action = $form.attr("action");
//     var params = $form.serialize();

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