# Flutter Clean Architecture with Riverpod

## Project Overview
This project implements a Flutter application following Clean Architecture principles using Riverpod 3.0 for state management. The architecture is designed to be scalable, testable, and maintainable, with a clear separation of concerns.

## Architecture
The project follows the Clean Architecture pattern with three main layers:

### 1. Domain Layer
- Contains business logic and use cases
- Defines entities and repository interfaces
- Independent of any external framework or library

### 2. Data Layer
- Implements repository interfaces defined in the domain layer
- Handles data retrieval from remote (API) and local sources (SQLite, Secure Storage)
- Maps data models to domain entities

### 3. Presentation Layer
- Handles UI rendering and user interactions
- Manages application state using Riverpod
- Contains screens, widgets, and state notifiers

## Project Structure

```
lib/
├── core/                       # Core functionality used across the app
│   ├── api/                    # API related code
│   │   └── api_client.dart     # Dio API client implementation
│   ├── constants/              # App-wide constants
│   │   ├── database_constants.dart # Database-related constants
│   │   └── storage_keys.dart   # Storage keys for secure storage
│   ├── errors/                 # Error handling
│   │   └── app_exception.dart  # Application exception classes
│   ├── navigation/             # Routing
│   │   ├── app_router.dart     # GoRouter configuration
│   │   └── route_paths.dart    # Route path constants
│   ├── storage/                # Storage implementations
│   │   ├── database_helper.dart # SQLite database helper
│   │   └── secure_token_storage.dart # Secure storage for tokens
│   └── utils/                  # Utilities
│       └── app_logger.dart     # Custom logger implementation
├── features/                   # Feature-based modules
│   └── auth/                   # Authentication feature
│       ├── data/               # Data layer
│       │   ├── datasources/    # Data sources (remote and local)
│       │   │   ├── auth_local_data_source.dart
│       │   │   └── auth_remote_data_source.dart
│       │   ├── models/         # Data models
│       │   │   ├── auth_response_model.dart
│       │   │   └── user_model.dart
│       │   └── repositories/   # Repository implementations
│       │       └── auth_repository_impl.dart
│       ├── domain/             # Domain layer
│       │   ├── entities/       # Domain entities
│       │   │   └── user.dart
│       │   ├── repositories/   # Repository interfaces
│       │   │   └── auth_repository.dart
│       │   └── usecases/       # Use cases
│       │       ├── sign_in_usecase.dart
│       │       ├── sign_up_usecase.dart
│       │       └── sign_out_usecase.dart
│       └── presentation/       # Presentation layer
│           ├── providers/      # State management
│           │   ├── auth_notifier.dart
│           │   ├── auth_providers.dart
│           │   └── auth_state.dart
│           ├── screens/        # UI screens
│           │   ├── sign_in_screen.dart
│           │   └── sign_up_screen.dart
│           └── widgets/        # Reusable UI components
│               ├── auth_button.dart
│               └── password_field.dart
├── app.dart                    # App configuration
└── main.dart                   # Entry point
```

## Key Technologies and Packages
- **State Management**: Flutter Riverpod 3.0
- **Routing**: GoRouter
- **Local Storage**: SQLite (via sqflite) and flutter_secure_storage
- **Networking**: Dio for HTTP requests
- **Utilities**: Connectivity Plus for network status
- **Value Equality**: Equatable

## Features
### Authentication
- User sign-in with email and password
- User sign-up with name, email, and password
- Secure token storage
- Persistent user session

## Getting Started

### Prerequisites
- Flutter SDK (2.0.0 or higher)
- Dart SDK (2.12.0 or higher)

### Installation
2. Install dependencies

```bash
flutter pub get
```

3. Run the app

```bash
flutter run
```

## Architecture Details

### Dependency Flow
The dependency flow follows the Clean Architecture principle of dependency inversion:
- **Domain layer** has no dependencies on other layers
- **Data layer** depends on the Domain layer
- **Presentation layer** depends on the Domain layer

### Authentication Flow
1. User enters credentials in the UI
2. State notifier calls the appropriate use case
3. Use case executes the repository method
4. Repository fetches data from data sources (remote or local)
5. Data is returned through the layers and state is updated

## Project Principles

### SOLID Principles
- **Single Responsibility**: Each class has only one reason to change
- **Open/Closed**: Open for extension, closed for modification
- **Liskov Substitution**: Subtypes must be substitutable for their base types
- **Interface Segregation**: Clients should not depend on interfaces they do not use
- **Dependency Inversion**: High-level modules depend on abstractions

### Clean Code Practices
- Meaningful names for classes, methods, and variables
- Small, focused functions with a single responsibility
- Comprehensive error handling
- Consistent code style and formatting
- Detailed logging for debugging

## Testing Strategy
The architecture is designed to facilitate testing at all levels:
- **Unit Tests**: For use cases, repositories, and data sources
- **Widget Tests**: For UI components
- **Integration Tests**: For feature flows

## Future Improvements
- Add comprehensive test coverage
- Implement more features (profile, settings, etc.)
- Enhance error handling and user feedback
- Add theming and localization
- Implement proper API integration

## Contributing
1. Fork the repository
2. Create your feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add some amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## License
This project is licensed under the MIT License - see the LICENSE file for details.

## Code Style Guide

### General
- Use camelCase for variables and methods
- Use PascalCase for classes and types
- Use snake_case for file names

### Imports
Organize imports in the following order:
1. Dart SDK
2. Flutter SDK
3. External packages
4. Relative imports (grouped by layer)

### Comments
- Use `///` for documentation comments
- Add comments for complex logic
- Include purpose and usage examples for public APIs

## Best Practices
- Keep files small and focused
- Use const constructor whenever possible
- Prefer final variables
- Use private fields and methods when appropriate
