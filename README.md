## HOW TO RUN APP

First, you must be clone this project to your computer anywhere you want. Then, open the project by Visual Studio Code (Recommended by me) or Android Studio. You must upgrade your Flutter and Dart version same with my version or above (Read at Notice on this top document).

**NOTICES:**
This project was programmed with Flutter/Dart flatform. My project required the newest Flutter/Dart version on Dev channel.

Version of Flutter:
> 2.6.0-11.0.pre

Version of Dart:
> 2.15.0-116.0.dev

Next, you must be open the pubspec.yaml and get the package by the IDE or enter the command below to get all the packages. Then start your emulator or Android Device or iOS Device. Hit the run button in Android Studio or press F5 at Visual Studio Code.
`flutter pub get`

Please check the exact same package versions with the following:
```yaml
sqflite: ^2.0.1
path: ^1.8.0
flutter_bloc: ^8.0.0
equatable: ^2.0.3
get_it: ^7.2.0
cupertino_icons: ^1.0.2
```

## HOW TO RUN THE TEST

First, you check the pubspec.yaml has all the packages below in the dev_depedencies yet:
```yaml
flutter_test:
    sdk: flutter
  # The "flutter_lints" package below contains a set of recommended lints to
  # encourage good coding practices. The lint set provided by the package is
  # activated in the `analysis_options.yaml` file located at the root of your
  # package. See that file for information about deactivating specific lint
  # rules and activating additional ones.
  flutter_lints: ^1.0.0
  test: ^1.17.12
  sqflite_common_ffi:
  integration_test:           # new
    sdk: flutter
```
All the tests that I wrote include:
- all_task_test: To test the functionality of the page showing all lists including tests such as: checking the loaded list, changing task status, deleting tasks, and scrolling on the list. The remaining screens such as Completed Tasks and Incompleted Tasks have the same function as this screen, so they have been temporarily ignored.
- new_task_test: To test the functionality add a new task.
The test files are all automated functional tests.

To run test, you use command `flutter run test/[test_file_name].dart`. Example, if you want to test the all_task_test.dart, you will use `flutter run test/all_task_test.dart` command.

Notice: **You must be start the emulator or real device to begin test**
