//! Clean Architecture sử dụng sự phân tách giữa các tầng dữ liệu (data), tầng miền (domain) 
//! và tầng trình diễn (presentation) để giúp mã nguồn dễ quản lý và bảo trì hơn.
//? Cấu trúc thư mục: Tạo các thư mục sau trong dự án của bạn:
/*
  lib/
  ├── domain/
  │   ├── entities/
  │   ├── repositories/
  │   └── usecases/
  ├── data/
  │   ├── models/
  │   ├── datasources/
  │   └── repositories/
  └── presentation/
      ├── pages/
      ├── widgets/
      └── bloc/
 */

//! Bước 1: Tạo Entities và Use Cases
//?   Entities: Trong lib/domain/entities/, tạo file movie.dart:
//?   Use Cases: Trong lib/domain/usecases/, tạo các use case để xử lý nghiệp vụ

//! Bước 2: Định nghĩa Model
//?   Bạn nên có một Model mở rộng từ Entity và thêm các chức năng cần thiết cho phân tích cú pháp JSON
//?   Định nghĩa Model (Data layer)

//! Bước 3: 
//?   - 3.1: Tạo Data Sources, sử dụng Model trong DataSource
//?   - 3.2: Repository Implementations

//! Bước 4: Tích hợp BLoC

//! Bước 5: Xây dựng UI và kết hợp BLoC