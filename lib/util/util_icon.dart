import 'package:flutter/material.dart';

class UtilIcon {
  IconData intToIcon(int type) {
    switch (type) {
      case 1:
        return Icons.directions_car;
      case 2:
        return Icons.local_taxi;
      case 3:
        return Icons.local_taxi_rounded;
      case 4:
        return Icons.directions_bus;
      case 5:
        return Icons.directions_bus_filled_outlined;
      case 6:
        return Icons.bus_alert_rounded;
      case 7:
        return Icons.local_shipping;
      case 8:
        return Icons.fire_truck_outlined;
      case 9:
        return Icons.motorcycle;
      case 10:
        return Icons.directions_bike;
      case 11:
        return Icons.directions_run;
      case 12:
        return Icons.train;
      default:
        return Icons.directions_car;
    }
  }

  String typeToString(int type) {
    switch (type) {
      case 1:
        return "V. Livianos";
      case 2:
        return "T. Básico";
      case 3:
        return "T. Colec";
      case 4:
        return "Taxibus";
      case 5:
        return "Bus";
      case 6:
        return "B. InterU";
      case 7:
        return "C. Simple";
      case 8:
        return "C. +2 Ejes";
      case 9:
        return "Motos";
      case 10:
        return "Bicicletas";
      case 11:
        return "Peatones";
      case 12:
        return "Tren";
      default:
        return "Peatones";
    }
  }
}
