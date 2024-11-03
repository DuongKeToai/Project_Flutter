# Dio là gì?

## Dio là một thư viện HTTP cho Dart và Flutter
Dio được sử dụng rộng rãi để thực hiện các API request. Nó cung cấp nhiều tính năng nâng cao so với thư viện http mặc định của Dart như:
- Interceptor
- Global Configuration
- FormData
- Request Cancellation
- Retrying Requests
- File Downloading
- Timeout
- HTTPS certificate verification
- HTTP/2

## Các Khái Niệm Cơ Bản

### 1. Tạo một Instance của Dio
Để bắt đầu sử dụng Dio, bạn cần tạo một instance của nó. Instance này có thể được tùy chỉnh với các header, thời gian timeout, và các cài đặt khác.

### 2. Thực Hiện Các Yêu Cầu HTTP
Dio hỗ trợ các phương thức HTTP thông dụng như GET, POST, PUT, DELETE, v.v.

```dart
Dio dio = Dio();
Response response = await dio.get('https://api.example.com/items');
print(response.data.toString());
```

# Các Tính Năng Nâng Cao

## 1. Interceptors
Interceptor như một người gác cổng, chặn các request và response từ Client đến Server hoặc ngược lại. Mục đích là giúp custom thêm trước khi request được gửi đi hoặc response trả về.

### Quản lý session đăng nhập
Interceptor cực kỳ cần thiết trong việc quản lý session đăng nhập. Các API của Server sẽ xác thực Client thông qua accessToken. Mỗi khi đăng nhập thành công, server sẽ trả về 3 thông tin:
- access_token: Định danh user đăng nhập
- refresh_token: Dùng để lấy lại access_token mỗi khi bị hết hạn
- expired_time: Là thời gian mà một access_token có thể tồn tại, ví dụ là 3600 giây.

Vậy cứ mỗi 1 tiếng đồng hồ thì access_token sẽ bị expired và sau đó phải dùng refresh_token để có thể lấy lại được access_token.

### Cách tạo Interceptor

- Cách 1: Sử dụng InterceptorsWrapper
```dart
dio.interceptors.add(InterceptorsWrapper(
  onRequest: (options, handler) {
    // Thêm token
    options.headers["Authorization"] = "Bearer your_token";
    return handler.next(options); // tiếp tục thực thi yêu cầu
  },
  onResponse: (response, handler) {
    // Xử lý dữ liệu trả về
    return handler.next(response); // tiếp tục thực thi phản hồi
  },
  onError: (DioError e, handler) {
    // Xử lý lỗi
    return handler.next(e); // tiếp tục thực thi lỗi
  }
));
```
- Cách 2: Tạo 1 custom class extends Interceptor
```dart
import 'package:dio/dio.dart';

class TokenInterceptor extends Interceptor {
  Dio dio;
  String accessToken;
  String refreshToken;
  DateTime tokenExpiryTime;

  TokenInterceptor(this.dio, this.accessToken, this.refreshToken, this.tokenExpiryTime);

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) async {
    // Nếu nhận được lỗi 401 và token đã hết hạn, thử làm mới token
    if (err.response?.statusCode == 401 && DateTime.now().isAfter(tokenExpiryTime)) {
      try {
        var newTokens = await _refreshToken();
        accessToken = newTokens['access_token'];
        refreshToken = newTokens['refresh_token'];
        tokenExpiryTime = DateTime.now().add(Duration(seconds: newTokens['expires_in']));

        // Thử lại yêu cầu gốc với token mới
        err.requestOptions.headers['Authorization'] = "Bearer $accessToken";
        dio.fetch<dynamic>(err.requestOptions).then(
          (res) => handler.resolve(res),
          onError: (e) => handler.reject(e),
        );
      } catch (refreshError) {
        handler.reject(refreshError);
      }
    } else {
      handler.next(err);
    }
  }

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers["Authorization"] = "Bearer $accessToken";
    handler.next(options);
  }

  Future<Map<String, dynamic>> _refreshToken() async {
    // Thực hiện yêu cầu làm mới token
    Response response = await dio.post('/refresh', data: {
      'refresh_token': refreshToken,
    });
    return response.data;
  }
}

// Khởi tạo Dio với Interceptor
void main() {
  var dio = Dio();
  // Khởi tạo interceptor với giá trị token mặc định
  var tokenInterceptor = TokenInterceptor(dio, "initial_access_token", "initial_refresh_token", DateTime.now().add(Duration(hours: 1)));
  dio.interceptors.add(tokenInterceptor);

  // Sử dụng dio để gửi các yêu cầu mạng
}
```


## 2. Cấu Hình Global
Bạn có thể thiết lập các cấu hình global cho tất cả các yêu cầu sử dụng Dio, bao gồm timeout, base URL, headers, v.v.

````dart
dio.options.baseUrl = 'https://api.example.com';
dio.options.connectTimeout = 5000; // in milliseconds
dio.options.receiveTimeout = 3000;
````

## 3. FormData
Sử dụng FormData để gửi dữ liệu dạng form-data, thường được sử dụng cho việc tải lên tệp.

````dart
FormData formData = FormData.fromMap({
    "name": "wendux",
    "age": 25,
    "file": await MultipartFile.fromFile('./text.txt', filename: 'upload.txt')
});
response = await dio.post('/info', data: formData);
````

## 4. Handling Errors
Dio cung cấp một cách để bắt và xử lý các lỗi một cách trực quan, cho phép bạn phân biệt giữa các loại lỗi khác nhau như lỗi timeout, lỗi cancel, hoặc các lỗi HTTP.
````dart
try {
    Response response = await dio.get('https://api.example.com/data');
} on DioError catch (e) {
    if (e.type == DioErrorType.connectTimeout) {
        // Xử lý lỗi timeout
    } else if (e.type == DioErrorType.response) {
        // Lỗi do phản hồi không đúng (ví dụ: 404, 500)
    }
}
````