# CoinRich

Cross-platform, customer facing app developed using flutter

#### Dependencies required:

-   Flutter

##### Demo:

<https://res.cloudinary.com/dz7duml2h/video/upload/v1680424609/Simulator_Screen_Recording_-_iPhone_14_Pro_Max_-_2023-04-02_at_13.59.20_pe6wao.mov>

##### Installing flutter:

Flutter can be installed on Windows, Mac, Linux, ChromeOS by following the steps listed in the official [flutter docs here](https://docs.flutter.dev/get-started/install).

##### Show information about the installed tooling

```
flutter doctor
```

##### Installing packages:

```
flutter packages get
```

##### Running the project:

```
flutter run
```

##### Running the web project on a specific port number:

```
flutter run -d web-server --web-hostname 0.0.0.0 --web-port <port>
```

##### Running tests with coverage report:

```
flutter test --coverage
```

##### Building the app with code obfuscation:

```
flutter build apk --obfuscate --split-debug-info=/<project-name>/<directory>
```

##### Building the project:

```
flutter build <platform name>

example: flutter build web
```
