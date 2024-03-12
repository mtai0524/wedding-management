
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

    //connection.on("UpdateUsersList", function (userList) {
    //    var avatarList = document.querySelector('.avatar-list');
    //    avatarList.innerHTML = ""; // Xóa hết các thẻ img cũ trước khi cập nhật
    //    console.log("hehehe");
    //    console.log(userList);

    //    userList.forEach(function (user) {

    //        // Tạo một thẻ li để chứa thông tin người dùng và avatar
    //        var userInfo = $("<li>");

    //        // Thêm email của người dùng vào userInfo
    //        userInfo.text(user.email);

    //        // Nếu avatar có sẵn, hiển thị avatar
    //        if (user.avatar) {
    //            console.log(user.avatar);
    //            console.log(user.email);

    //            // Tạo thẻ img để hiển thị avatar và thiết lập các thuộc tính src và alt
    //            var avatarImg = $("<img>").attr("src", user.avatar).attr("alt", user.email + "'s Avatar").addClass("avatar");

    //            // Thêm thẻ img vào userInfo
    //            userInfo.append(avatarImg);
    //        }

    //        // Thêm userInfo vào danh sách avatar
    //        avatarList.appendChild(userInfo);
    //    });
    //});



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