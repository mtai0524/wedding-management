
//$(() => {

//    var connection = new signalR.HubConnectionBuilder().withUrl("/chatHub").build();
//    connection.start().then(function () {
//        console.log('connected to hub');
//    }).catch(function (err) {
//        return console.error(err.toString());
//    });



   



//    connection.on("UpdateUsersOfflineList", function (userList) {
//        var listGroupOnline = document.querySelector('.list-group-offline');
//        listGroupOnline.innerHTML = ""; // Xóa hết các thẻ a cũ trước khi cập nhật
//        userList.forEach(function (item) {
//            var listGroupItem = document.createElement("a");
//            listGroupItem.href = "#";
//            listGroupItem.classList.add("list-group-item", "list-group-item-action", "border-0");

//            var dFlexContainer = document.createElement("div");
//            dFlexContainer.classList.add("current-user");

//            var spanStatus = document.createElement("span");
//            spanStatus.classList.add("status", "offline");

//            var avatarImg = document.createElement("img");
//            avatarImg.src = item.avatar ? item.avatar : "https://as2.ftcdn.net/v2/jpg/04/10/43/77/1000_F_410437733_hdq4Q3QOH9uwh0mcqAhRFzOKfrCR24Ta.jpg";
//            avatarImg.classList.add("rounded-circle", "mr-1", "img-list-user");
//            avatarImg.alt = item.username ? item.username : "hehe";

//            avatarImg.width = "40";
//            avatarImg.height = "40";
//            avatarImg.title = item.email;

//            avatarImg.appendChild(spanStatus);

//            var flexGrowContainer = document.createElement("div");
//            flexGrowContainer.classList.add("flex-grow-1", "ml-3");

//            var usernameDiv = document.createElement("div");
//            usernameDiv.classList.add("username");
//            usernameDiv.textContent = item.firstName + " " + item.lastName;

//            var textStatusDiv = document.createElement("div");
//            textStatusDiv.classList.add("text-status");

//            var onlineStatusSpan = document.createElement("span");
//            onlineStatusSpan.classList.add("small", "online-status", "chat-offline");
//            onlineStatusSpan.textContent = 'Offline';

//            textStatusDiv.appendChild(onlineStatusSpan);

//            flexGrowContainer.appendChild(usernameDiv);
//            flexGrowContainer.appendChild(textStatusDiv);
//            flexGrowContainer.appendChild(spanStatus);

//            dFlexContainer.appendChild(avatarImg);
//            dFlexContainer.appendChild(flexGrowContainer);

//            listGroupItem.appendChild(dFlexContainer);
//            listGroupOnline.appendChild(listGroupItem);
//        });
//    });


//    connection.on("UpdateUsersOnlineList", function (userList) {
//        var listGroupOnline = document.querySelector('.list-group-online');
//        listGroupOnline.innerHTML = ""; // Xóa hết các thẻ a cũ trước khi cập nhật

//        userList.forEach(function (item) {
//            var listGroupItem = document.createElement("a");
//            listGroupItem.href = "#";
//            listGroupItem.classList.add("list-group-item", "list-group-item-action", "border-0");

//            var spanStatus = document.createElement("span");
//            spanStatus.classList.add("status", "online");

//            var dFlexContainer = document.createElement("div");
//            dFlexContainer.classList.add("current-user");

//            var avatarImg = document.createElement("img");
//            avatarImg.src = item.avatar ? item.avatar : "https://as2.ftcdn.net/v2/jpg/04/10/43/77/1000_F_410437733_hdq4Q3QOH9uwh0mcqAhRFzOKfrCR24Ta.jpg";
//            avatarImg.classList.add("rounded-circle", "mr-1", "img-list-user");
//            avatarImg.alt = item.username ? item.username : "hehe";
//            avatarImg.width = "40";
//            avatarImg.height = "40";
//            avatarImg.title = item.email;

//            var flexGrowContainer = document.createElement("div");
//            flexGrowContainer.classList.add("flex-grow-1", "ml-3");

//            var usernameDiv = document.createElement("div");
//            usernameDiv.classList.add("username");
//            usernameDiv.textContent = item.firstName + " " + item.lastName;

//            var textStatusDiv = document.createElement("div");
//            textStatusDiv.classList.add("text-status");

//            var onlineStatusSpan = document.createElement("span");
//            onlineStatusSpan.classList.add("small", "online-status", "chat-online");
//            onlineStatusSpan.textContent = 'Online';

//            textStatusDiv.appendChild(onlineStatusSpan);

//            flexGrowContainer.appendChild(usernameDiv);
//            flexGrowContainer.appendChild(textStatusDiv);
//            flexGrowContainer.appendChild(spanStatus);

//            dFlexContainer.appendChild(avatarImg);
//            dFlexContainer.appendChild(flexGrowContainer);

//            listGroupItem.appendChild(dFlexContainer);
//            listGroupOnline.appendChild(listGroupItem);
//        });
//    });


//    //noti
//    connection.on("UpdateUsersList", function (userList) {
//        var avatarList = document.querySelector('.avatar-list');
//        avatarList.innerHTML = ""; // Xóa hết các thẻ img cũ trước khi cập nhật
//        console.log("this is userList", userList);
//        userList.forEach(function (user) {
//            if (user.avatar) {
//                var avatarImg = document.createElement("img");
//                avatarImg.src = user.avatar;
//                avatarImg.alt = user.email + "'s Avatar";
//                avatarImg.classList.add("avatar");
//                avatarImg.title = user.email; // Hiển thị email khi hover vào ảnh

//                avatarList.appendChild(avatarImg);
//            }
//        });
//    });

//});