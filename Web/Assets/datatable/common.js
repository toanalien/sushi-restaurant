$(document).ready(function() {
  $('.delete-object').on('click', function(event) {
    event.preventDefault();
    url = $(this).data('url')
    id = $(this).attr('id')
    swalDelete(url, id)
  });

  $('.show-modal').on('click', function(event) {
    event.preventDefault();
    url = $(this).data('url')
    id = $(this).attr('id')
    $('.modal-dialog').load( url, function() {
      $('#boostrapModal-1').modal('show')
    });
  });
});

function Delete(url, id) {
  $.ajax({
    type: 'POST',
    url: url,
    success : function (result){
      if (result.status) {
        swalSuccess(result.message)
        removeRow(id)
        $('.dataTable').DataTable().draw()
      } else {
        swalError(result.message)
      }
    }
  });
}

function removeRow(id) {
  table = $('.dataTable').DataTable()
  row = $(`tr#${id}`)
  table.row(row).remove().draw()
}