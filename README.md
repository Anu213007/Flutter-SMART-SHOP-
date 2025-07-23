# 🛒 Smart Shop – E-commerce App

A beautiful and minimal Flutter e-commerce app that lets users browse products, add items to cart or favourites, manage their profile, and toggle light/dark mode. Built with `Provider`, `SharedPreferences`, and `FakeStoreAPI`.

---

## 📱 Features

### 🔐 Authentication

* **Register & Login** using `TextFormField` with validation
* Session management via `SharedPreferences`
* `SplashScreen` automatically redirects based on login status

### 🏠 Home Screen

* Fetches products from [https://fakestoreapi.com](https://fakestoreapi.com)
* Displays **name, price, and star rating**
* **Favourite system** with toggle heart icon (saved in SharedPreferences)
* **Sorting** options (e.g., price, rating)
* **Pull-to-refresh** functionality

### ❤️ Favourite Screen

* View all saved favourite items
* Remove from favourites easily

### 🛒 Cart

* Add/remove products from cart
* Shows **total price** and **average rating**
* Cart badge displays item count using `Provider`

### 🎨 Theme Switcher

* Light/Dark mode toggle
* Theme state saved via `SharedPreferences`

### 📋 App Drawer

* Navigate between:

  * Home
  * Favourites
  * Cart
  * Profile (if applicable)
  * Logout (clears session)

---

## 📂 Folder Structure (lib/)

```
lib/
│
├── app_drawer.dart
├── auth_provider.dart
├── cart_provider.dart
├── cart.dart
├── favourites_screen.dart
├── home_screen.dart
├── login.dart
├── main.dart
├── pro.dart
├── product.dart
├── register.dart
├── splash_screen.dart
└── theme.dart
```

---

## 🚀 Getting Started

### 🔧 Prerequisites

* Flutter SDK (3.x.x)
* Android Studio / VS Code
* Internet connection (for API)

### ▶️ Run the App

```bash
flutter pub get
flutter run
```

> Use Chrome or Android/iOS emulator/device


---

## 🧰 Dependencies Used

```yaml
dependencies:
  flutter:
  provider:
  shared_preferences:
  http:
  cupertino_icons:
```

---

## 📌 Notes

* API: [https://fakestoreapi.com](https://fakestoreapi.com)
* No backend authentication (only local)
* All favourite/cart/theme data stored locally

