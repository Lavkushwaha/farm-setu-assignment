# farm_setu_assignment

FarmSetu Assignment Flutter App

## CORE


#### ENTRY POINT:
```
main.dart -> app.dart -> Generated Route(default Route : Init Screen)
```

#### INITIALIZATION:
```
Appconfig -> for checking if app is production or development

ConnectionStatus -> for checking internet connection

GeolocationService -> for getting permission and current location
```

#### API FLOW:
```

BLOC -> REPOSITORY -> API PROVIDER -> DIO CLIENT -> API SERVICE -> API MODEL -> BLOC

```

#### BLOC STATE FLOW
```
USING BEHAVIOUR SUBJECT TO CHANGE THE STATE OF BLOC

loadingController<bool> -> StreamController for loading state

BLOC 
-> Call API
-> Set loading state to true
---> API CALL SUCCESS
---> Set loading state to false
---> Set data to BLOC

---> API CALL FAILED
---> Add error to Stream Controller
---> Set loading state to false


INSIDE MODULE

Stream Builder Wraps the child where the stream is listened

StreamBuilder<bool> for loading state

---> StreamBuilder<bool> for error state return ERROR STATE

---> StreamBuilder<bool> for data state return DATA STATE

---> StreamBuilder<bool> for loading state return CircularProgressIndicator


```

## Navigation
```
GENERATED ROUTE 

Routing

/ -> initScreen.dart or Splash Screen
home -> homescreen.dart 
history -> historyscreen.dart
```

## Plugins Used

```
 connectivity: ^3.0.6
 dio: ^4.0.4
 geolocator: ^8.1.1
 get: ^4.6.1
 google_maps_flutter: ^2.1.1
 intl: ^0.17.0
 rxdart: ^0.27.3
```






For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
