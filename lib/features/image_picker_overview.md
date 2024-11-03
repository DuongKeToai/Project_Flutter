# Cấu hình IOS

<b>Thêm quyền vào `Info.plist`</b>: 

Khi sử dụng `image_picker`, bạn cần phải thêm các quyền sau vào Info.plist để ứng dụng có thể truy cập vào thư viện ảnh, camera và microphone.
```xml
<dict>
    ...
    <key>NSCameraUsageDescription</key>
	<string>Used to demonstrate image picker plugin</string>

	<key>NSMicrophoneUsageDescription</key>
	<string>Used to capture audio for image picker plugin</string>

	<key>NSPhotoLibraryUsageDescription</key>
	<string>Used to demonstrate image picker plugin</string>
    ...
</dict>

```

# Cấu hình Android
Không cần cấu hình đặc biệt: Bắt đầu từ phiên bản `0.8.1`, `image_picker` đã hỗ trợ chọn nhiều ảnh trên `Android 4.3` trở lên và không cần cấu hình thêm nào trong `AndroidManifest.xml`.

Trước đây, bạn cần thêm thuộc tính `android:requestLegacyExternalStorage="true"` để đảm bảo tương thích với hệ thống lưu trữ của Android 10. Tuy nhiên, từ phiên bản này, image_picker đã hỗ trợ Scoped Storage, nên bạn không cần thêm cấu hình này nữa.