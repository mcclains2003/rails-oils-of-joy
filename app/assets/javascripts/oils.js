// $(function() {
//   $("a.nav-link#oils").on('click', function(e) {
//     console.log("Hello")
//     // fetch("/oils.json")
//     //   .then(res => console.log(res.json()))
//     e.preventDefault();
//   })
// })


$(function () {
  $("a#oils").on("click", function(e) {
    console.log(e);
    
    e.preventDefault();
  });
})