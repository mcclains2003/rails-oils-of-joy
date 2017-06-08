var currency = function(integer) {
  return "$" + integer + "0";
}

var nextProductOils = function(data) {
  var productOilsList = data["oils"];
  var oils = "";

  productOilsList.forEach(function(oil) {
    oils += "<li>" + oil["name"] + "</li>"
  });
  
  $("ul#productOils").html(oils);
}

var nextProductVolumeCost = function(data) {
  var productVolumeCosts = data["volume_costs"];
  var volumeCosts = "";

  productVolumeCosts.forEach(function(vc) {
    volumeCosts += "<li>" + vc.volume + " oz - " + currency(vc.cost) + "</li>"
  });
  
  $("ul#productVolumeCost").html(volumeCosts);
}

$(function () {
  $("a.next-product").on("click", function() {
    var nextProductID = parseInt($(".next-product").attr("data-id")) + 1;
    var nextURL = "/products/" + nextProductID;

    $.get("/products/" + nextProductID + ".json", function(data) {
      $("#productName").text(data["name"]);
      $("#productName").attr("href", nextURL);
      $("#productDescription").text(data["description"]);
      nextProductOils(data);
      nextProductVolumeCost(data);

      $("a.next-product").attr("data-id", data["id"])
    })
  });
});

$(function () {
  $("a.addFormSize").on("click", function(e) {
    var $addFormLink = $(this);
    var url = $(this).attr('data-url');

    $.get(url, function(response) {
      console.log(response);
      $addFormLink.before(response)
    })

    e.preventDefault();
  })
})

// future function for selecting item from the drop down, this will 
// impact volume_cost items that show up
// var findCategory = function() {
//   $('#product_category_id').find(":selected").text();
// }