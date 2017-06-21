// Product constructor function
function Product(product) {
  this.id = product.id
  this.name = product.name
  this.description = product.description
  this.oils = product.oils
  this.volume_costs = product.volume_costs
};

// Product info placement
Product.prototype.formatIndex = function() {
    return `<div class="container-fluid">
      <div class="rounded card">
        <div class="card-header">
          <a href="/products/${this["id"]}" id="productName"><h4>${this["name"]}</h4></a>
        </div>
        <div class="card-block">
          <h5 class="card-title">Description</h5>
          <p class="card-text" id="productDescription">${this["description"]}</p>
          <h5 class="card-title">Available Scents</h5>
          <p class="card-text">
            <ul id="productOils">
              ${productOils(this)}
            </ul>
          </p>
          <h5 class="card-title">Volume and Cost</h5>
          <p class="card-text">
            <ul id="productVolumeCost">
              ${productVolumeCost(this)}
            </ul>
          </p>
        </div>
      </div>
    </div>`
}

// Formats the volume_cost Cost attribute
var currency = function(integer) {
  return "$" + integer + "0";
}

// This show the oils when given product data and formats them for viewing.
var productOils = function(data) {
  var productOilsList = data["oils"];
  var oils = "";

  productOilsList.forEach(function(oil) {
    oils += "<li>" + oil["name"] + "</li>"
  });
  
  return oils;
}

// This shows the volume costs when given product data and formats them for viewing
var productVolumeCost = function(data) {
  var productVolumeCosts = data["volume_costs"];
  var volumeCosts = "";

  productVolumeCosts.forEach(function(vc) {
    volumeCosts += "<li>" + vc.volume + " oz - " + currency(vc.cost) + "</li>"
  });
  
  return volumeCosts;
}

// Product show page - next Product - button hijack, shows next product
$(function () {
  $("a.next-product").on("click", function() {
    var nextProductID = parseInt($(".next-product").attr("data-id")) + 1;
    var nextURL = "/products/" + nextProductID;

    $.get("/products/" + nextProductID + ".json", function(data) {
      $("#productName").text(data["name"]);
      $("#productName").attr("href", nextURL);
      $("#productDescription").text(data["description"]);
      $("ul#productOils").html(productOils(data));
      $("ul#productVolumeCost").html(productVolumeCost(data));
      $("a#edit_product").attr("href", nextURL + "/edit");
      $("a#delete_product").attr("href", nextURL);

      $("a.next-product").attr("data-id", data["id"])
      window.history.pushState(data, "", nextURL);
    }).fail(function() {
      alert("You have reached the end of the products")
    })
  });
});

// Volume Costs form 
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

// Posts index fetch
$(function () {
  $("a.product").on("click", function(e) {
    var categoryId = parseInt(this["id"]);
    var productsUrl = "/categories/" + categoryId + "/products.json"

    history.pushState(null, null, productsUrl);

    fetch(productsUrl)
      .then(res => res.json())
      .then(products => {
        $("div.app-container").html('')
        products.forEach(function(product) {
          var data = new Product(product);
          var text = data.formatIndex();

          $("div.app-container").append(text);
        }) 
      })

    e.preventDefault();
  });
})


