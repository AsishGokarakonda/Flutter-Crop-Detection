## How to Use 

**Step 1:**

Download or clone this repo by using the link below:

```
https://github.com/AsishGokarakonda/Flutter-Crop-Detection.git
```

**Step 2:**

Go to project root and execute the following command in console to get the required dependencies: 

```
flutter pub get 
```

### Folder Structure
Here is the core folder structure which flutter provides.

```
flutter-app/
|- android
|- build
|- ios
|- lib
|- test
```

Here is the folder structure we have been using in this project

```
lib/
|- models/
|- screens/
|- utils/
|- widgets/
|- main.dart


### models

This directory contains all the data models used in the app.

```
constants/
|- plant.dart
|- user.dart

### screens

This directory contains all the UI of the app.

```
home/
|- adminhome/
|- pesthome/
|- all_home_page.dart


### utils

This directory contains all the helper functions and utilities used in the app.

```
utils/
|- api.dart
|- routes.dart

### widgets

This directory contains all the custom widgets used in the app.

```
widgets/
|- background_image.dart
|- curved_buttons.dart
|- curved_text_field.dart
|- exporting.dart

### Main

This is the starting point of the app.

```
main.dart
