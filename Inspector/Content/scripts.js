function Mensagem() {
    var msgModal = new bootstrap.Modal(document.getElementById('msgModal'),{
        keyboard: false
    })
    msgModal.show();
   setTimeout(function () {
        msgModal.hide();
        msgModal.dispose();
        window.location.href = window.location.href;
    }, 5000);
}