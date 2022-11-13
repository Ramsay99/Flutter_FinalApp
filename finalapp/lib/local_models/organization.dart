import 'package:finalapp/local_models/location.dart';

class Organization {
  late final String _name;
  Location _location = Location.notDefined();
  Organization(this._name, this._location);
}
