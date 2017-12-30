$(document).ready(function() {
  AddEvent()
});

function Delete(url, id) {
  $.ajax({
    type: 'POST',
    url: url,
    success : function (result){
      if (result.status) {
        swalSuccess(result.message)
        removeRow(id)
        $('#boostrapModal').modal('hide');
      } else {
        swalError(result.message)
      }
    }
  });
}

function removeRow(id) {
    console.log(123)
  table = $('.dataTable').DataTable()
  row = $(`tr#${id}`)
  table.row(row).remove().draw()
  $('.dataTable').DataTable().draw();
}

function AddEvent() {
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
      $('#boostrapModal').modal('show')
    });
  });
}