# RepoTo

<p align="center">
  <img src="./Img/img.png" width="1500px" alt="RepoTo Overview Image"/>
</p>

## 🔧 Key Refactoring Highlights

The refactoring of the RepoTo app has led to:

- Improved code readability and maintainability.
- Clearer state management and data flow.
- Enhanced testability and reliability.
- A more modular and scalable architecture.

---

### 1. Separation of Concerns Following the Single Responsibility Principle (SRP)

- **Before**: `ReportManager` handled multiple responsibilities, including view logic, URL processing, and external app integrations.
- **After**: Responsibilities were divided across distinct layers:
    - **Presentation Layer**: `ViewModel` manages UI-related state and actions.
    - **Domain Layer**: Business logic, such as URL scheme parsing, is handled by dedicated handlers.
    - **Infrastructure Layer**: External integrations, like Teams app deep linking, are managed separately.

---

### 2. Emphasis on Abstraction

- Shifted from direct parameter passing to using enums for managing related information, enhancing type safety and readability.
    - Examples include `LocationType` and `ReportLocationType` enums.

---

### 3. Improved Dependency Injection Using StateObject

- **Before**: `ReportManager` was shared globally via `Environment`.
- **After**:
    - `ReportViewModel` is instantiated in `RepotoApp` using `@StateObject`.
    - Child views receive dependencies through `@ObservedObject`.
    - This approach ensures better lifecycle management and prevents unintended side effects.

---

### 4. Removal of Redundant Code and Data Storage

- **Before**: Navigating via URL schemes involved a separate `LinkView`, with data temporarily stored in `UserDefaults`.
- **After**:
    - URL information is parsed by `URLHandler` and stored in `ViewModel`'s `@Published` properties.
    - Direct navigation to `ReportContentView` eliminates the need for extra views and storage.

---

### 5. Enhanced Stability Through Unit Testing

- Implemented test cases for URL scheme handling to ensure reliability.
- Tests cover various scenarios, including valid and invalid inputs, bolstering confidence in external entry points.

---

### 6. Streamlined Data Flow Centered Around ViewModel

- `ReportViewModel` serves as the central hub for app state, providing a consistent and predictable data flow across views.

---

### 7. Design Focused on Scalability and Maintainability

- Modular architecture allows for isolated updates and extensions.
- Facilitates easy integration of new features or external services without impacting existing components.

---
