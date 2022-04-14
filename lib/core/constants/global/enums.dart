// ignore_for_file: constant_identifier_names

enum Source { NETWORK, WIDGET_BUILD, SCREEN, UNNAMED, ERROR, INFORMATION }

enum DeviceType {
  mobile,
  tablet,
  web,
  mac,
  windows,
  linux,
  fuchsia,
}

enum LoadingState { Initial, Loading, Loaded, Error }

enum LocalManagerKeys {
  accessToken,
  accessTokenExpireTime,
  languageCode,
  darkMode,
  isUserLogged,
  currentProfileString,
  userCountry,
  isUserLoggedWithoutRememberMe,
  timeLastLoad,
  restaurantName,
}

enum WorkHoursType { none, workingHours, pickUp, delivery, tableReservation }
