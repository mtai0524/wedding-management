
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
        var li = '';
        $.ajax({
            url: '/Notification/GetNotifications',
            method: 'GET',
            success: (result) => {
                console.log(result);
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

    function OnConnected() {
        var username = $('#hfUsername').val();
        connection.invoke("SaveUserConnection", username).catch(function (err) {
            return console.error(err.toString());
        })
    }
   

    connection.on("UpdateUsersList", function (userList) {
        var avatarList = document.querySelector('.avatar-list');
        avatarList.innerHTML = ""; // Xóa hết các thẻ img cũ trước khi cập nhật
        for (var i = 0; i < userList.length; i++) {
            var img = document.createElement('img');

            img.classList.add('avatar', 'rounded-circle');
            img.src = userList[i]; // Sử dụng URL của người dùng từ danh sách
            img.alt = "avatar"; // Thay đổi alt tùy thuộc vào tên người dùng
            avatarList.appendChild(img);
        }
    });

    connection.on("ReceivedNotification", function (message) {
        DisplayGeneralNotification(message, 'General Message');
    });

    connection.on("ReceivedPersonalNotification", function (message, username) {
        DisplayPersonalNotification(message, 'Hey ' + username);
    });

    //connection.on("ReceivedGroupNotification", function (message, username) {
    //    DisplayGroupNotification(message, 'Team ' + username);
    //});
});