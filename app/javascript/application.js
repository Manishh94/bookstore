// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"


const forms = document.querySelectorAll("form");

// Add a "submit" event listener on each form to intercept the submission
// and override the default behavior
// forms.forEach((form) => {
//   form.addEventListener("submit", (event) => {
//   // Override default behavior
//     event.preventDefault()
//     // Convert the form submission into an AJAX request
//     // Replace the current page's <body> with the <body> of the response
//     // and leave the <head> unchanged
//   }
// )});