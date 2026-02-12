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
