function swalSuccess(message) {
  swal({
    title: 'Thành công',
    text: message,
    type: "success",
    button: 'Done',
    confirmButtonColor: "#014FFD",
  });
}

function swalError(message) {
  swal({
    title: 'Lỗi',
    text: message,
    type: "error",
    button: 'Done',
    confirmButtonColor: "#FF7861",
  });
}

function swalDelete(url, id) {
  swal({
    title: 'Bạn có chắc không?',
    text: "Xóa rồi không phục hồi được nha",
    type: "warning",
    showCancelButton: true,
    confirmButtonColor: '#3085d6',
    cancelButtonColor: '#d33',
    confirmButtonText: "Sure, xóa cmn đi",
    cancelButtonText: "Để em suy nghĩ lại",
    confirmButtonClass: 'btn btn-success',
    cancelButtonClass: 'btn btn-danger',
    closeOnConfirm: false,
    closeOnCancel: true,
    confirmButtonColor: '#f60e0e',
  }, function(isConfirm){
    if (isConfirm) {
      Delete(url, id)
    } else {
    }
  });
}