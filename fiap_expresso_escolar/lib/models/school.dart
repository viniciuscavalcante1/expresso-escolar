import 'package:latlong2/latlong.dart'; // Importando LatLng para o modelo

class School {
  final String name;
  final LatLng location; // Usando LatLng ao invés de String

  School(this.name, this.location);
}
