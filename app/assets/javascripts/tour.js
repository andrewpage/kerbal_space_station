$(function() {
  var tour = new Tour({ useLocalStorage: true, backdrop: true });
  tour.addStep({
    element: ".navbar-search",
    placement: "bottom",
    title: "Searching KSS",
    content: "You can search through our database by using " +
    "these simple search features: <br><br>" +
    "<ul>" +
    "  <li>sample mod</li>" +
    "  <li>name: samp*</li>" +
    "  <li>version: 1.8.*</li>" +
    "  <li>author: bec9</li>" +
    "</ul>" +
    "Much like how Google works."
  });
  tour.addStep({
    element: "#signup",
    placement: "bottom",
    title: "Signing In",
    content: "If you'd like to do more than search" +
    "and download, just click here to create an account."
  });
  tour.start();
});
