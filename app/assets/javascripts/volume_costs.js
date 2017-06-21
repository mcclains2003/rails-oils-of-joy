// Volume Cost checkbox
var formatFormCheckBox = function(vc) {
    return `<div class="d-inline-block col-md-3">
            <input class="label-checkbox" type="checkbox" value="${vc["id"]}" name="product[volume_cost_ids][]" id="product_volume_cost_ids_${vc["id"]}">
            <label for="product_volume_cost_ids_${vc["id"]}">${vc["volume"]} ozs - $${vc["cost"]}0</label>
          </div>`
}

$(function () {
  $('#product_category_id').change(function () {
    var $this = $(this);
    var categoryId = parseInt($this.find(":selected").attr("value"));
   
    $.get("/categories/" + categoryId + "/volume_costs.json", function(data) {
      $("div.vol_costs").html('')

      data.forEach(function(vc) {
        var text = formatFormCheckBox(vc);

        $("div.vol_costs").append(text);
      }) 
    });
  }).change();
});