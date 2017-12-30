$(document).ready(function(){
  $('.promotionTable').DataTable({
    "columnDefs": [
        {"className": "text-center", "targets": "_all"},
      ]
  })

  $('.dataTables_filter').append('<button type="button" id="new" class="btn btn-success waves-effect waves-light">ADD NEW</button>');

  $('#new').on('click', function(event) {
    location.href = "/Admin/Promotions/Create"
  });
});