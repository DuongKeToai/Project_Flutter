Trong Flutter, package `Equatable` được sử dụng trong việc kết hợp với `Bloc` nhằm đơn giản hóa và tối ưu hóa việc so sánh các đối tượng khi làm việc với trạng thái trong ứng dụng.

Điều này giúp cải thiện hiệu suất và đảm bảo rằng chỉ những trạng thái thực sự thay đổi mới được cập nhật và trigger các hành động như rebuild giao diện.

# Tại sao cần Equatable?
Trong một ứng dụng sử dụng `Bloc`, mỗi khi bạn phát hành (emit) một trạng thái mới (state), `Bloc` cần biết liệu trạng thái đó có thực sự khác với trạng thái trước hay không.

Mặc định, Dart so sánh hai đối tượng bằng cách kiểm tra địa chỉ bộ nhớ của chúng (sử dụng `==`).

Điều này có nghĩa là ngay cả khi hai đối tượng có cùng dữ liệu, nhưng là các đối tượng khác nhau, Dart sẽ coi chúng là khác nhau.

Điều này có thể dẫn đến việc rebuild không cần thiết trong giao diện nếu trạng thái mới không thực sự khác với trạng thái cũ về mặt dữ liệu, mà chỉ là một đối tượng mới được tạo ra.

Để khắc phục điều này, `Equatable` giúp so sánh các đối tượng dựa trên giá trị của chúng thay vì địa chỉ bộ nhớ. Nó cho phép bạn xác định chính xác các thuộc tính nào cần được so sánh khi hai đối tượng trạng thái được so sánh với nhau.

# Cách `Equatable` hoạt động

`Equatable` là một lớp cho phép bạn dễ dàng xác định các thuộc tính cần thiết để so sánh giữa các đối tượng. Thông thường, bạn sẽ sử dụng `Equatable` để tạo các `state` và `event` trong Bloc.

Khi kế thừa từ `Equatable`, bạn chỉ cần định nghĩa danh sách các thuộc tính (`props`) mà bạn muốn dùng để so sánh giữa các đối tượng.

### Ví dụ
Giả sử bạn có một AccountInfoState trong một ứng dụng quản lý thông tin tài khoản:
Không sử dụng `Equatable`

```dart
class AccountInfoState {
  final String fullName;
  final String email;

  AccountInfoState({
    required this.fullName,
    required this.email,
  });
}
```

Trong ví dụ này, nếu bạn tạo hai đối tượng `AccountInfoState` với cùng giá trị:
```dart
final state1 = AccountInfoState(fullName: 'John Doe', email: 'john@example.com');
final state2 = AccountInfoState(fullName: 'John Doe', email: 'john@example.com');

print(state1 == state2); // Kết quả là false
```

Mặc dù `state1` và `state2` có cùng giá trị, Dart sẽ coi chúng là hai đối tượng khác nhau vì chúng nằm ở các vị trí bộ nhớ khác nhau. Điều này có thể dẫn đến các sự kiện `rebuild` không cần thiết trong ứng dụng của bạn.

Sử dụng `Equatable`

Khi bạn sử dụng Equatable, bạn có thể định nghĩa các thuộc tính cần so sánh giữa các đối tượng để xem chúng có thực sự khác nhau không:

```dart
import 'package:equatable/equatable.dart';

class AccountInfoState extends Equatable {
  final String fullName;
  final String email;

  AccountInfoState({
    required this.fullName,
    required this.email,
  });

  @override
  List<Object?> get props => [fullName, email];
}
```

Bây giờ, khi bạn so sánh hai đối tượng `AccountInfoState`:
```dart
final state1 = AccountInfoState(fullName: 'John Doe', email: 'john@example.com');
final state2 = AccountInfoState(fullName: 'John Doe', email: 'john@example.com');

print(state1 == state2); // Kết quả là true
```

Với Equatable, hai đối tượng có cùng giá trị sẽ được coi là bằng nhau (`true`), vì chúng có cùng giá trị trong thuộc tính `fullName` và `email`.

## Lợi ích của Equatable trong Bloc

`Cải thiện hiệu suất`: Khi trạng thái mới được phát hành trong `Bloc`, `Equatable` sẽ đảm bảo rằng trạng thái chỉ thay đổi khi dữ liệu thực sự thay đổi, tránh việc cập nhật không cần thiết trong UI.

`Giảm mã lặp`: Không cần phải tự viết phương thức `==` và `hashCode` theo cách thủ công. `Equatable` tự động xử lý điều này dựa trên các thuộc tính trong props.

`Dễ bảo trì`: Sử dụng `Equatable` giúp mã dễ đọc hơn và bảo trì tốt hơn, đặc biệt khi làm việc với nhiều trạng thái khác nhau trong ứng dụng `Bloc`.