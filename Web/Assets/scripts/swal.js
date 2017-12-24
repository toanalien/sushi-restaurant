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