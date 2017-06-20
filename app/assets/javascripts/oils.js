$(function () {
  $('a#oils').removeAttr("data-method")

  $("a#oils").on("click", function(e) {
    var oilsUrl = this["href"] + ".json"
    fetch(oilsUrl)
      .then(res => res.json())
      .then(oil => {

      })

    e.preventDefault();
  });
})