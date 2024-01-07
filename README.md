Code Documentation - TODO List App

Overview:-
TODO List is a Flutter-based mobile application designed to help users manage tasks efficiently. This documentation provides an overview of the code structure, key decisions, and instructions for running and testing the app.

Code Structure:-
The code is organised following the Flutter framework conventions. Here is an overview of the main components:

lib: Contains the main Dart code for the application.
main.dart: Entry point of the application, defines the main app widget.

models: Contains data models used in the application.
note.dart: Defines the `Note` class, representing a note in the app.

providers: Contains classes responsible for managing state using the Provider package.
note_provider.dart: Manages the state related to notes.

screens: Contains the different screens of the app.
add_note.dart: Screen for adding a new note.
edit_note.dart: Screen for editing an existing note.
home_screen.dart: Main screen displaying a list of tasks/notes.

Packages Used:-
The following Flutter packages are utilised in this project:

shared_preferences(2.2.2): Used for persistent storage of simple data, such as user preferences.
provider(6.1.1): A state management solution to manage and propagate the state changes across the app.
intl(0.19.0): Provides internationalisation and localization support for formatting dates and numbers.




Important Decisions:-

State Management: The app uses the Provider package for state management. The `NoteProvider` class, located in `note_provider.dart`, manages the state related to notes.

Navigation: Navigation between screens is handled through the `MaterialApp` widget. Routes are defined in the `main.dart` file.

Design Principles: The app follows the Material Design principles for a clean and intuitive user interface.



How to Run/Test the App:-

Prerequisites: Ensure you have Flutter and Dart installed on your machine.

Clone the repository:
https://github.com/skfareeduddin/todo_list.git

Steps:
Navigate to the project directory

Install dependencies: Use the command, “flutter pub get”

Connect a physical device or start an emulator

Run the App: Use the command, “flutter run”. This command will build and run the app on your connected device or emulator.

Testing: Unit and widget tests are located in the test directory. Run tests using the command, “flutter test”


