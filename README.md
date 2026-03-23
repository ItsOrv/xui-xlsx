# x-ui Users Export

Simple utility to export x-ui users from SQLite backups into CSV and Excel files.

## English

### What it does
- Reads one or more x-ui backup `.db` files.
- Exports users with these columns:
  - `Source`
  - `Inbound`
  - `Email`
  - `UUID`
  - `Used (GB)`
  - `Remaining (GB)`
  - `Total limit (GB)`
- Groups users by inbound so each inbound's users are listed together.

### Requirements
- Python 3.10+
- Optional for Excel export: `openpyxl`

### Quick start
```bash
python3 export_xui_users_to_excel.py
```

This creates:
- `xui_users_export.csv`
- `xui_users_export.xlsx` (if `openpyxl` is installed)

### Common examples
```bash
# Use specific databases
python3 export_xui_users_to_excel.py --db x-ui.db --db "x-ui-2 2.db"

# Filter users by email text
python3 export_xui_users_to_excel.py --email-contains test

# Keep only unlimited users
python3 export_xui_users_to_excel.py --only-unlimited

# Sort inside each inbound group
python3 export_xui_users_to_excel.py --sort-by used --asc
```

---

## فارسی

### این ابزار چه کاری انجام می‌دهد
- یک یا چند فایل بکاپ `.db` مربوط به x-ui را می‌خواند.
- کاربران را با ستون‌های زیر اکسپورت می‌کند:
  - `Source`
  - `Inbound`
  - `Email`
  - `UUID`
  - `Used (GB)`
  - `Remaining (GB)`
  - `Total limit (GB)`
- کاربران هر اینباند را کنار هم (گروه‌بندی‌شده) نمایش می‌دهد.

### پیش‌نیازها
- Python 3.10 یا بالاتر
- برای خروجی Excel (اختیاری): `openpyxl`

### اجرای سریع
```bash
python3 export_xui_users_to_excel.py
```

خروجی‌ها:
- `xui_users_export.csv`
- `xui_users_export.xlsx` (در صورت نصب بودن `openpyxl`)

### مثال‌های پرکاربرد
```bash
# خواندن دیتابیس‌های مشخص
python3 export_xui_users_to_excel.py --db x-ui.db --db "x-ui-2 2.db"

# فیلتر بر اساس بخشی از ایمیل
python3 export_xui_users_to_excel.py --email-contains test

# فقط کاربران نامحدود
python3 export_xui_users_to_excel.py --only-unlimited

# مرتب‌سازی داخل هر گروه اینباند
python3 export_xui_users_to_excel.py --sort-by used --asc
```
