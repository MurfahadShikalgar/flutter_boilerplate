# practice_application

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.
The practice application is a demo application consisting all the important topics of flutter which are needed by the developers. These application contains implementation of many widgets, packages and intermediate to advanced topics.

## Practice App Features:

* Home Screen
* Second Screen (to set data in shared preference)
* Third Screen (to retrive data from shared preference) 
* Data Screen  (to display graphQL data)
* Detail Screen(to display graphQl passed data)
* Getx (State Management)
* Shared Preference (for managing data storage using shared prefernce operations)
* Dark- light Theme
* l10n (consisting translated laguage files)
* Translation (contains language list and required constants file for language change)
* Widgets (contains customs widget)
* Navigation Routes (all routes in single file)

## Packages Used:

* Get 
* Shared Preferences
* Flutter Localizations
* Intl
* GraphQL flutter
* connectivity

## Folder Structure

lib/
|- Getx_manager/    (contains getX state manager file which updates the state of application)

|- GraphQL/         (contains quieries, mutation and graphql configuration files

|- l10n/            (contains differebt languages translated json file)

|- screens/         

|- shared_preferenes/  (contains shared preference manager which give us different operations functions)

|- translations/       

|- utils/           (contains widgets and themes foler)

|- utils/network    (contains getX network manager and network binding file)

|- main.dart

|- routes           (contains routes of every screen)

## Screens features

## Home Screen

* First-a-fall AppBar contains the title , IconButton and Switch
* IconButton with Language icon gives us the dropDown list of languages , OnTap it translates the app into that     particular language.
* Switch is used for changing the theme of application. By default it is in Light Mode.
* An Elevated Button for Navigation. Done using Getx route.
* Be have created an basic increment, decrement and count operation. Whose state is managed and updated using GetxStateManager file in Getx folder.
* Below we see Two Button which represents the dialog and alert dialog. It is an custo widget created in widgets folder so that we can use these dialog widget anytime anywhere in the application.

## Second Screen (set data screen)

* In Second screen, We have two textfields, some button which will perform sharedPrefernce Set Opertions and Navigate button.
* There are two textfields. One is for key and other for value respectively. Key will be used to provide in shred prefernece which will be later needed to retrive data. And value is nothing but data which is to be tored in SharedPreference.
* There are multiple button with different set operations coming from shared prefernce manager.
* In shared perefernce manager file we have created fucntions for every operations. We just need to call the function and provide the required parameter.
* On successful operation you will get OPERATION SUCCESS msg in console.

## Third Screen (get data screen)

* In third screen, We have one textfield and multiple buttons with get operations of shared prefernce.
* While retrive data from shared prefernce manager you only need to provide is key and select the value type fucntion.
* We also have buttons to navigate usin getX route. Here we can directly jump to any screen.

## Widgets

* Widget folder in a part of utils folder.
* These folder containes all the reuasble and custom widgets.
* In Widgets folder, We have Dialog widget file and Textfield widget file.
* Dialog widget file is nothing but a class contains all type of dialogs like alert dialog, default dialog and also a custom dialog.
* TextFiled widget contains a textfield with decoration. These widget can be used multiple time. so it is required to create widget rather then writing code multiple times.

## GetX 

* These folder contains the GetX manager file for all screens
* Its better to create getxManager file for every single screen separately just to avoid confusion and chaos.
* In getX manager we provide the final data values to access directly using getx controllers and the functions to update the state of application.
* In function it is very simple to allocate the new values to previous values and at end of function you can just call update(). And it will update the state with new value or data.
* Using getx is very simple you just need to create the controller for getX with providing statemanager file name in Get.put() fucntion.
Ex - final GetxStateManager _controller = Get.put(GetxStateManager());
These is how you create getx controller and you are ready to go.

## Dark-Light Theme:

* We have integrated change theme mode feature in these app.
* Using a switch we can the theme of whole app. Using getX we are able to update the theme of the application smoothly.
* We can change the theme to dark and light. And it can also take the system theme as default theme of the application.

## App Localization

* Localizing the app with different languages is todays need of every applications.
* There are many packages providing help to translate the languages. Ex- easy localization, App localization.
* But the best is Flutter_localization which is an InBuild property of flutter Sdk. It just requires intl package to internationalise the apps.
* I have followed the Flutter_Localization documentation provided by the Flutter. I will also recommend you to go through the documentation and follow the steps it will definetely give the required result.
* Source link to documentation : https://docs.flutter.dev/development/accessibility-and-localization/internationalization 

## Translation

* These folder contains language_list.dart and language_constants.dart files.
* Language_list.dart file contain the class with the list and features of the languages used.
* It helps us in providing data in dropdown list.
* Language_constants.dart files contains the final values and some fucntions to setLocale and getLocale.
* These functions helps to change or set the locale language to new language and these function also store the Locale into the sharedpreference instance so that whenever we come to the application we will see the application language into the previously set locale language.

## l10n

* These folder contains the translated language files in json format.
* For every language we have to create the .arb file
* Every .arb file contains the key with the translated data in that particular language. Which is further required to get that data using key.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

## GraphQL

* It is a graphQL Api folder which contains modals, queries, mutation and config files of graphQL.
* Queries contains the final query which will be needed to read the data.
* Mutation file contains the mutations which will be needed to update, delete and create the data.
* GraphQl config contains the graphQl cofigurations which help to connect the application to the graphQL server.
* We also need to create a Getx manager to manage the state of graphQl Api calls. These file is created in Getx_state_manager folder.
* Modals contains the structure model of the fetched data in json format. These helps to access the functionalities of Api quickly and easily.
* To make the modal file we have used https://javiercbk.github.io/json_to_dart/ website. Here we have to just paste the fetched data and it give use the modal as output in dart format.

## Network

* These folder contains getX Network Manager which helps to get the connection type, update the connection type and to constantly liste to change in network with the help od StreamSubscription.
* Network binding file help us to bind the getX_network_manager to GetMaterialApp() in main.dart. It binds getx_network_manager file using initial binding in main.dart.
* Due to streamSubscription and initial binding of network file we can constantly listen to the changes in network.
<<<<<<< HEAD
=======

>>>>>>> d2b86c345e135e321edca253dc32ea87661e0416
