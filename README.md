# Flutter App กับ mitmproxy 

## ทำไม?

เพื่อช่วยให้ทีม QA หรือทีม Perf สามารถ record request/response ของ app flutter ได้ ทำให้สามารถเตรียม script สำหรับทำ automate test (ทีม QA) หรือ script สำหรับทำ perfomance testing (ทีม Perf) ได้สะดวกและรวดเร็ว

## วิธีการ

1. install [mitmproxy](https://www.mitmproxy.org/) ก่อน (install ผ่าน brew ได้)
```bash
brew install mitmproxy
```
2. ตรวจสอบว่าติดตั้ง mitmproxy ได้ถูกต้องด้วยคำสั่ง
```bash
mitmproxy --version
```
หน้าจอจะขึ้นรายละเอียดของ mitmproxy ประมาณนี้
```bash
Mitmproxy: 11.1.3 binary
Python:    3.13.1
OpenSSL:   OpenSSL 3.4.1 11 Feb 2025
Platform:  macOS-15.6.1-arm64-arm-64bit-Mach-O
```
3. เปิด mitmweb ใช้คำสั่ง
```bash
mitmweb
```
![mitmweb_screen](/assets/mitmweb_screen.png)
4. เพิ่ม code สำหรับทำ proxy ให้กับ mitmproxy
```dart
_dio?.httpClientAdapter = IOHttpClientAdapter(
    createHttpClient: () {
        HttpClient client = HttpClient();
        client.badCertificateCallback = (cert, host, port) => true;
        // AppConfig.proxyUrl = 10.0.2.2 on android and 127.0.0.1 on ios
        // AppConfig.proxyPort = 8080 (default mitm port)
        client.findProxy = (uri) => 'PROXY ${AppConfig.proxyUrl}:${AppConfig.proxyPort}';
        return client;
    },
);
```
5. Setup proxy บน emulator ตามรูป
![emulator_setup](/assets/emulator_setup.png)
6. ลอง run app จะเห็น request & response วิ่งผ่าน mitmweb

> บางครั้งอาจพบว่ามี error certificate not install ให้ทำตาม document ของ [mitm certificate](https://docs.mitmproxy.org/stable/concepts/certificates/) ในการ install certificate 