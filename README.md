# Zeni-app-
Ứng dụng bán hàng thông minh – Tăng tốc doanh số, tối ưu vận hành.

## Mục tiêu
Ứng dụng Flutter quản lý cân xe, lệnh giao hàng và trợ lý AI cho vận hành xi măng Tiên Sơn.

## Thư mục chính
- `zeni_app/`: project Flutter chính
- `flutter/`: Flutter SDK được giữ dưới dạng submodule/SDK nội bộ

## Chạy thử nhanh
```bash
cd zeni_app
../flutter/bin/flutter pub get
../flutter/bin/flutter run -d linux
```

> Nếu muốn chạy trên Android, cài đặt Android SDK và thiết bị/emulator rồi dùng `../flutter/bin/flutter run`.

## Build Android AAB / APK
```bash
cd zeni_app
../flutter/bin/flutter pub get
../flutter/bin/flutter build appbundle
../flutter/bin/flutter build apk --release
```

### Ký app release
- Tạo file `zeni_app/key.properties` từ `zeni_app/key.properties.example`
- Thêm file keystore `*.jks` và cấu hình đường dẫn trong `key.properties`
- Xây dựng:
```bash
../flutter/bin/flutter build appbundle --release
../flutter/bin/flutter build apk --release
```

## GitHub Actions (CI) – build release

I added GitHub Actions workflows to build the release artifacts automatically.

- Android workflow: `.github/workflows/android-release.yml`
	- Trigger: manual (`workflow_dispatch`) or push tag like `v1.0.0`.
	- Secrets required for signing (optional):
		- `KEYSTORE_BASE64` — base64 encoded keystore `.jks`
		- `KEYSTORE_PASSWORD`
		- `KEY_ALIAS`
		- `KEY_PASSWORD`
	- The workflow writes `android/keystore.jks` and `android/key.properties`, then builds both an AAB and an APK, and uploads them as artifacts.

- iOS workflow (skeleton): `.github/workflows/ios-release.yml`
	- macOS runner required; you must provide Apple credentials and provisioning (see workflow comments).

- Android GitHub Release workflow: `.github/workflows/android-release-github.yml`
	- Trigger: manual (`workflow_dispatch`) or push tag like `v1.0.0`.
	- Creates a GitHub Release and attaches both AAB and APK.

To run Android CI manually:

```bash
# Push a tag to trigger or run workflow from Actions tab
git tag v1.0.0
git push origin v1.0.0
```


## Firebase chính thức
1. Tạo project Firebase
2. Cài `flutterfire_cli` nếu chưa có:
```bash
dart pub global activate flutterfire_cli
```
3. Chạy:
```bash
cd zeni_app
flutterfire configure
```
4. Thêm `firebase_options.dart` được tạo tự động
5. Cập nhật `android/app/google-services.json` và `ios/Runner/GoogleService-Info.plist` nếu cần

## iOS / App Store
- Cần macOS + Xcode + Apple Developer
- Mở `zeni_app/ios/Runner.xcworkspace`
- Đặt `PRODUCT_BUNDLE_IDENTIFIER` trong Xcode
- Chạy build:
```bash
flutter build ipa
```
- Submit qua App Store Connect

## Ghi chú
- Hiện tại app đã có UI cơ bản, màn `Login`, `Dashboard`, `Orders`, `Create Order`, `AI Assistant`.
- Firebase đang chạy chế độ stub/cấu hình dự phòng. Sau khi cấu hình Firebase chính thức, app sẽ hỗ trợ auth và dữ liệu thật.
