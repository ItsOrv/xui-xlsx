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

Install dependencies:
```bash
python3 -m venv .venv
source .venv/bin/activate
pip install -r requirements.txt
```

### Quick start
```bash
python3 export_xui_users_to_excel.py
```

This creates:
- `xui_users_export.csv`
- `xui_users_export.xlsx` (if `openpyxl` is installed)

One-command bootstrap:
```bash
bash <(curl -s https://raw.githubusercontent.com/ItsOrv/xui-xlsx/main/bootstrap.sh)
```

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

# Keep inbound grouping and sort users by email
python3 export_xui_users_to_excel.py --sort-by inbound
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

نصب وابستگی‌ها:
```bash
python3 -m venv .venv
source .venv/bin/activate
pip install -r requirements.txt
```

### اجرای سریع
```bash
python3 export_xui_users_to_excel.py
```

خروجی‌ها:
- `xui_users_export.csv`
- `xui_users_export.xlsx` (در صورت نصب بودن `openpyxl`)

اجرای خودکار با یک دستور:
```bash
bash <(curl -s https://raw.githubusercontent.com/ItsOrv/xui-xlsx/main/bootstrap.sh)
```

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

# حفظ گروه‌بندی اینباند و مرتب‌سازی بر اساس ایمیل
python3 export_xui_users_to_excel.py --sort-by inbound
```
