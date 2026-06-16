

<div align="center">
  <h1>🎨 Painting by Numbers</h1>
  <p>
    <strong>A high-performance, cross-platform Flutter application powered by Rust for real-time image processing.</strong>
  </p>
</div>















## 🎥 App Preview
<!-- TODO: Add your preview video link or GIF here -->
<div align="center">
  <video src="https://github.com/user-attachments/assets/7b02a160-c0a9-4d27-b9e7-eed8624a8a19" width="600" controls />
</div>

---

## 📖 About the Project

**Painting by Numbers** is an interactive mobile application that allows users to explore a rich gallery of paintings via a RESTful API and convert their own images into "paint-by-number" templates. 

To achieve blazing-fast performance for complex image processing tasks (such as downscaling, color quantization, and contour detection), the application leverages a hybrid architecture integrating **Dart (Flutter)** and **Rust**.

### ✨ Key Features
- 🔐 **Secure Authentication:** Registration and Sign-In powered by **Firebase Auth**.
- 🖼️ **Painting Exploration:** Browse and explore a curated list of paintings fetched from a backend API.
- 🦀 **Rust-Powered Image Engine:** Uses Rust for heavy-lifting image processing (downscaling, quantization) to generate paint-by-numbers canvases in real-time.
- 🌓 **Dynamic Theming:** Built-in support for Light and Dark themes for an optimal viewing experience.
- 🎨 **Modern UI Kit:** Utilizes a highly customizable **shadcn** UI kit for Flutter, providing a sleek, accessible, and modern user interface.

---

## 🏗️ Architecture Overview

The project follows a **Feature-Based Architecture** (also known as Feature-Driven Architecture), which ensures high scalability, maintainability, and strict separation of concerns.

The architecture strictly enforces that different domains of the application interact only via defined **contracts**.

### 📂 Directory Structure

```text
├── lib/
│   ├── app/           # App-level configurations, DI setup, Router, and global state
│   ├── core/          # Shared utilities, UI kits, base classes, and interfaces
│   └── features/      # Independent feature modules
└── rust/              # Rust source code for image processing
```

### 🧩 Feature-Based Approach
In a standard layered architecture, code is grouped by technical concerns (e.g., all models together, all screens together). In this **Feature-Based Architecture**, code is grouped by **business capabilities** (`auth`, `home`, `create_painting`, `settings`).

#### 📜 The `FeatureModule` Contract
Every feature is treated as an independent micro-application. The entry point to any feature is enforced by the `FeatureModule` interface, located at `lib/core/feature/feature_module.dart`:

```dart
abstract interface class FeatureModule {
  List<RouteBase> get routes;
}
```
This guarantees that each feature dictates its own routing (and optionally its own dependency injection logic) without leaking internal implementation details to the rest of the application.

#### 🗂️ The `FeatureRegistry`
The application wireframes these independent modules together inside `lib/app/registry/feature_registry.dart`. The registry orchestrates all active features:

```dart
const List<FeatureModule> appFeatures = [
  AuthFeature(),
  HomeFeature(),
  CreatePaintingFeature(),
  SettingsFeature(),
];
```
This plug-and-play system means that adding, removing, or refactoring a feature requires zero changes to the core routing logic.

### ⚙️ Core Modules Breakdown

- **`lib/app/`**: The glue that holds the app together. It initializes Firebase, sets up global providers, configures `go_router` by consuming the `appFeatures` registry, and boots the Flutter application.
- **`lib/core/`**: The foundation. It houses the **UI Kit (shadcn)**, ensuring visual consistency across the app. It also contains network clients, error handling abstractions, and the base interfaces (like `FeatureModule`).
- **`lib/features/`**: The business logic. Each feature contains its own Domain, Data, and Presentation layers. 
- **`rust/`**: The performance engine. Contains the Rust core that handles image processing. We utilize `flutter_rust_bridge` to auto-generate safe and asynchronous Dart bindings, allowing our Flutter UI to execute heavy image quantization without dropping a single frame.

---

## ⚡ Why this Architecture?

1. **Scalability:** Teams can work on different features (e.g., `auth` vs `create_painting`) simultaneously without encountering merge conflicts in shared routing or DI files.
2. **Performance:** By offloading CPU-intensive image generation to Rust, the Flutter UI thread remains completely unblocked, guaranteeing a smooth 60/120 FPS experience.
3. **Decoupling:** Features communicate through strict interfaces. You can completely rewrite the `SettingsFeature` without ever touching the `HomeFeature`.
4. **Employer-Ready:** Demonstrates a mature understanding of application lifecycle, contract-driven development, Foreign Function Interfaces (FFI), and state-of-the-art Flutter architectural patterns.

---

<div align="center">
  <i>Built with 💙 by a passionate developer focusing on robust software engineering.</i>
</div>
