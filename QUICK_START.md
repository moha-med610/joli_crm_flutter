# Quick Start Guide - Update Customer Screen

## 🚀 One-Minute Setup

### 1. Import the Screen
```dart
import 'package:joli_crm/features/customers/presentation/screens/update_customer_screen.dart';
import 'package:joli_crm/core/utils/navigator_helper.dart';
```

### 2. Add Navigation Button
```dart
// In your customer details screen or list
IconButton(
  icon: const Icon(Icons.edit),
  onPressed: () {
    context.push(UpdateCustomerScreen(customerId: customerId));
  },
)
```

### 3. Done! ✅

## 📊 What Happens

```
Click Edit → Load Customer Data → Show Pre-filled Form
    ↓
User Edits → Click Update → Validate → Submit
    ↓
API Updates → Success Message → Screen Closes
    ↓
Old Data Preserved for Unchanged Fields
```

## 📁 Files at a Glance

| File | What It Does |
|------|-----------|
| `update_customer_screen.dart` | Main update screen |
| `update_customer_model.dart` | Data model |
| `update_helper.dart` | Change tracking utilities |

## 🎯 Form Fields

All fields are pre-filled with existing data:
- ✅ Name (required)
- ✅ Phone (required)
- ✅ Address (required)
- ✅ City (required)
- ✅ WhatsApp (optional)
- ✅ Notes (optional)

User edits only what they need, rest stays the same!

## 💡 Code Examples

### Example 1: Add Edit Button to Customer Details
```dart
AppBarWidget(
  title: "customer_details".tr(),
  actions: [
    IconButton(
      icon: const Icon(Icons.edit),
      onPressed: () => context.push(
        UpdateCustomerScreen(customerId: customerId),
      ),
    ),
  ],
)
```

### Example 2: Long Press to Edit
```dart
GestureDetector(
  onLongPress: () => context.push(
    UpdateCustomerScreen(customerId: customer.id),
  ),
  child: CustomerTile(customer),
)
```

### Example 3: Floating Action Button
```dart
FloatingActionButton(
  onPressed: () => context.push(
    UpdateCustomerScreen(customerId: customerId),
  ),
  child: Icon(Icons.edit),
)
```

## ✅ That's It!

The update screen handles everything:
- Loads customer data
- Shows form with current values
- Validates input
- Updates through existing Cubit
- Shows success/error messages
- Closes on success

Just use: `context.push(UpdateCustomerScreen(customerId: id))`

## 🎨 The Update Flow

1️⃣ User taps Edit button
2️⃣ Customer data loads (showing spinner)
3️⃣ Form appears with all current values pre-filled
4️⃣ User changes only the fields they need
5️⃣ User taps "Update"
6️⃣ Form validates
7️⃣ Request sent to API
8️⃣ Success message shows
9️⃣ Screen closes automatically
🔟 Unchanged data stays the same!

## 📚 Documentation

- 📖 Full guide: `lib/features/customers/UPDATE_SCREEN_GUIDE.md`
- 📋 Full checklist: `IMPLEMENTATION_CHECKLIST.md`
- 📊 Summary: `UPDATE_FEATURE_SUMMARY.md`
- 💻 Example: `customer_details_screen_example_with_edit.dart`

## 🔧 Need to Customize?

### Add More Fields?
Edit `customer_sheet.dart` to add new TextFormFields

### Change Validations?
Modify validators in `app_validator.dart`

### Custom Success Action?
Modify the listener in `update_customer_screen.dart`

### Only Send Changed Fields?
Use `UpdateCustomerModel.fromChanges()` factory method

## ✨ Features Included

✅ Pre-filled forms with existing data
✅ Form validation (required fields)
✅ Loading states with spinners
✅ Success/error messages
✅ Easy integration
✅ Preserves unchanged data
✅ Automatic screen close on success
✅ Full error handling
✅ Translated UI (easy_localization)

## 🚀 Start Using It Now!

```dart
context.push(UpdateCustomerScreen(customerId: "customer-123"))
```

That's all you need!
