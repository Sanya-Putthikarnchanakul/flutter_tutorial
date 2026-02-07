# พัฒนา Flutter app ด้วย MVVM pattern

พัฒนา Flutter app ด้วยรูปแบบ [MVVM](https://docs.flutter.dev/app-architecture/case-study) pattern ซึ่งเป็นหนึ่งในวิธีการวาง app achitecture ที่นิยมใช้ในปัจจุบัน (document ของ Flutter ก็แนะนำให้ใช้รูปแบบนี้)

## Libs ที่จะใช้ในการพัฒนา
- การจัดการ state: [flutter_riverpod](https://riverpod.dev/docs/introduction/getting_started)
- การเรียกไปที่ระบบหลังบ้าน: [dio](https://pub.dev/packages/dio)
- การทำ navigation: [go_router](https://pub.dev/packages/go_router)
- การเก็บข้อมูลที่เครื่องของผู้ใช้งาน
  - ข้อมูลที่ต้องการความปลอดภัยสูง: [flutter_secure_storage](https://pub.dev/packages/flutter_secure_storage)
  - ข้อมูลทั่วไปในรูปแบบ relational database: [sqflite](https://pub.dev/packages/sqflite)

## Features
- ใช้ระบบหลังบ้านของ [Dummy Json](https://dummyjson.com/docs) ในการพัฒนา
- ครั้งแรกที่เข้าใช้งาน app ผู้ใช้ต้องกรอก username และ password ก่อนเพื่อทำการ login ก่อน
- เมื่อทำการ login สำเร็จระบบจะเก็บข้อมูลที่จำเป็นใน secure storage เช่น access token, refresh token etc.
- สามารถ setup pin ได้ เพื่อที่ครั้งหน้าจะได้ไม่ต้องกรอก username และ password อีก (สามารถข้ามขั้นตอนนี้ได้ แต่จะต้องกรอก username และ password เพื่อเข้าใช้งานใหม่)
- หากมีการ setup pin ไว้ ครั้งหน้าจะเข้าใช้งานด้วย pin ได้ (ตรวจสอบ token เก่าก่อนหากยังไม่หมดอายุสามารถเข้าใช้งานได้เลย)
- Home page จะแสดง list ของ todos โดยทำการ load จาก api มาลงใน sql storage (ทำเป็น background sync).
- หากมี todos ใน sql storage แล้วไม่ต้องเรียก api อีก
- มี floating button สำหรับพาไปหน้าเพิ่ม todo ใหม่
- เรียก api post todos ถ้า success save ลง local db
- แก้ todo โดยการกดเข้าไปดู (อาจเป็นหน้าเดียวกับเพิ่ม todo)
- ลบ todo โดยการ swipe
- พัฒนาด้วยหลักการ TDD โดยต้องทำ
  - [unit test](https://docs.flutter.dev/cookbook/testing/unit/introduction)
  - [widget test](https://docs.flutter.dev/cookbook/testing/widget/introduction)
  - [integration test](https://docs.flutter.dev/cookbook/testing/integration/introduction)