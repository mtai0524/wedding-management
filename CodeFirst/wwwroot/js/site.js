
$(() => {
    LoadNotificationData();
    LoadChatData(chatRoomId);
    LoadChatDataToChatBox(chatRoomId);
    LoadPrivateMessages(senderUserId, receiverUserId);
    GetChatRoom();
    var connection = new signalR.HubConnectionBuilder().withUrl("/chatHub").build();
    connection.start().then(function () {
        console.log('connected to hub');
    }).catch(function (err) {
        return console.error(err.toString());
    });

    connection.on("GetChatRoomSignalR", function (createRoom) {
        getChatRooms();
        JustGetChatRoom();
        getChatRooms();

    });
    connection.on("ReceiveNotificationRealtime", function (notifications) {
        LoadNotificationData();
        LoadChatDataToChatBox(chatRoomId);
        LoadChatData(chatRoomId);
    });
    connection.on("ReceiveChatPrivateRealtime", function (notifications) {
        LoadNotificationData();
        LoadChatDataToChatBox(chatRoomId);
        LoadPrivateMessages(senderUserId, receiverUserId);
        LoadPrivateMessagesMini(senderUserId, receiverUserId);
    });

    var chatRoomId = "";
    var chatRoomNameToUpdate = "";
    function GetChatRoom() {
        $.ajax({
            url: '/ChatRoom/GetChatRooms',
            method: 'GET',
            success: function (data) {
                var chatRoomList = $('<div>').addClass('chat-room-list');
                data.forEach(function (chatRoom) {
                    var chatRoomItem = $('<div>').addClass('chat-room-item').attr('data-id', chatRoom.Id);
                    var chatRoomName = $('<span>').addClass('chat-room-name').text(chatRoom.Name);
                    chatRoomItem.append(chatRoomName);
                    chatRoomList.append(chatRoomItem);
                });
                $('.list-room-chat').empty().append(chatRoomList);
                var userCurrentChatElement = document.querySelector('.user-current-chat');

                var avatarUserCurrentChat = document.querySelector('.avatar-user-current-chat');
                var chatroomname = document.querySelector('.chat-name');
                var chatroomnameToUpdate = document.querySelector('.chatRoomNameToUpdate');

                $('.chat-room-item').on('click', function () {

                    var selectedChatRoomName = $(this).find('.chat-room-name').text();
                    chatroomname.textContent = selectedChatRoomName;
                    avatarUserCurrentChat.style.visibility = "hidden";
                    userCurrentChatElement.textContent = "";
                    chatroomnameToUpdate.value = selectedChatRoomName;
                    $('.chat-room-item').removeClass('active');

                    $(this).addClass('active');

                    chatRoomId = $(this).data('id');
                    console.log(chatRoomId);
                    LoadChatData(chatRoomId);
                    LoadChatDataToChatBox(chatRoomId);
                    $('.chatRoomId').val(chatRoomId);

                });
                //$('.chat-room-item:first').trigger('click');

            },
            error: function (error) {
                console.error('Error:', error);
            }
        });
    }



    function JustGetChatRoom() {
        $.ajax({
            url: '/ChatRoom/GetChatRooms',
            method: 'GET',
            success: function (data) {
                var chatRoomList = $('<div>').addClass('chat-room-list');
                data.forEach(function (chatRoom) {
                    var chatRoomItem = $('<div>').addClass('chat-room-item').attr('data-id', chatRoom.Id);
                    var chatRoomName = $('<span>').addClass('chat-room-name').text(chatRoom.Name);
                    chatRoomItem.append(chatRoomName);
                    chatRoomList.append(chatRoomItem);
                });
                $('.list-room-chat').empty().append(chatRoomList);
                var userCurrentChatElement = document.querySelector('.user-current-chat');

                var avatarUserCurrentChat = document.querySelector('.avatar-user-current-chat');
                var chatroomname = document.querySelector('.chat-name');

                $('.chat-room-item').on('click', function () {
                    console.log("click cmmm trong getroom");

                    var selectedChatRoomName = $(this).find('.chat-room-name').text();
                    chatroomname.textContent = selectedChatRoomName;
                    avatarUserCurrentChat.style.visibility = "hidden";
                    userCurrentChatElement.textContent = "";
                    $('.chat-room-item').removeClass('active');

                    $(this).addClass('active');
                    $('.chatRoomNameToUpdate').val(selectedChatRoomName);
                });
            },
            error: function (error) {
                console.error('Error:', error);
            }
        });
    }


    $(document).ready(function () {
        $(document).on('submit', '#updateChatForm', function (event) {
            event.preventDefault();

            var chatRoomId = $('.chatRoomId').val();
            var chatRoomNameToUpdate = $('.chatRoomNameToUpdate').val();

            $.ajax({
                url: $(this).attr('action'),
                type: 'POST',
                data: {
                    chatRoomId: chatRoomId,
                    chatRoomNameToUpdate: chatRoomNameToUpdate
                },
                success: function (data) {
                    console.log('Data sent successfully:', data);
                    JustGetChatRoom();
                    getChatRooms(chatRoomId);
                },
                error: function (xhr, status, error) {
                    console.error('Error:', error);
                }
            });
        });



        // create chat room
        $(document).on('submit', '.createChatRoomFormMinhTai', function (event) {
            event.preventDefault();
            var chatRoomName = $('#chatRoomName').val();
            $.ajax({
                url: '/ChatRoom/CreateRoom',
                type: 'POST',
                contentType: 'application/json',
                data: JSON.stringify({ Name: chatRoomName }),
                success: function (data) {
                    console.log('Success:', data);
                    JustGetChatRoom();
                    getChatRooms();
                },
                error: function (error) {
                    console.error('Error:', error);
                }
            });
        });
        // delete chat room
        $(document).on('click', '#deleteChatForm', function (event) {
            event.preventDefault();
            $('#customConfirmModal').modal('show');
        });

        $('#confirmDeleteBtn').on('click', function () {
            var chatRoomId = $('.chatRoomId').val();
            $.ajax({
                url: '/ChatRoom/DeleteChatRoom',
                type: 'POST',
                data: { chatRoomId: chatRoomId },
                success: function (data) {
                    console.log('Chat room deleted successfully:', data);
                    JustGetChatRoom();
                    getChatRooms();

                    $('#customConfirmModal').modal('hide');
                    $('#infoModal').modal('hide');
                },
                error: function (xhr, status, error) {
                    console.error('Error:', error);
                }
            });
        });





        getChatRooms();
    });
    function getChatRooms(triggerChatRoomId = null) {
        $.ajax({
            type: 'GET',
            url: '/ChatRoom/GetChatRooms',
            success: function (data) {
                data.forEach(function (chatRoom) {
                    var chatRoomItem = $('<div>').addClass('chat-room-item').attr('data-id', chatRoom.Id);
                });

                var chatroomnamemini = document.querySelector('.chat-name-mini');
                $('.chat-room-item').on('click', function () {
                    console.log("click cmmm");
                    var selectedChatRoomName = $(this).find('.chat-room-name').text();
                    $('.chat-room-item').removeClass('selected-room');
                    chatroomnamemini.textContent = selectedChatRoomName;

                    $(this).addClass('selected-room');

                    chatRoomId = $(this).data('id');
                    LoadChatData(chatRoomId);
                    LoadChatDataToChatBox(chatRoomId);
                    $('.chatRoomId').val(chatRoomId);
                });

                // Trigger param
                if (triggerChatRoomId !== null) {
                    $('.chat-room-item[data-id="' + triggerChatRoomId + '"]').trigger('click');
                }
            },
            error: function (error) {
                console.error('Error:', error);
            }
        });
    }





    var isFirstLoad = true;
    var isFirstLoadToChatBox = true;

    function LoadPrivateMessagesMini(senderUserId, receiverUserId) {
        $.ajax({
            url: '/ChatPrivate/GetPrivateMessages',
            method: 'GET',
            data: {
                senderUserId: senderUserId,
                receiverUserId: receiverUserId
            },
            success: (result) => {
                $(".chat-box-private").empty();
                $.each(result, (k, v) => {


                    var senderInfo = v.SenderUser; // Đây là đối tượng chứa thông tin của người gửi
                    var senderName = senderInfo.FirstName + " " + senderInfo.LastName;
                    var senderEmail = senderInfo.Email;
                    var senderAvatar = senderInfo.Avatar;

                    var receiverInfo = v.ReceiverUser; // Đây là đối tượng chứa thông tin của người nhận
                    var receiverName = receiverInfo.FirstName + " " + receiverInfo.LastName;
                    var receiverEmail = receiverInfo.Email;
                    var receiverAvatar = receiverInfo.Avatar;
                    var isImageURL = isValidImageURL(v.ImageChat);


                    var chatMessage = $('<div>').addClass('chat-message user2 d-flex');
                    var img = $('<img>').addClass('avatar').attr('src', senderAvatar).attr('alt', `${senderName}`);

                    var messageBubble = "";
                    if (senderEmail == v.UserNameCurrent) {
                        var messageBubble = $('<div>').addClass('message-bubble').css({
                            'overflow': 'auto',
                            'background-color': '#E6E6E6',
                            'border': '3px solid #3F3F41',
                            'border-radius': '0px 13px 13px 13px'
                        });
                    }
                    else {
                        var messageBubble = $('<div>').addClass('message-bubble').css({
                            'overflow': 'auto',
                            'background-color': '#E6E6E6',
                            'border': '1px solid transparent',
                            'border-radius': '0px 13px 13px 13px'
                        });
                    }
                    var fontBold = $('<div>').addClass('font-weight-bold').css('text-color', '#8CB2B2').text(`${senderName}`);
                    var messageContent = $('<div>').text(v.Message);
                    var messageDivImage = $("<div>").html(isImageURL && v.ImageChat ? `<img src="${v.ImageChat}" class="chat-image" style="border-radius:8px;boder:1px solid transparent;float: left; clear: both; word-wrap: break-word; word-break: break-all;width:100px;height:auto" />` : "");

                    var messageTime = $('<div>').addClass('message-time').css({
                        'float': 'right',
                        'margin-top': '5px',
                        'font-size': '10px',
                        'font-weight': '700',
                        'color': 'gray'
                    }).text(v.NotificationDateTime);

                    // Thêm các phần tử con vào messageBubble
                    messageBubble.append(fontBold, messageContent, messageDivImage, messageTime);

                    // Thêm các phần tử vào chatMessage
                    chatMessage.append(img, messageBubble);

                    // Thêm chatMessage vào chat box
                    $(".chat-box-private").append(chatMessage);
                });

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

    function LoadChatDataToChatBox(chatRoomId) {
        $.ajax({
            url: '/Chat/GetMessages',
            method: 'GET',
            data: { chatRoomId: chatRoomId }, // Truyền roomId vào data của AJAX request
            success: (result) => {
                console.log(result);

                $(".chat-box").empty(); // Xóa nội dung hiện tại của chat box trước khi thêm mới

                $.each(result, (k, v) => {

                    if (v.ChatRoom == chatRoomId) {
                        var chatMessage = $('<div>').addClass('chat-message user2 d-flex');
                        var img = $('<img>').addClass('avatar').attr('src', v.AvatarChat).attr('alt', `${v.FirstNameChat} ${v.LastNameChat}`);
                        var isImageURL = isValidImageURL(v.ImageChatRoom);

                        var messageBubble = "";
                        if (v.Email == v.UserNameCurrent) {
                            var messageBubble = $('<div>').addClass('message-bubble').css({
                                'overflow': 'auto',
                                'background-color': '#E6E6E6',
                                'border': '3px solid #3F3F41',
                                'border-radius': '0px 13px 13px 13px'
                            });
                        }
                        else {
                            var messageBubble = $('<div>').addClass('message-bubble').css({
                                'overflow': 'auto',
                                'background-color': '#E6E6E6',
                                'border': '1px solid transparent',
                                'border-radius': '0px 13px 13px 13px'
                            });
                        }
                        var fontBold = $('<div>').addClass('font-weight-bold').css('text-color', '#8CB2B2').text(`${v.FirstNameChat} ${v.LastNameChat}`);
                        var messageContent = $('<div>').text(v.Message);
                        var messageTime = $('<div>').addClass('message-time').css({
                            'float': 'right',
                            'margin-top': '5px',
                            'font-size': '10px',
                            'font-weight': '700',
                            'color': 'gray'
                        }).text(v.NotificationDateTime);
                        var messageDivImage = $("<div>").html(isImageURL && v.ImageChatRoom ? `<img src="${v.ImageChatRoom}" class="chat-image" style="border-radius:8px;boder:1px solid transparent;float: left; clear: both; word-wrap: break-word; word-break: break-all;width:100px;height:auto" />` : "");

                        messageBubble.append(fontBold, messageContent, messageDivImage, messageTime);

                        chatMessage.append(img, messageBubble);

                        $(".chat-box").append(chatMessage);
                    }
                });

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




    function LoadChatData(chatRoomId) {
        $.ajax({
            url: '/Chat/GetMessages',
            method: 'GET',
            data: { chatRoomId: chatRoomId },
            success: (result) => {
                console.log(result);
                var chatMessagesList = $(".chat-messages-list-room");
                chatMessagesList.empty(); // Xóa nội dung hiện tại của chat-messages-list
                $.each(result, (k, v) => {
                    if (v.ChatRoom == chatRoomId) {

                        var boxMessagesDiv = "";
                        var chatMessageRightDiv = "";
                        var avatarImg = "";
                        var imgDiv = "";
                        var fontBoldDiv = "";
                        var messageDiv = "";
                        var dateTimeDiv = "";
                        var messageDetailsDiv = "";
                        var isImageURL = isValidImageURL(v.ImageChatRoom);

                        if (v.Email == v.UserNameCurrent) {
                            var chatMessageRightDiv = $("<div>").addClass("chat-message-right pb-4").css({
                                "display": "block"
                            });

                            var imgDiv = $("<div>").css({
                                "float": "right", // Chuyển sang bên phải
                                "margin-left": "20px" // Giá trị margin có thể thay đổi tùy theo mong muốn
                            });

                            var avatarImg = $("<img>").attr({
                                src: v.AvatarChat,
                                class: "rounded-circle mr-1",
                                alt: v.FirstNameChat + " " + v.LastNameChat,
                                width: "40",
                                height: "40",
                            }).css("float", "right"); // Chuyển hình ảnh sang bên phải

                            imgDiv.append(avatarImg);
                            chatMessageRightDiv.append(imgDiv);

                            var boxMessagesDiv = $("<div>").addClass("flex-shrink-1 box-messages email-matches rounded py-2 px-3 ml-3").css({
                                "max-width": "84%",
                                "background-color": "#E6E6E6",
                                "border": "3px solid #3F3F41",
                                "border-radius": "0px 13px 13px 13px",
                                "float": "right" // Chuyển sang bên phải
                            });
                            var fontBoldDiv = $("<div>").addClass("font-weight-bold mb-1").css({
                                "color": "black",
                                "float": "right" // Chuyển sang bên phải
                            }).text(v.FirstNameChat + " " + v.LastNameChat);

                            var messageDiv = $("<div>")
                                .text(v.Message)
                                .css({
                                    "float": "left", // Chuyển sang bên phải
                                    "clear": "both",
                                    "word-wrap": "break-word", // Xuống dòng 
                                    "word-break": "break-all"
                                });
                            var messageDivImage = $("<div>").addClass("message-content-chat-private-main").html(isImageURL && v.ImageChatRoom ? `<img src="${v.ImageChatRoom}" class="chat-image" style="border-radius:8px;boder:1px solid transparent;float: left; clear: both; word-wrap: break-word; word-break: break-all;width:200px;height:auto" />` : "");

                            // Tạo messageDetailsDiv và áp dụng clear: both
                            var messageDetailsDiv = $("<div>").addClass("message-details").css("clear", "both");

                            // Tạo dateTimeDiv và áp dụng float: right
                            var dateTimeDiv = $("<div>").addClass("text-muted small text-nowrap mt-2 date-time").css("float", "left").text(v.NotificationDateTime);
                        }
                        else {
                            var chatMessageRightDiv = $("<div>").addClass("chat-message-right pb-4");
                            imgDiv = $("<div>");
                            avatarImg = $("<img>").attr({
                                src: v.AvatarChat,
                                class: "rounded-circle mr-1",
                                alt: v.FirstNameChat + " " + v.LastNameChat,
                                width: "40",
                                height: "40"
                            });
                            imgDiv.append(avatarImg);
                            chatMessageRightDiv.append(imgDiv);

                            boxMessagesDiv = $("<div>").addClass("flex-shrink-1 box-messages email-matches rounded py-2 px-3 ml-3").css({
                                "max-width": "84%",
                                "background-color": "#E6E6E6",
                                "border": "1px solid transparent",
                                "border-radius": "0px 13px 13px 13px"
                            });
                            fontBoldDiv = $("<div>").addClass("font-weight-bold mb-1").css("color", "black").text(v.FirstNameChat + " " + v.LastNameChat);
                            messageDiv = $("<div>").text(v.Message);
                            var messageDivImage = $("<div>").addClass("message-content-chat-private-main").html(isImageURL && v.ImageChatRoom ? `<img src="${v.ImageChatRoom}" class="chat-image" style="border-radius:8px;boder:1px solid transparent;float: left; clear: both; word-wrap: break-word; word-break: break-all;width:200px;height:auto" />` : "");

                            messageDetailsDiv = $("<div>").addClass("message-details");
                            dateTimeDiv = $("<div>").addClass("text-muted small text-nowrap mt-2 date-time").css("float", "right").text(v.NotificationDateTime);
                        }


                        messageDetailsDiv.append(dateTimeDiv);
                        boxMessagesDiv.append(fontBoldDiv, messageDiv, messageDivImage, messageDetailsDiv);
                        chatMessageRightDiv.append(boxMessagesDiv);

                        chatMessagesList.append(chatMessageRightDiv);
                    }

                });

                scrollToBottom();
            },
            error: (error) => {
                console.log(error);
            }
        });
    }


    $(document).ready(function () {
        $(".chatForm").submit(function (e) {
            e.preventDefault();

            // Hiển thị toast khi bắt đầu gửi
            iziToast.show({
                title: 'Đang gửi...',
                backgroundColor: '#FFFFFF',
                position: 'bottomLeft',
                timeout: 2000, // Không tự động đóng
                close: true,
                theme: 'light',
                iconUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRHzRuuOgIm-ctRXgougA-RRaTYPR9td-P7lBPEWWxT5R0v5V0jqI5n8MGlgF75xDzKuVc&usqp=CAU',
                progressBar: true,
                animateInside: true,
                pauseOnHover: true,
            });

            // Tạo một đối tượng FormData từ form
            var formData = new FormData(this);

            // Gửi yêu cầu AJAX
            $.ajax({
                url: $(this).attr('action'),
                type: $(this).attr('method'),
                data: formData,
                processData: false,
                contentType: false,
                success: function (response) {
                    console.log("Message sent successfully!");
                    console.log(response);



                    var fileNameDisplay = document.getElementById("fileNameDisplay");
                    if (fileNameDisplay) {
                        fileNameDisplay.style.display = "none";
                    }
                    $(".chatForm input[name='Message']").val('');
                    var input = document.getElementById('fileInput');
                    input.value = null;
                    var inputRoom = document.getElementById('fileInputChatRoom');
                    inputRoom.value = null;
                    // Ẩn toast khi gửi thành công
                    iziToast.show({
                        title: 'Đã gửi!',
                        backgroundColor: '#FFFFFF',
                        position: 'bottomLeft',
                        timeout: 2000, // Không tự động đóng
                        close: true,
                        theme: 'light',
                        iconUrl: 'https://static.thenounproject.com/png/3383823-200.png',
                        progressBar: true,
                        animateInside: true,
                        pauseOnHover: true,
                    });
                    scrollToBottomWhenSendMessage();

                },
                error: function (xhr, status, error) {
                    console.error("AJAX Error:", error);
                    // Ẩn toast nếu có lỗi
                    iziToast.hide({}, document.querySelector('.iziToast'));
                }
            });
        });
    });


    $(document).ready(function () {
        $(".chatFormRoom").submit(function (e) {
            e.preventDefault();
            iziToast.show({
                title: 'Đang gửi...',
                backgroundColor: '#FFFFFF',
                position: 'bottomLeft',
                timeout: 2000,
                close: true,
                theme: 'light',
                iconUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRHzRuuOgIm-ctRXgougA-RRaTYPR9td-P7lBPEWWxT5R0v5V0jqI5n8MGlgF75xDzKuVc&usqp=CAU',
                progressBar: true,
                animateInside: true,
                pauseOnHover: true,
            });
            var formData = $(this).serialize();

            $.ajax({
                url: $(this).attr('action'),
                type: $(this).attr('method'),
                data: formData,
                success: function (response) {
                    console.log("Message sent successfully!");
                    console.log(response);
                    var fileNameDisplay = document.getElementById("fileNameDisplay");
                    if (fileNameDisplay) {
                        fileNameDisplay.style.display = "none";
                    }
                    $(".chatFormRoom input[name='Message']").val('');
                    var input = document.getElementById('fileInputChatRoom');
                    input.value = null;



                    iziToast.show({
                        title: 'Đã gửi roi ne!',
                        backgroundColor: '#FFFFFF',
                        position: 'bottomLeft',
                        timeout: 2000,
                        close: true,
                        theme: 'light',
                        iconUrl: 'https://static.thenounproject.com/png/3383823-200.png',
                        progressBar: true,
                        animateInside: true,
                        pauseOnHover: true,
                    });
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

            const chatMessagesListRoom = document.querySelector('.chat-messages-list-room');
            if (chatMessagesListRoom) {
                chatMessagesListRoom.scrollTop = chatMessagesListRoom.scrollHeight;
            }
            const chatMessagesListMini = document.querySelector('.chat-box');
            const chatMessagesListMiniPrivate = document.querySelector('.chat-box-private');
            if (chatMessagesListMini) {
                chatMessagesListMini.scrollTop = chatMessagesListMini.scrollHeight;
                chatMessagesListMiniPrivate.scrollTop = chatMessagesListMiniPrivate.scrollHeight;
            }
        }, 500);
    }
    function scrollToBottom() {
        setTimeout(() => {
            const chatMessagesListRoom = document.querySelector('.chat-messages-list-room');
            if (chatMessagesListRoom) {
                chatMessagesListRoom.scrollTop = chatMessagesListRoom.scrollHeight;
            }

            const chatMessagesList = document.querySelector('.chat-messages-list');
            if (chatMessagesList) {
                chatMessagesList.scrollTop = chatMessagesList.scrollHeight;
            }
        }, 200);
    }
    function LoadNotificationData() {
        $.ajax({
            url: '/Notification/GetNotifications',
            method: 'GET',
            success: (result) => {
                console.log(result);
                var li = '';
                $.each(result, (k, v) => {
                    var senderInfo = v.User;
                    var senderFirstName = senderInfo.FirstName;
                    var senderLastName = senderInfo.LastName;
                    var senderAvatar = senderInfo.Avatar;
                    li += `<li class="py-2 mb-1 border-bottom">
                    <a href="javascript:void(0);" class="d-flex">

                        <img class="avatar rounded-circle" src="${senderAvatar}" alt="img">
                        <div class="flex-fill ms-2">
                            <p class="d-flex justify-content-between mb-0">
                                <span class="font-weight-bold">${senderFirstName} ${senderLastName} </span>
                                <small style="font-size:0.9rem; color:gray">${v.NotificationDateTime}</small>
                            </p>
                            <span>${v.Message} </span>
                        </div>
                    </a>
                </li>`;
                });
                $("#notification-list").html(li);

                var notificationCount = result.length;
                $(".badge-count").text(notificationCount);
            },
            error: (error) => {
                console.log(error);
            }
        });
    }
    var isTyping = false;

    document.querySelector('.btn-chat').addEventListener('click', function () {
        isTyping = false;
        connection.invoke("NotifyTyping", false).catch(function (err) {
            return console.error(err.toString());
        });
    });
    document.querySelector('.btn-chat-mini').addEventListener('click', function () {
        isTyping = false;
        connection.invoke("NotifyTyping", false).catch(function (err) {
            return console.error(err.toString());
        });
    });
    // chat box mini
    document.querySelector('.input-current-user').addEventListener('input', function () {
        var messageInput = this.value.trim(); // Lấy giá trị của input và loại bỏ các khoảng trắng ở đầu và cuối
        if (messageInput === '') {
            isTyping = false;
            connection.invoke("NotifyTyping", false).catch(function (err) {
                console.error(err.toString());
            });
        } else {
            if (!isTyping) {
                isTyping = true;
                connection.invoke("NotifyTyping", true).catch(function (err) {
                    console.error(err.toString());
                });
            }

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
        var messageInput = this.value.trim();
        if (messageInput === '') {
            isTyping = false;
            connection.invoke("NotifyTyping", false).catch(function (err) {
                console.error(err.toString());
            });
        } else {
            if (!isTyping) {
                isTyping = true;
                connection.invoke("NotifyTyping", true).catch(function (err) {
                    console.error(err.toString());
                });
            }

        }
    });
    // Xử lý khi người dùng ngừng nhập
    document.querySelector('input[name="Message"]').addEventListener('blur', function () {
        if (isTyping) {
            isTyping = false;
            connection.invoke("NotifyTyping", false, receiverUserId).catch(function (err) {
                console.log("blur texting for receiver: " + receiverUserId);

                return console.error(err.toString());
            });
        }
    });


    // xử lý trong phần private
    document.getElementById('input-chat-private').addEventListener('input', function () {
        var messageInput = this.value.trim();
        if (messageInput == '') {
            isTyping = false;
            connection.invoke("NotifyTyping", false, receiverUserId).catch(function (err) {
                console.error(err.toString());
            });
        } else {
            if (!isTyping) {
                isTyping = true;
                connection.invoke("NotifyTyping", true, receiverUserId).catch(function (err) {
                    console.error(err.toString());
                });
            }

        }
    });

    document.getElementById('input-chat-private').addEventListener('blur', function () {
        if (isTyping) {
            isTyping = false;
            connection.invoke("NotifyTyping", false, receiverUserId).catch(function (err) {
                console.log("blur texting for receiver: " + receiverUserId);

                return console.error(err.toString());
            });
        }
    });


    connection.on("OnConnected", function () {
        OnConnected();
        LoadChatData(chatRoomId);
        LoadChatDataToChatBox(chatRoomId);
        LoadPrivateMessages(senderUserId, receiverUserId);
        LoadPrivateMessagesMini(senderUserId, receiverUserId);
        GetChatRoom();
    });

    connection.on("ReceiveTypingNotification", function (userCurrent, isTyping) {
        var userCurrentChatMiniElement = document.querySelector('.user-current-chatmini');
        var dotChatMiniContainer = document.querySelector('.dot-chatmini-container');
        if (isTyping && (receiverUserItemId == receiverUserId)) {
            console.log("id click len giao dien: " + receiverUserItemId + "=== " + "id muon gui: " + receiverUserId);

            console.log(userCurrent.firstName + " is typing...");
            userCurrentChatMiniElement.textContent = userCurrent.firstName + " " + userCurrent.lastName;
            dotChatMiniContainer.style.visibility = "visible";
        } else {

            console.log(userCurrent.firstName + " stopped typing.");
            userCurrentChatMiniElement.textContent = "";
            dotChatMiniContainer.style.visibility = "hidden";
        }
    });
    var senderUserId = currentUserId;
    var receiverUserId = $('.receiverUserId').val();
    function LoadPrivateMessages(senderUserId, receiverUserId) {
        $.ajax({
            url: '/ChatPrivate/GetPrivateMessages',
            method: 'GET',
            data: {
                senderUserId: senderUserId,
                receiverUserId: receiverUserId
            },
            success: (result) => {
                console.log(result);
                var chatMessagesList = $(".chat-messages-list");
                chatMessagesList.empty();
                $.each(result, (k, v) => {


                    var senderInfo = v.SenderUser;
                    var senderName = senderInfo.FirstName + " " + senderInfo.LastName;
                    var senderEmail = senderInfo.Email;
                    var senderAvatar = senderInfo.Avatar;

                    var receiverInfo = v.ReceiverUser;
                    var receiverName = receiverInfo.FirstName + " " + receiverInfo.LastName;
                    var receiverEmail = receiverInfo.Email;
                    var receiverAvatar = receiverInfo.Avatar;

                    var boxMessagesDiv = "";
                    var chatMessageRightDiv = "";
                    var avatarImg = "";
                    var imgDiv = "";
                    var fontBoldDiv = "";
                    var messageDiv = "";
                    var messageDivImage = "";
                    var dateTimeDiv = "";
                    var messageDetailsDiv = "";
                    var isImageURL = isValidImageURL(v.ImageChat);
                    if (senderUserId == v.SenderUserId) {
                        var chatMessageRightDiv = $("<div>").addClass("chat-message-right pb-4").css({
                            "display": "block"
                        });

                        var imgDiv = $("<div>").css({
                            "float": "right",
                            "margin-left": "20px"
                        });

                        var avatarImg = $("<img>").attr({
                            src: senderAvatar,
                            class: "rounded-circle mr-1",
                            alt: senderName,
                            width: "40",
                            height: "40",
                        }).css("float", "right");

                        imgDiv.append(avatarImg);
                        chatMessageRightDiv.append(imgDiv);

                        var boxMessagesDiv = $("<div>").addClass("flex-shrink-1 box-messages email-matches rounded py-2 px-3 ml-3").css({
                            "max-width": "84%",
                            "background-color": "#E6E6E6",
                            "border": "3px solid #3F3F41",
                            "border-radius": "0px 13px 13px 13px",
                            "float": "right"
                        });
                        var fontBoldDiv = $("<div>").addClass("font-weight-bold mb-1").css({
                            "color": "black",
                            "float": "right"
                        }).text(senderName);
                        var messageDiv = $("<div>")
                            .text(v.Message)
                            .css({
                                "float": "left",
                                "clear": "both",
                                "word-wrap": "break-word",
                                "word-break": "break-all"
                            });
                        messageDivImage = $("<div>").addClass("message-content-chat-private-main").html(isImageURL && v.ImageChat ? `<img src="${v.ImageChat}" class="chat-image" style="border-radius:8px;boder:1px solid transparent;float: left; clear: both; word-wrap: break-word; word-break: break-all;width:200px;height:auto" />` : "");
                        var messageDetailsDiv = $("<div>").addClass("message-details").css("clear", "both");
                        var dateTimeDiv = $("<div>").addClass("text-muted small text-nowrap mt-2 date-time").css("float", "left").text(v.NotificationDateTime);
                    }
                    else {
                        var chatMessageRightDiv = $("<div>").addClass("chat-message-right pb-4");
                        imgDiv = $("<div>");
                        avatarImg = $("<img>").attr({
                            src: senderAvatar,
                            class: "rounded-circle mr-1",
                            alt: senderName,
                            width: "40",
                            height: "40"
                        });
                        imgDiv.append(avatarImg);
                        chatMessageRightDiv.append(imgDiv);

                        boxMessagesDiv = $("<div>").addClass("flex-shrink-1 box-messages email-matches rounded py-2 px-3 ml-3").css({
                            "max-width": "84%",
                            "background-color": "#E6E6E6",
                            "border": "1px solid transparent",
                            "border-radius": "0px 13px 13px 13px"
                        });
                        fontBoldDiv = $("<div>").addClass("font-weight-bold mb-1").css("color", "black").text(senderName);
                        messageDiv = $("<div>").text(v.Message);
                        messageDivImage = $("<div>").addClass("message-content-chat-private-main").html(isImageURL && v.ImageChat ? `<img src="${v.ImageChat}" class="chat-image" style="border-radius:8px;boder:1px solid transparent;float: left; clear: both; word-wrap: break-word; word-break: break-all;width:200px;height:auto" />` : "");

                        messageDetailsDiv = $("<div>").addClass("message-details");
                        dateTimeDiv = $("<div>").addClass("text-muted small text-nowrap mt-2 date-time").css("float", "right").text(v.NotificationDateTime);
                    }


                    messageDetailsDiv.append(dateTimeDiv);
                    boxMessagesDiv.append(fontBoldDiv, messageDiv, messageDivImage, messageDetailsDiv);
                    chatMessageRightDiv.append(boxMessagesDiv);

                    chatMessagesList.append(chatMessageRightDiv);

                });

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
    function isValidImageURL(url) {
        var pattern = /\.(jpg|jpeg|png|gif)$/i; // Kiểm tra đuôi file là jpg, jpeg hoặc png
        return pattern.test(url) && /^https?:\/\//.test(url); // Kiểm tra url bắt đầu bằng http hoặc https
    }

    connection.on("UpdateUsersOfflineList", function (userList) {
        var listGroupOnline = document.querySelector('.list-group-offline');
        listGroupOnline.innerHTML = "";
        var chatroomname = document.querySelector('.chat-name');
        var chatroomnamemini = document.querySelector('.chat-name-mini');

        userList.forEach(function (item) {
            var listGroupItem = document.createElement("a");
            listGroupItem.href = "#";
            listGroupItem.classList.add("list-group-item", "list-group-item-action", "border-0");

            var userCurrentChatElement = document.querySelector('.user-current-chat');
            var userCurrentChatMiniElement = document.querySelector('.user-current-chatmini');
            var avatarUserCurrentChat = document.querySelector('.avatar-user-current-chat');
            var dotChatContainer = document.querySelector('.dot-chat-container');
            var dotChatMiniContainer = document.querySelector('.dot-chatmini-container');

            listGroupItem.addEventListener("click", function (event) {
                chatroomname.textContent = "";
                chatroomnamemini.textContent = "";
                event.preventDefault();

                avatarUserCurrentChat.style.visibility = "visible";
                avatarUserCurrentChat.src = item.avatar ? item.avatar : "https://as2.ftcdn.net/v2/jpg/04/10/43/77/1000_F_410437733_hdq4Q3QOH9uwh0mcqAhRFzOKfrCR24Ta.jpg";
                connection.invoke("GetUserId").then(function (userId) {
                    console.log("Id người nhận:", item.id + "  ** Id người gửi: " + currentUserId);
                    LoadPrivateMessages(currentUserId, item.id);
                    $('.receiverUserId').val(item.id);
                    senderUserId = currentUserId;
                    receiverUserId = $('.receiverUserId').val();
                    console.log($('.receiverUserId').val()); // gui qua controller thong qua input hidden trong adminlayout
                    // Lấy tất cả các mục trong danh sách
                    var allItems = document.querySelectorAll('.list-group-item');

                    // Xóa lớp 'active' từ tất cả các mục
                    allItems.forEach(function (element) {
                        element.classList.remove('active');
                    });
                    listGroupItem.classList.add("active");
                    LoadPrivateMessagesMini(senderUserId, receiverUserId);
                    var userCurrentChatMiniElement = document.querySelector('.user-current-chat');
                    userCurrentChatMiniElement.innerHTML = item.firstName + " " + item.lastName;
                    chatroomnamemini.textContent = item.firstName + " " + item.lastName;
                    scrollToBottom();

                }).catch(function (error) {
                    console.error("Error getting userId:", error);
                });
                scrollToBottom();

            });



            var dFlexContainer = document.createElement("div");
            dFlexContainer.classList.add("current-user");

            var spanStatus = document.createElement("span");
            spanStatus.classList.add("status", "offline");

            var avatarImg = document.createElement("img");
            avatarImg.src = item.avatar ? item.avatar : "https://as2.ftcdn.net/v2/jpg/04/10/43/77/1000_F_410437733_hdq4Q3QOH9uwh0mcqAhRFzOKfrCR24Ta.jpg";
            avatarImg.classList.add("rounded-circle", "mr-1", "img-list-user");
            avatarImg.alt = item.firstName ? item.lastName : "hehe";
            avatarImg.width = "40";
            avatarImg.height = "40";
            //avatarImg.title = item.email;

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
            scrollToBottom();

        });
    });


    // Biến để lưu trữ userId
    var currentUserId;
    var currentUserName;
    // Đăng ký sự kiện ReceiveUserId
    connection.on("ReceiveUserId", function (userId, username) {
        console.log("Id người gửi:", userId);
        // Lưu trữ userId để sử dụng sau
        currentUserId = userId;
        currentUserName = username;
    });
    var saveCurrentUserName = "";
    var receiverUserItemId = "";
    var fullNameUserCurrentChat = "";
    connection.on("UpdateUsersOnlineList", function (userList) {
        var listGroupOnline = document.querySelector('.list-group-online');
        listGroupOnline.innerHTML = ""; // Xóa hết các thẻ a cũ trước khi cập nhật
        var userCurrentChatElement = document.querySelector('.user-current-chat');
        var userCurrentChatMiniElement = document.querySelector('.user-current-chatmini');
        var avatarUserCurrentChat = document.querySelector('.avatar-user-current-chat');
        var dotChatMiniContainer = document.querySelector('.dot-chatmini-container');
        var chatroomname = document.querySelector('.chat-name');
        var chatroomnamemini = document.querySelector('.chat-name-mini');
        userList.forEach(function (item) {
            var listGroupItem = document.createElement("a");
            listGroupItem.href = "#";
            listGroupItem.classList.add("list-group-item", "list-group-item-action", "border-0");
            listGroupItem.addEventListener("click", function (event) {
                chatroomname.textContent = "";
                chatroomnamemini.textContent = "";

                event.preventDefault();
                userCurrentChatElement.textContent = item.firstName + " " + item.lastName;
                avatarUserCurrentChat.style.visibility = "visible";

                avatarUserCurrentChat.src = item.avatar ? item.avatar : "https://as2.ftcdn.net/v2/jpg/04/10/43/77/1000_F_410437733_hdq4Q3QOH9uwh0mcqAhRFzOKfrCR24Ta.jpg";
                connection.invoke("GetUserId").then(function (userId) {
                    fullNameUserCurrentChat = item.firstName + " " + item.lastName;
                    console.log("Id người nhận:", item.id + "  ** Id người gửi: " + currentUserId);
                    saveCurrentUserName = currentUserName;
                    LoadPrivateMessages(currentUserId, item.id);
                    console.log("test" + $('.receiverUserId').val()); // gui qua controller thong qua input hidden trong adminlayout
                    receiverUserItemId = item.id;

                    $('.receiverUserId').val(item.id);
                    senderUserId = currentUserId;
                    receiverUserId = $('.receiverUserId').val();
                    var allItems = document.querySelectorAll('.list-group-item');

                    // Xóa lớp 'active' từ tất cả các mục
                    allItems.forEach(function (element) {
                        element.classList.remove('active');
                    });
                    listGroupItem.classList.add("active");
                    listGroupItem.classList.add("active");
                    LoadPrivateMessagesMini(senderUserId, receiverUserId);
                    chatroomnamemini.textContent = item.firstName + " " + item.lastName;
                    scrollToBottom();

                }).catch(function (error) {
                    console.error("Error getting userId:", error);
                });
                scrollToBottom();

            });

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
            //avatarImg.title = item.email;
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

            connection.invoke("GetUserId").then(function (userId) {
                var myUserName = item.firstName.trim() + " " + item.lastName.trim();
                usernameDiv.innerHTML = currentUserName;
                if (myUserName.trim() == currentUserName.trim()) {
                    usernameDiv.textContent = "tui nè";
                }
                else {
                    usernameDiv.innerHTML = myUserName.trim();
                }
                console.log(myUserName);
            });




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
        DisplayGeneralNotification(message, 'Thông báo!');
    });

    //connection.on("ReceivedPersonalNotification", function (message, username) {
    //    DisplayPersonalNotification(message, 'Hey ' + username);
    //});

    //connection.on("ReceivedGroupNotification", function (message, username) {
    //    DisplayGroupNotification(message, 'Team ' + username);
    //});
});