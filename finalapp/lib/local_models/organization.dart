import 'package:finalapp/local_models/location.dart';

class Organization {
  late final String name;
  Location location = Location.notDefined();
  Organization(
    this.name,
    this.location,
  );
}
