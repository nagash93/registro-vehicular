import 'package:flutter/material.dart';

class HeaderGrid extends StatelessWidget {
  const HeaderGrid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(
            width: 40,
          ),
          boxText("Vehículos Livianos", context),
          boxText("Taxi Básico", context),
          boxText("Taxi Colectivo", context),
          boxText("Taxibus", context),
          boxText("Bus", context),
          boxText("Bus Interurbano", context),
          boxText("Camión Simple", context),
          boxText("Camión +2 Ejes", context),
          boxText("Motos", context),
          boxText("Bicicletas", context),
          boxText("Peatones", context),
        ],
      ),
    );
  }

  Widget boxText(String text, BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(2),
      width: 80,
      child: Text(
        text,
        textAlign: TextAlign.center,
        maxLines: 2,
        style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      ),
    );
  }
}
