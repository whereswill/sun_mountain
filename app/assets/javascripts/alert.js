
// this flashes on deliveries for a quick second
// $(document).ready(function() {
//     $(".alert").fadeTo(500, 0).slideUp(500, function(){
//         $(this).remove(); 
//     });
// }, 4000);

// this works just on deliveries
// window.setTimeout(function() {
//     $(".alert").fadeTo(500, 0).slideUp(500, function(){
//         $(this).remove(); 
//     });
// }, 4000);

// Web snippet
// $(document).ready( function() {
//     $('.alert').delay(5000).fadeOut();
//   });


// Chad's code from the DAM app

//"use strict";

$(document).on('turbolinks:load', loadedFlash);

// for flashes existing on page load
function loadedFlash() {
  hideFlashMessage($('.alert.alert-success'));
  hideFlashMessage($('.alert.alert-warning'));
  // errorFlashHandler($('#flash-box .flash-error'));
}

// // set through the crud js
// function setFlash(content) {
//   var flashBox = $("#flash-box"),
//       newFlash = $(content),
//       hasCloseBtn;

//   flashBox.append(newFlash);

//   // Check for close button after content is loaded
//   hasCloseBtn = newFlash.find('.flash--close').length > 0;

//   hasCloseBtn ?  errorFlashHandler(newFlash) : hideFlashMessage(newFlash);
// }

function hideFlashMessage(flash) {
  setTimeout(function() {
    flash.fadeTo(500, 0).slideUp(500, function(){
        $(this).remove(); 
    });
}, 4000);
}

// function errorFlashHandler(flash) {
//   var closeBtn = flash.find('.flash--close');

//   closeBtn.on('click', function(e) {
//     flash.remove();
//     e.preventDefault();
//   });
// }
