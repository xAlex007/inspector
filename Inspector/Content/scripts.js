function Mensagem(redir, url) {
    var msgModal = new bootstrap.Modal(document.getElementById('msgModal'), {
        keyboard: false
    })
    msgModal.show();
    setTimeout(function () {
        msgModal.hide();
        msgModal.dispose();
        if (redir) {
            window.location.href = url + ".aspx";
        } else {
            window.location.href = window.location.href;
        }
    }, 4000);
}
