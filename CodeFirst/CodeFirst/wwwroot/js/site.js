
$(() => {
    LoadNotificationData();
    LoadChatData();

    var connection = new signalR.HubConnectionBuilder().withUrl("/chatHub").build();
    connection.start().then(function () {
        console.log('connected to hub');
    }).catch(function (err) {
        return console.error(err.toString());
    });

    connection.on("ReceiveNotificationRealtime", function (notifications) {
        LoadNotificationData();

    });


    function LoadChatData() {
        $.ajax({
            url: '/Chat/GetMessages',
            method: 'GET',
            success: (result) => {
                console.log(result);
                var listItems = '';

                $.each(result, (k, v) => {
                    listItems += `<div class="chat-message-right pb-4">
                                <div>
                                    <img src="${v.Avatar}" class="rounded-circle mr-1" alt="Chris Wood" width="40" height="40">
                                </div>
                                <div class="flex-shrink-1 box-messages bg-light rounded py-2 px-3 ml-3" style="max-width:90%">
                                    <div class="font-weight-bold mb-1" style="text-color:#8CB2B2;">${v.Username}</div>
                                    ${v.Message}
                                    <div class="message-details d-flex justify-content-between">
                                        <div class="text-muted small text-nowrap mt-2 date-time">${v.NotificationDateTime}</div>
                                    </div>
                                </div>
                            </div>`;
                });
                $(".chat-messages-list").html(listItems);
            },
            error: (error) => {
                console.log(error);
            }
        });
    }

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

                        <img class="avatar rounded-circle" src="${v.Avatar}" alt="img">
                        <div class="flex-fill ms-2">
                            <p class="d-flex justify-content-between mb-0">
                                <span class="font-weight-bold">${v.Username}</span>
                                <small>${v.NotificationDateTime}</small>
                            </p>
                            <span>${v.Message} </span>
                        </div>
                    </a>
                </li>`;
                });
                $("#notification-list").html(li);

                // Đếm số lượng thông báo
                var notificationCount = result.length;
                $(".badge-count").text(notificationCount);
            },
            error: (error) => {
                console.log(error);
            }
        });
    }


    connection.on("OnConnected", function () {
        OnConnected();
        UpdateUsersList();
        UpdateUsersOnlineList();
        UpdateUsersOfflineList();
    });

    connection.on("UpdateUsersOfflineList", function (userList) {
        var listGroupOnline = document.querySelector('.list-group-offline');
        listGroupOnline.innerHTML = ""; // Xóa hết các thẻ a cũ trước khi cập nhật
        userList.forEach(function (item) {
            var listGroupItem = document.createElement("a");
            listGroupItem.href = "#";
            listGroupItem.classList.add("list-group-item", "list-group-item-action", "border-0");

            var dFlexContainer = document.createElement("div");
            dFlexContainer.classList.add("d-flex", "align-items-start", "current-user");

            var spanStatus = document.createElement("span");
            spanStatus.classList.add("status", "offline");

            var avatarImg = document.createElement("img");
            avatarImg.src = item.avatar;
            avatarImg.classList.add("rounded-circle", "mr-1");
            avatarImg.alt = item.username;
            avatarImg.width = "40";
            avatarImg.height = "40";
            avatarImg.title = item.email;

            avatarImg.appendChild(spanStatus);

            var flexGrowContainer = document.createElement("div");
            flexGrowContainer.classList.add("flex-grow-1", "ml-3");

            var usernameDiv = document.createElement("div");
            usernameDiv.classList.add("username");
            usernameDiv.textContent = item.firstName + " " + item.lastName;

            var textStatusDiv = document.createElement("div");
            textStatusDiv.classList.add("text-status");

            var onlineStatusSpan = document.createElement("span");
            onlineStatusSpan.classList.add("small", "online-status", "chat-offline");
            onlineStatusSpan.textContent = 'Offline';

            textStatusDiv.appendChild(onlineStatusSpan);

            flexGrowContainer.appendChild(usernameDiv);
            flexGrowContainer.appendChild(textStatusDiv);
            flexGrowContainer.appendChild(spanStatus);

            dFlexContainer.appendChild(avatarImg);
            dFlexContainer.appendChild(flexGrowContainer);

            listGroupItem.appendChild(dFlexContainer);
            listGroupOnline.appendChild(listGroupItem);
        });
    });


    connection.on("UpdateUsersOnlineList", function (userList) {
        var listGroupOnline = document.querySelector('.list-group-online');
        listGroupOnline.innerHTML = ""; // Xóa hết các thẻ a cũ trước khi cập nhật

      
        userList.forEach(function (item) {
            var listGroupItem = document.createElement("a");
            listGroupItem.href = "#";
            listGroupItem.classList.add("list-group-item", "list-group-item-action", "border-0");

            var spanStatus = document.createElement("span");
            spanStatus.classList.add("status", "online");

            var dFlexContainer = document.createElement("div");
            dFlexContainer.classList.add("d-flex", "align-items-start", "current-user");

            var avatarImg = document.createElement("img");
            avatarImg.src = item.avatar;
            avatarImg.classList.add("rounded-circle", "mr-1");
            avatarImg.alt = item.username;
            avatarImg.width = "40";
            avatarImg.height = "40";
            avatarImg.title = item.email;
            avatarImg.appendChild(spanStatus);

            var flexGrowContainer = document.createElement("div");
            flexGrowContainer.classList.add("flex-grow-1", "ml-3");

            var usernameDiv = document.createElement("div");
            usernameDiv.classList.add("username");
            usernameDiv.textContent = item.firstName + " " + item.lastName;

            var textStatusDiv = document.createElement("div");
            textStatusDiv.classList.add("text-status");

            var onlineStatusSpan = document.createElement("span");
            onlineStatusSpan.classList.add("small", "online-status", "chat-online");
            onlineStatusSpan.textContent = 'Online';

            textStatusDiv.appendChild(onlineStatusSpan);

            flexGrowContainer.appendChild(usernameDiv);
            flexGrowContainer.appendChild(textStatusDiv);
            flexGrowContainer.appendChild(spanStatus);

            dFlexContainer.appendChild(avatarImg);
            dFlexContainer.appendChild(flexGrowContainer);

            listGroupItem.appendChild(dFlexContainer);
            listGroupOnline.appendChild(listGroupItem);
        });
    });

    connection.on("UpdateUsersList", function (userList) {
        var avatarList = document.querySelector('.avatar-list');
        avatarList.innerHTML = ""; // Xóa hết các thẻ img cũ trước khi cập nhật
        console.log("this is userList", userList);
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