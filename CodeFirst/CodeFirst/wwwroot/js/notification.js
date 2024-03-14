// Please see documentation at https://docs.microsoft.com/aspnet/core/client-side/bundling-and-minification
// for details on configuring this project to bundle and minify static web assets.

// Write your JavaScript code.


function DisplayGeneralNotification(message, title, duration) {
    const currentTime = new Date().toLocaleTimeString();
    Toastify({
        text: `${message} ${currentTime}`,
        duration: duration,
        close: true,
        gravity: "top",
        position: 'right',
        backgroundColor: "linear-gradient(to right, #FFD700, #FFA500)", // Thay đổi màu sắc của thanh chạy thông báo
        stopOnFocus: true, // Dừng thanh chạy khi người dùng tương tác với trang
        onClick: function () { } // Chức năng được gọi khi toast được nhấp
    }).showToast();
}



function DisplayPersonalNotification(message, title) {
    setTimeout(function () {
        toastr.options = {
            closeButton: true,
            progressBar: true,
            showMethod: 'slideDown',
            timeOut: 4000
        };
        toastr.success(message, title);

    }, 1300);
}

function DisplayGroupNotification(message, title) {
    setTimeout(function () {
        toastr.options = {
            closeButton: true,
            progressBar: true,
            showMethod: 'slideDown',
            timeOut: 4000
        };
        toastr.info(message, title);

    }, 1300);
}
