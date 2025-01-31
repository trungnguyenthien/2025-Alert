Để cài đặt CocoaPods trên máy Mac của bạn, hãy làm theo các bước sau:

## Bước 1: Cài đặt Homebrew (nếu chưa có)
Homebrew là một trình quản lý gói cho macOS. Mở Terminal và nhập lệnh sau để cài đặt Homebrew:
```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```


## Bước 2: Cài đặt CocoaPods
Bây giờ bạn có thể cài đặt CocoaPods bằng lệnh sau:
```bash
brew install cocoapods
```
Nếu bạn đang sử dụng máy Mac với chip M1, có thể cần phải cài đặt một số thư viện bổ sung:
```bash
arch -x86_64 gem install ffi
```