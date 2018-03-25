// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require bootstrap
//= require jquery_ujs
//= require turbolinks
//= require dataTables/jquery.dataTables
//= require dataTables/bootstrap/3/jquery.dataTables.bootstrap
//= require bootstrap-datepicker
//= require_tree .

$(document).on('turbolinks:load', function() {
    $("table[role='datatable']").DataTable({
  // ajax: ...,
  // autoWidth: false,

  pagingType: 'full_numbers',
  'aoColumnDefs': [{
        'bSortable': false,
        'aTargets': ['nosort']
    }]
  // processing: true,
  // serverSide: true,

  // Optional, if you want full pagination controls.
  // Check dataTables documentation to learn more about available options.
  // http://datatables.net/reference/option/pagingType
});
    // table.column('.descending').order('desc').draw();
} );

$(document).on("focus", "[data-behaviour~='datepicker']", function(e){
    $(this).datepicker({
      "format": 'mm/dd/yyyy', 
      "weekStart": 1, 
      "autoclose": true
    })
});


// $(document).on('turbolinks:load', function(){
//   $("table[role='datatable']").each(function(){
//     $(this).DataTable({
//       processing: true,
//       serverSide: true,
//       ajax: $(this).data('url')
//     });
//   });  
// })