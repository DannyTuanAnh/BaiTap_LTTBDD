# Smart Tasks (Bài tập tuần 5)

Mô tả ngắn gọn

- Ứng dụng quản lý công việc nhỏ (task) viết bằng Flutter.
- Mục tiêu: refactor sang kiến trúc MVVM, hỗ trợ offline bằng SQLite
- Kết quả: hoàn thiện MVVM (Models / ViewModels / Views / Repositories), SQLite local-only (1 bảng `tasks`), validation form, navigation và hiển thị chi tiết task.

Kết quả đạt được

- Lưu/hiển thị/xóa/cập nhật task hoạt động hoàn toàn offline.
- Giao diện thêm task đơn giản: chỉ nhập Title và Description (bắt buộc Title).
- TaskList tải nhanh (phiên bản "light" giống bản đầy đủ do schema đơn giản).

Cấu trúc chính và mô tả hàm

- lib/database/database_helper.dart
  - insertTask(TaskModel task): insert một task vào bảng `tasks`.
  - getAllTasks({int? limit}): trả về List<TaskModel> sắp xếp theo `createdAt DESC`.
  - getAllTasksLight({int? limit}): wrapper gọi `getAllTasks` (lightweight).
  - getTaskById(int id): lấy một task theo id.
  - updateTask(TaskModel task): cập nhật title, description, status và updatedAt.
  - deleteTask(int id): xóa một task theo id.
  - deleteAllTasks(): xóa toàn bộ tasks (dùng để reset local DB khi test).

- lib/models/task_model.dart
  - TaskModel: model chính (id, title, description, status, createdAt, updatedAt).

- lib/repositories/task_repository.dart
  - getTasksFromLocal({int? limit}): lấy tasks từ local DB.
  - getTasksFromLocalLight({int? limit}): lấy tasks nhẹ cho list.
  - getTaskByIdFromLocal(int id): lấy chi tiết task từ local.
  - addTask(TaskModel task): thêm task vào local (trả về id).
  - updateTask(TaskModel task): cập nhật task trong local.
  - deleteTaskFromLocal(int id): xóa task trong local.
  - deleteAllTasks(): xóa toàn bộ dữ liệu local.

- lib/viewmodels/task_list_viewmodel.dart
  - loadTasks(): nạp tasks từ repository vào state.
  - addTask(TaskModel): gọi repository.addTask rồi cập nhật UI.
  - deleteTask(int id): xóa và refresh list.
  - toggleTaskStatus(TaskModel): chuyển trạng thái task (Pending <-> Done).

- lib/views/add_task_view.dart
  - Form đơn giản chỉ gồm `TextFormField` cho title và description.
  - Validation: title bắt buộc, show error nếu để trống.
  - Sau thêm thành công gọi callback để chuyển về tab Home.

- lib/screens/task_detail_screen.dart
  - Hiển thị title, description và status của task.

Hình ảnh đầu ra:

- Task list (danh sách task)

  [Task list](assets/images/screenshot_task_list.png)

- Add task (form thêm task)

  [Add task](assets/images/screenshot_add_task.png)

- Task detail (chi tiết task)

  [Task detail](assets/images/screenshot_task_detail.png)
