// Please see documentation at https://docs.microsoft.com/aspnet/core/client-side/bundling-and-minification
// for details on configuring this project to bundle and minify static web assets.

// Write your JavaScript code.


//function DisplayGeneralNotificationUserOnline(message, title) {
//    setTimeout(function () {
//        const Toast = Swal.mixin({
//            toast: true,
//            position: 'bottom-left',
//            showConfirmButton: false,
//            showCloseButton: true,
//            timer: 4000,
//            timerProgressBar: true,
//            didOpen: (toast) => {
//                toast.addEventListener('mouseenter', Swal.stopTimer)
//                toast.addEventListener('mouseleave', Swal.resumeTimer)
//                toast.classList.add('toast-on-top');
//            }
//        });

//        Toast.fire({
//            icon: 'info',
//            title: title,
//            text: message
//        });
//    }, 1300);
//}
function DisplayGeneralNotification(message, title) {
    setTimeout(function () {
        const Toast = Swal.mixin({
            toast: true,
            position: 'top-end',
            showConfirmButton: false,
            showCloseButton: true,
            timer: 4000,
            timerProgressBar: true,
            didOpen: (toast) => {
                toast.addEventListener('mouseenter', Swal.stopTimer)
                toast.addEventListener('mouseleave', Swal.resumeTimer)
                toast.classList.add('toast-on-top');
            }
        });

        Toast.fire({
            icon: 'info',
            title: title,
            text: message
        });
    }, 1300);
}

function DisplayGeneralNotificationUserOnline(message, title) {
    setTimeout(function () {
        iziToast.show({
            title: message,
            message: 'đang online',
            backgroundColor: '#FFFFFF',
            position: 'bottomLeft', // Đặt vị trí hiển thị
            timeout: 4000,
            close: true,
            theme: 'light',
            iconUrl:'https://cdn-icons-png.freepik.com/256/11762/11762483.png?semt=ais_hybrid',
            progressBar: true,
            animateInside: true,
            pauseOnHover: true,
            zindex:9999999999,
        });
    }, 1300);
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
