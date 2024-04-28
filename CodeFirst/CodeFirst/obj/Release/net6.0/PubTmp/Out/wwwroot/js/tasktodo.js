//document.addEventListener('click', function (event) {
//    if (event.target.classList.contains('add-task-button')) {
//        // Hỏi người dùng để nhập tên nhiệm vụ
//        const taskName = prompt('Enter task name:');
//        if (!taskName) {
//            // Nếu người dùng không nhập tên nhiệm vụ, thoát khỏi hàm
//            return;
//        }

//        // Tạo một phần tử div mới để chứa thông tin về nhiệm vụ
//        const newTask = document.createElement('div');
//        newTask.classList.add('task');
//        newTask.setAttribute('draggable', 'true');

//        // HTML của nhiệm vụ mới, sử dụng tên nhiệm vụ đã nhập
//        newTask.innerHTML = `
//            <div class='task__tags'>
//                <span class='task__tag task__tag--copyright'>${taskName}</span>
//                <button class='task__options'>
//                    <i class="fas fa-ellipsis-h"></i>
//                </button>
//            </div>
//            <p>New Task Description</p>
//            <div class='task__stats'>
//                <span>
//                    <time datetime="${new Date().toISOString()}">
//                        <i class="fas fa-flag"></i> ${new Date().toLocaleDateString()}
//                    </time>
//                </span>
//                <span><i class="fas fa-comment"></i>0</span>
//                <span><i class="fas fa-paperclip"></i>0</span>
//                <span class='task__owner'></span>
//            </div>
//        `;

//        // Thêm nhiệm vụ mới vào cột dự án
//        // Tìm cột dự án gần nhất với nút "Add Task" được nhấp
//        const projectColumn = event.target.closest('.container-flex-col').querySelector('.project-column');
//        projectColumn.appendChild(newTask);
//    }
//});


