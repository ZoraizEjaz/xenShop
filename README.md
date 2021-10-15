# xenShop Project

A xenShop project created in flutter using Bloc Provider. xenShop supports both Android & iOS, clone the appropriate branches mentioned below:

## Getting Started

The xenShop contains the minimal implementation required to create a new library or project. The repository code is preloaded with some basic components like basic app architecture, app theme, constants and required dependencies to create a new project. By using boiler plate code as standard initializer, we can have same patterns in all the projects that will inherit it. This will also help in reducing setup & development time by allowing you to use same code pattern and avoid re-writing from scratch.

## How to Use

**Step 1:**

Go to project root and execute the following command in console to get the required dependencies:

```
flutter pub get
```

**Step 2:**

Select the main.dart file from the toolbar and play it.

## Hide Generated Files

In-order to hide generated files, navigate to `Android Studio` -> `Preferences` -> `Editor` -> `File Types` and paste the below lines under `ignore files and folders` section:

```
*.inject.summary;*.inject.dart;*.g.dart;
```

In Visual Studio Code, navigate to `Preferences` -> `Settings` and search for `Files:Exclude`. Add the following patterns:
```
**/*.inject.summary
**/*.inject.dart
**/*.g.dart
```

## xenShop Features:

* Categories
* Products
* Add to cart
* Remove product from cart
* Check out cart
* Successful transaction page


### Libraries & Tools Used

* [Http](https://github.com/dart-lang/http)
* [Bloc](https://github.com/felangel/bloc/tree/master/packages/flutter_bloc) (State Management)
* [Json Serialization](https://github.com/dart-lang/json_serializable)
* [Share Preference](https://pub.dev/packages/shared_preferences)
* [Connectivity Plus](https://pub.dev/packages/connectivity_plus) (Internet)

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
|- constants/
|- modules/
|- utils/
|- app.dart
|- main.dart
|- theme.dart
```

Now, lets dive into the lib folder which has the main code for the application.

```
1- constants - All the application level constants are defined in this directory with-in their respective files. This directory contains the constants for `theme`, `api endpoints`, `preferences` and `strings`.
2- repository - Contains the data layer of your project, includes directories for local, network and shared pref/cache.
3- products - Contains product(s) for state-management of your application, to connect the reactive data of your application with the UI.
4- screens— Contains all the ui of your project, contains sub directory for each screen.
5- util — Contains the utilities/common functions of your application.
6- widgets — Contains the common widgets for your applications. For example, Button, TextField etc.
8- main.dart - This is the starting point of the application.
9- app.dart - All the application level configurations are defined in this file i.e, theme, routes, title, orientation etc.
```

### Constants

This directory contains all the application level constants. A separate file is created for each type as shown in example below:

```
constants/
|- api_path_constants.dart
|- app_constants.dart
|- colors_constants.dart
|- strings_constants.dart
```

### modules

This directory contains all the modules/features of the App. A separate folder is created for each feature as shown in example below:

```
modules/
|- categories
|- payment.dart
|- products.dart
|- shopping_cart.dart
```

### utils

This directory contains helper functions, widgets, services(networking & shared pref).

```
utils/
|- helpers
       I- internet
|- services
       I- networking
       I- shared preference
|- ui
     I- bottom_loader.dart
     I- custom_elevated_button.dart
```


### Bloc

All the business logic of your application will go into this directory, every module has bloc directory. It is sub-divided into three directories `bloc`, `state` and `event`. Since each layer exists independently, It will increase code readability and maintenence. The communication between UI and data layer is handled by using Bloc. It is similar to MVVM.

```
categories/
|- bloc/
    |- category_bloc.dart
    |- category_state.dart
    |- category_event.dart

products/
|- bloc/
    |- products_bloc.dart
    |- product_state.dart
    |- product_event.dart

shopping_cart
|- bloc/
    |- cart_bloc.dart
    |- cart_state.dart
    I- cart_event.dart

```


