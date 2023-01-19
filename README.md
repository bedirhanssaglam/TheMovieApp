# The Movie App

Millions of movies, TV shows and people to discover. Explore now!

# Application Screenshots

![app_images](https://user-images.githubusercontent.com/105479937/208702860-42ac84c1-a6c6-4af9-a2b3-fc1b6b62e282.png)

# NOTE:

Before using the project, you must obtain an API Key from https://www.themoviedb.org/. It's a pretty easy process. Then you must define this key in the AppConstants class in the project.

Tests of services are written. You can check it from the 'test' folder.

You can find the Postman file I created by looking at the API documentation under the postman folder in the project.

# Libraries:

Initialize the Flutter project, add all the necessary dependencies mentioned above in the **pubspec.yaml** configuration file and run `pub get`.

**pubspec.yaml**
```yaml
dependencies:
  flutter:
    sdk: flutter

  cupertino_icons: ^1.0.2

   # Text
  auto_size_text: ^3.0.0
  google_fonts: ^3.0.1

  # Responsive
  sizer: ^2.0.15

  # Design
  kartal: ^2.7.0
  lottie: ^2.0.0
  percent_indicator: ^4.2.2

  # Image
  flutter_svg: ^1.1.6

  # Navigation
  go_router: ^5.2.4

  # Localization
  bot_toast: ^4.0.3

  # Json Serializable
  json_serializable: ^6.5.4
  json_annotation: ^4.7.0

  # Network
  vexana: ^2.8.1
  connectivity_plus: ^3.0.2

  # Equality Operator
  equatable: ^2.0.5

  # State Management
  flutter_bloc: ^8.1.1
  flutter_riverpod: ^2.1.1

dev_dependencies:
  flutter_test:
    sdk: flutter

  flutter_lints: ^2.0.0

  # Code Generation
  build_runner: ^2.3.2

   # Application Icon
  flutter_launcher_icons: ^0.11.0
  ```

## Getting Started

First of all, there are two main builds in our src>lib folder. These are view and core structures.

- core: This layer is the part that will manage or initiate the work that will do our main work.

base: This layer contains our cubit, model, main functions and service files.

components: This layer contains widgets that we can use on the pages, such as button, text, scaffold, which we can create here and customize with parameters where we want to use them.

constants: This layer consists of two structures, these structures are app and enums structures.

extensions: This layer and the project contain the basic structure, String and int.

init: This layer consists of 5 main structures. These structures are main_build , routes , network, utils, theme and dependency_injector.

mixins: waitForScreen mixin is defined here and later used in NetworkChangeManager.

utils: Typedefs used in the app are filed here.

- view: This layer contains our screens. We can create a folder for each screen and widgets file for this screen, if necessary, in this folder.
