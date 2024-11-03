//! Domain Layer (Tầng Miền)
//? Đây là nơi chứa các quy tắc kinh doanh và logic chính
//?   - Entities (Thực thể)
//      Đây là các đối tượng đại diện cho dữ liệu cốt lõi và các quy tắc của ứng dụng. 
//      Chẳng hạn, nếu bạn có ứng dụng quản lý nhân viên, 
//      một "Employee" sẽ là một thực thể với các thuộc tính như tên, ID, vị trí công việc.

//?   - Use Cases (Trường hợp sử dụng)
//      Đây là các tác vụ cụ thể mà ứng dụng của bạn cần thực hiện, 
//      được xác định bởi các quy tắc nghiệp vụ.
//      Ví dụ, "Add Employee", "Find Employee by ID" là các use case 
//      trong ứng dụng quản lý nhân viên.

//?   - Repositories Interfaces 
//      Đây là các khai báo interface mà tầng data sẽ thực hiện
//      Các use case sẽ giao tiếp với tầng data qua các interfaces này, 
//      không quan tâm đến chi tiết cài đặt.