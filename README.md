# Flutter GetX Template

A template project for Flutter applications using the GetX architecture.

## 🚀 Introduction

This is a standard boilerplate for Flutter projects using **GetX** for State Management, Dependency Injection, and Route Management. The project comes pre-integrated with essential tools such as API handling (Dio), local storage (Secure Storage), internationalization (Multi-language support), and professional logging (Talker).

## 🛠 Technologies Used

- **Framework:** Flutter 3.38.1
- **State Management:** [GetX](https://pub.dev/packages/get)
- **Networking:** [Dio](https://pub.dev/packages/dio) with Repository pattern.
- **Logging:** [Talker Flutter](https://pub.dev/packages/talker_flutter) for professional log and error management.
- **Storage:** [Flutter Secure Storage](https://pub.dev/packages/flutter_secure_storage) for sensitive data.
- **Localization:** Built-in multi-language support (Vietnamese & English).
- **UI Components:** Svg, Staggered Animations, Skeleton UI.

## 📂 Folder Structure

```text
lib/
├── core/              # Constants, themes, network configurations, and utilities
├── data/              # Data management: models, providers, repositories
├── lang/              # Localization configuration (vi, en)
├── modules/           # Feature-based modules (view, controller, binding)
├── routes/            # Application routing management
├── widget/            # Shared custom widgets
└── main.dart          # Entry point of the application
```

## ✨ Main Features

- [x] **Clear Module Structure:** Separation of Logic (Controller) and UI (View).
- [x] **Network Handling:** Pre-configured Dio with Interceptors for token handling and logging.
- [x] **Localization:** Easy language switching via `TranslationService`.
- [x] **Custom Widgets:** Reusable UI components like `TextFieldWidget`, `LoadingDialog`, etc.
- [x] **Error Management:** Integrated Talker for tracking logs and crash reports directly within the app.

## ⚙️ Installation and Setup

1. **Clone the repository:**
   ```bash
   git clone https://github.com/your-repo/flutter_getx_template.git
   ```

2. **Install dependencies:**
   ```bash
   flutter pub get
   ```

3. **Run the application:**
   ```bash
   flutter run
   ```

4. **Generate Icons/Splash Screen (if needed):**
   ```bash
   flutter pub run flutter_launcher_icons:main
   flutter pub run flutter_native_splash:create
   ```

## 📝 Notes

- The project uses SDK version `^3.10.0`.
- Ensure you have the compatible Flutter version installed to avoid library conflicts.

---
Contributed by [Pham Minh Dat]
