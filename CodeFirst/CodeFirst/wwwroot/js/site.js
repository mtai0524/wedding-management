
$(() => {
    LoadNotificationData();

    var connection = new signalR.HubConnectionBuilder().withUrl("/chatHub").build();
    connection.start().then(function () {
        console.log('connected to hub');
    }).catch(function (err) {
        return console.error(err.toString());
    });

    LoadNotificationData();

    connection.on("ReceiveNotificationRealtime", function (notifications) {
        LoadNotificationData();

        UpdateNotificationList(notifications);
        LoadNotificationData();

    });

    LoadNotificationData();

    function LoadNotificationData() {
        $.ajax({
            url: '/Notification/GetNotifications',
            method: 'GET',
            success: (result) => {
                console.log(result);
                var li = '';
                $.each(result, (k, v) => {
                    li += `<li class="py-2 mb-1 border-bottom">
                    <a href="javascript:void(0);" class="d-flex">
                        <img class="avatar rounded-circle" src="https://source.unsplash.com/random/200x200?sig=${v.Id}" alt="img">
                        <div class="flex-fill ms-2">
                            <p class="d-flex justify-content-between mb-0">
                                <span class="font-weight-bold">${v.Username}</span>
                                <small>${v.NotificationDateTime}</small>
                            </p>
                            <span>${v.Message} <span class="badge bg-success">${v.MessageType}</span></span>
                        </div>
                    </a>
                </li>`;
                });
                $("#notification-list").html(li);

                // Đếm số lượng thông báo và hiển thị trong badge
                var notificationCount = result.length;
                $(".badge-count").text(notificationCount);
            },
            error: (error) => {
                console.log(error);
            }
        });
    }


    function UpdateNotificationList(notifications) {
        var li = '';
        $.each(notifications, (k, v) => {
            li += `<li class="py-2 mb-1 border-bottom">
            <a href="javascript:void(0);" class="d-flex">
                <img class="avatar rounded-circle" src="https://source.unsplash.com/random/200x200?sig=${v.Id}" alt="img">
                <div class="flex-fill ms-2">
                    <p class="d-flex justify-content-between mb-0">
                        <span class="font-weight-bold">${v.Username}</span>
                        <small>${v.NotificationDateTime}</small>
                    </p>
                    <span>${v.Message} <span class="badge bg-success">${v.MessageType}</span></span>
                </div>
            </a>
        </li>`;
        });
        $("#notification-list").html(li);
    }
    connection.on("OnConnected", function () {
        OnConnected();
        UpdateUsersList();
    });
   
  
    connection.on("UpdateUsersList", function (userList) {
        var avatarList = document.querySelector('.avatar-list');
        avatarList.innerHTML = ""; // Xóa hết các thẻ img cũ trước khi cập nhật

        userList.forEach(function (user) {
            if (user.avatar) {
                var avatarImg = document.createElement("img");
                avatarImg.src = user.avatar;
                avatarImg.alt = user.email + "'s Avatar";
                avatarImg.classList.add("avatar");
                 avatarImg.title = user.email; // Hiển thị email khi hover vào ảnh

                avatarList.appendChild(avatarImg);
            }
        });
    });

    connection.on("ReceivedNotificationWelcome", function (message) {
        console.log("Received Notification Welcome: ", message);
        // Hiển thị thông báo chào mừng
        DisplayGeneralNotification(message, 'quéo cơm');
    });
    connection.on("ReceivedNotificationUserOnline", function (message) {
        console.log("Received Notification Welcome: ", message);
        // Hiển thị thông báo user online
        DisplayGeneralNotificationUserOnline(message, 'cốc cốc cốc');
    });

    // Send All user 
    connection.on("ReceivedNotification", function (message) {
        console.log("hehehe");
        DisplayGeneralNotification(message, 'General Message');
    });

    //connection.on("ReceivedPersonalNotification", function (message, username) {
    //    DisplayPersonalNotification(message, 'Hey ' + username);
    //});

    //connection.on("ReceivedGroupNotification", function (message, username) {
    //    DisplayGroupNotification(message, 'Team ' + username);
    //});
});