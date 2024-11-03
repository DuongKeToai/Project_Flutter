//!  Data Layer (Tầng Dữ liệu)
//?  Giống như: Hệ thống cơ sở hạ tầng của ngôi nhà, bao gồm điện, nước, và các ống dẫn.
//?   - Models (Mô hình)
//      Là phiên bản cụ thể của Entities được sử dụng để giao tiếp với cơ sở dữ liệu 
//      hoặc các dịch vụ bên ngoài.
//      Chúng thường chứa logic cho việc chuyển đổi dữ liệu nhận được từ bên ngoài (như JSON) 
//      thành dạng mà ứng dụng có thể sử dụng.

//?   - Data Sources (Nguồn dữ liệu)
//      Có hai loại nguồn dữ liệu: remote (APIs) và local (cơ sở dữ liệu trên máy). 
//      Chúng chịu trách nhiệm trực tiếp cho việc đọc và ghi dữ liệu từ và đến local hoặc remote.

//?   - Repositories (Kho dữ liệu)
//      Thực thi các interfaces được khai báo ở tầng domain.
//      Repositories sử dụng data sources để cung cấp dữ liệu cho ứng dụng 
//      và là nơi duy nhất biết cách dữ liệu được truy xuất và lưu trữ như thế nào.