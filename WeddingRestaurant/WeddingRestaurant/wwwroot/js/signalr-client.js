var connection = new signalR.HubConnectionBuilder().withUrl("/myhub").build();

connection.on("ReceiveMessage", function (user, message) {
    // Hiển thị thông báo thành công cho người dùng
    alert(message);
});

connection.start().then(function () {
    // Khi kết nối thành công
}).catch(function (err) {
    // Xử lý lỗi kết nối
});