﻿
$(() => {
   LoadNotificationData();
    LoadChatData();
    LoadChatDataToChatBox();

    var connection = new signalR.HubConnectionBuilder().withUrl("/chatHub").build();
    connection.start().then(function () {
        console.log('connected to hub');
    }).catch(function (err) {
        return console.error(err.toString());
    });

    connection.on("ReceiveNotificationRealtime", function (notifications) {
        LoadNotificationData();
        LoadChatDataToChatBox();
        LoadChatData();
    });


    var isFirstLoad = true;
    var isFirstLoadToChatBox = true;

    function LoadChatDataToChatBox() {
        $.ajax({
            url: '/Chat/GetMessages',
            method: 'GET',
            success: (result) => {
                console.log(result);
                var chatBoxContent = '';

                $.each(result, (k, v) => {
                    chatBoxContent += `
                    <div class="chat-message user2 d-flex">
                        <img src="${v.Avatar}" class="avatar" alt="Avatar">
                      <div class="message-bubble" style="overflow: auto; background-color:#E6E6E6; border: 1px solid transparent; border-radius:  0px 13px 13px 13px; ">
                         <div class="font-weight-bold" style="text-color:#8CB2B2;margin-top:-5px">${v.Username}</div>
                            ${v.Message}
                            <div style="float:right; margin-top:20px; font-size:10px; font-weight:700;color:gray" class="message-time">${v.NotificationDateTime}</div>
                        </div>

                    </div>`;
                });

                $(".chat-box").html(chatBoxContent);

                if (isFirstLoadToChatBox) {
                    scrollToBottomWhenSendMessage();
                    isFirstLoadToChatBox = false;
                }
            },
            error: (error) => {
                console.log(error);
            }
        });
    }


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
                            <div class="flex-shrink-1 box-messages rounded py-2 px-3 ml-3" style="max-width:90%; background-color:#E6E6E6; border: 1px solid transparent; border-radius: 0px 13px 13px 13px !important;">
                                <div class="font-weight-bold mb-1" style="text-color:#8CB2B2;">${v.Username}</div>
                                ${v.Message}
                                <div class="message-details">
                                    <div class="text-muted small text-nowrap mt-2 date-time" style="float:right">${v.NotificationDateTime}</div>
                                </div>
                            </div>
                        </div>`;
                });
                $(".chat-messages-list").html(listItems);

                if (isFirstLoad) {
                    scrollToBottom();
                    isFirstLoad = false;
                }
            },
            error: (error) => {
                console.log(error);
            }
        });
    }
    $(document).ready(function () {
        // Bắt sự kiện submit của form
        $(".chatForm").submit(function (e) {
            e.preventDefault(); // Ngăn chặn việc gửi form theo cách thông thường

            // Lấy dữ liệu từ form
            var formData = $(this).serialize();

            // Gửi yêu cầu AJAX
            $.ajax({
                url: $(this).attr('action'), // Lấy đường dẫn từ thuộc tính action của form
                type: $(this).attr('method'), // Lấy phương thức từ thuộc tính method của form
                data: formData,
                success: function (response) {
                    console.log("Message sent successfully!");
                    console.log(response);

                    // Xóa nội dung của input sau khi gửi thành công
                    $(".chatForm input[name='Message']").val('');

                    // Cuộn xuống cuối trang
                    scrollToBottomWhenSendMessage();
                },
                error: function (xhr, status, error) {
                    console.error("AJAX Error:", error);
                }
            });
        });
    });

    function scrollToBottomWhenSendMessage() {
        setTimeout(() => {
            const chatMessagesList = document.querySelector('.chat-messages-list');
            if (chatMessagesList) {
                chatMessagesList.scrollTop = chatMessagesList.scrollHeight;
            }
            const chatMessagesListMini = document.querySelector('.chat-box');
            if (chatMessagesListMini) {
                chatMessagesListMini.scrollTop = chatMessagesListMini.scrollHeight;
            }
        }, 1000);
    }
    function scrollToBottom() {
        setTimeout(() => {
            const chatMessagesList = document.querySelector('.chat-messages-list');
            if (chatMessagesList) {
                chatMessagesList.scrollTop = chatMessagesList.scrollHeight;
            }
        }, 1000);
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
    var isTyping = false; // Biến đánh dấu liệu người dùng có đang nhập hay không

    // chat box mini
    document.querySelector('.input-current-user').addEventListener('input', function () {
        if (!isTyping) {
            isTyping = true;
            connection.invoke("NotifyTyping", true).catch(function (err) {
                return console.error(err.toString());
            });
        }
    });
    document.querySelector('.input-current-user').addEventListener('blur', function () {
        if (isTyping) {
            isTyping = false;
            connection.invoke("NotifyTyping", false).catch(function (err) {
                return console.error(err.toString());
            });
        }
    });


    // chat box main

    document.querySelector('input[name="Message"]').addEventListener('input', function () {
        if (!isTyping) {
            isTyping = true;
            connection.invoke("NotifyTyping", true).catch(function (err) {
                return console.error(err.toString());
            });
        }
    });
 

    // Xử lý khi người dùng ngừng nhập
    document.querySelector('input[name="Message"]').addEventListener('blur', function () {
        if (isTyping) {
            isTyping = false;
            connection.invoke("NotifyTyping", false).catch(function (err) {
                return console.error(err.toString());
            });
        }
    });

    connection.on("OnConnected", function () {
        OnConnected();
        LoadChatData();
        LoadChatDataToChatBox();
    });

    connection.on("ReceiveTypingNotification", function (userCurrent, isTyping) {
        var userCurrentChatElement = document.querySelector('.user-current-chat');
        var textUserCurrentChatElement = document.querySelector('.text-user-current-chat');
        var avatarUserCurrentChat = document.querySelector('.avatar-user-current-chat');
        if (isTyping) {
            console.log(userCurrent.firstName + " is typing...");
            userCurrentChatElement.textContent = userCurrent.firstName + " " + userCurrent.lastName;
            textUserCurrentChatElement.textContent = "Đang nhập tin nhắn...";
            avatarUserCurrentChat.style.visibility = "visible";
            avatarUserCurrentChat.src = userCurrent.avatar;
        } else {
            console.log(userCurrent.firstName + " stopped typing.");
            userCurrentChatElement.textContent = "";
            textUserCurrentChatElement.textContent = "";
            avatarUserCurrentChat.src = "";

            avatarUserCurrentChat.style.visibility = "hidden"; 
        }
    });


    connection.on("UpdateUsersOfflineList", function (userList) {
        var listGroupOnline = document.querySelector('.list-group-offline');
        listGroupOnline.innerHTML = ""; // Xóa hết các thẻ a cũ trước khi cập nhật
        userList.forEach(function (item) {
            var listGroupItem = document.createElement("a");
            listGroupItem.href = "#";
            listGroupItem.classList.add("list-group-item", "list-group-item-action", "border-0");

            var dFlexContainer = document.createElement("div");
            dFlexContainer.classList.add("current-user");

            var spanStatus = document.createElement("span");
            spanStatus.classList.add("status", "offline");

            var avatarImg = document.createElement("img");
            avatarImg.src = item.avatar ? item.avatar : "https://as2.ftcdn.net/v2/jpg/04/10/43/77/1000_F_410437733_hdq4Q3QOH9uwh0mcqAhRFzOKfrCR24Ta.jpg";
            avatarImg.classList.add("rounded-circle", "mr-1", "img-list-user");
            avatarImg.alt = item.username ? item.username : "hehe";

            avatarImg.width = "40";
            avatarImg.height = "40";
            avatarImg.title = item.email;

            avatarImg.appendChild(spanStatus);
            // Tạo div chứa email popup
            var emailPopup = document.createElement("div");
            emailPopup.classList.add("email-popup");
            emailPopup.textContent = item.email;
            emailPopup.style.display = "none"; // Ẩn popup ban đầu

            avatarImg.addEventListener("click", function () {
                emailPopup.style.display = emailPopup.style.display === "none" ? "block" : "none";
            });
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

            dFlexContainer.appendChild(emailPopup);
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
            dFlexContainer.classList.add("current-user");

            var avatarImg = document.createElement("img");
            avatarImg.src = item.avatar ? item.avatar : "https://as2.ftcdn.net/v2/jpg/04/10/43/77/1000_F_410437733_hdq4Q3QOH9uwh0mcqAhRFzOKfrCR24Ta.jpg";
            avatarImg.classList.add("rounded-circle", "mr-1", "img-list-user");
            avatarImg.alt = item.username ? item.username : "hehe";
            avatarImg.width = "40";
            avatarImg.height = "40";
            avatarImg.title = item.email;
            avatarImg.appendChild(spanStatus);
            var emailPopup = document.createElement("div");
            emailPopup.classList.add("email-popup");
            emailPopup.textContent = item.email;
            emailPopup.style.display = "none";
            avatarImg.addEventListener("click", function () {
                emailPopup.style.display = emailPopup.style.display === "none" ? "block" : "none";
            });
            dFlexContainer.appendChild(emailPopup);


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


    //noti
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