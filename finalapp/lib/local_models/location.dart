const int _notInitialized = -1;

class Location {
  double _latitude = _notInitialized.toDouble();
  double _longitude = _notInitialized.toDouble();

  Location(this._latitude, this._longitude);
  Location.notDefined();
}
