import 'package:flutter/material.dart';
import 'package:registro_vehicular/components/header_grid.dart';
import 'package:registro_vehicular/components/icon_text_button.dart';
import 'package:registro_vehicular/components/row_Register.dart';
import 'package:registro_vehicular/screens/main_screen.dart';
import 'package:registro_vehicular/service/register/register_repository.dart';
import 'package:registro_vehicular/util/util_file.dart';

import '../model/item_register_model.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen(
      {Key? key,
      required this.place,
      required this.proyect,
      required this.nameFile})
      : super(key: key);
  final String place;
  final String proyect;
  final String nameFile;

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  ScrollController listController = ScrollController();
  ScrollController headerController = ScrollController();
  ScrollController gridController = ScrollController();

  @override
  void initState() {

    headerController.addListener(() {
      if (headerController.offset != gridController.offset) {
        gridController.jumpTo(headerController.offset);
      }
    });
    gridController.addListener(() {
      if (headerController.offset != gridController.offset) {
        headerController.jumpTo(gridController.offset);
      }
    });
    super.initState();
  }

  List<ItemRegisterModel> listRegister = [];

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.black87,
      body: SafeArea(
        child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Column(
              children: [
                SingleChildScrollView(
                controller:headerController,
                scrollDirection: Axis.horizontal,
                child: const SizedBox(
                  width: 1000.0,
                  child:  HeaderGrid(),
                )),
                Expanded(
                    child: SingleChildScrollView(
                      controller:gridController,
                        scrollDirection: Axis.horizontal,
                        child: SizedBox(
                          width: 1000.0,
                          child: ListView.builder(
                              shrinkWrap: true,
                              itemCount: 13,
                              itemBuilder: (BuildContext context, int index) =>
                                  rowBuilder(index)),
                        ))),
                Container(
                    height: 50,
                    child: Row(
                      children: [
                        Expanded(
                          child: ListView.builder(
                              controller: listController,
                              reverse: true,
                              itemCount: listRegister.length,
                              itemBuilder: (BuildContext context, int index) =>
                                  RowRegister(
                                    item: listRegister[index],
                                  )),
                        ),
                        Text(widget.nameFile,
                        style: const TextStyle(
                          color: Colors.white
                        ),),
                        IconTextButton(
                          icon: Icons.file_open,
                          text: 'Abrir',
                          onPressed: () {
                            UtilFile().openFile(widget.nameFile);
                          },
                        ),
                        IconTextButton(
                          icon: Icons.close,
                          text: 'Cerrar',
                          onPressed: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        const MainScreen()));
                          },
                        ),
                      ],
                    ))
              ],
            )),
      ),
    );
  }

  rowBuilder(int index) {

    return Container(
      color:  (index % 5 != 0 && index!=0) ?index % 2 == 0 ? Colors.black : Colors.grey.withOpacity(0.2):
    Colors.blue.withOpacity(0.15),
      padding: const EdgeInsets.all(5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            width: 40,
            child: Text(
              (index ).toString(),
              style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 30),
            ),
          ),
          buttonRegister(
              move: index,
              type: 1,
              icon: Icons.directions_car,
              text: "Vehículos Livianos"),
          buttonRegister(
              move: index,
              type: 2,
              icon: Icons.local_taxi,
              text: "Taxi Básico"),
          buttonRegister(
              move: index,
              type: 3,
              icon: Icons.local_taxi_rounded,
              text: "Taxi Colectivo"),
          buttonRegister(
              move: index,
              type: 4,
              icon: Icons.directions_bus,
              text: "Taxibus"),
          buttonRegister(
              move: index,
              type: 5,
              icon: Icons.directions_bus_filled_outlined,
              text: "Bus"),
          buttonRegister(
              move: index,
              type: 6,
              icon: Icons.bus_alert_rounded,
              text: "Bus Interurbano"),
          buttonRegister(
              move: index,
              type: 7,
              icon: Icons.local_shipping,
              text: "Camión Simple"),
          buttonRegister(
              move: index,
              type: 8,
              icon: Icons.fire_truck_outlined,
              text: "Camión +2 Ejes"),
          buttonRegister(
              move: index, type: 9, icon: Icons.motorcycle, text: "Motos"),
          buttonRegister(
              move: index,
              type: 10,
              icon: Icons.directions_bike,
              text: "Bicicletas"),
          buttonRegister(
              move: index,
              type: 11,
              icon: Icons.directions_run,
              text: "Peatones"),
        ],
      ),
    );
  }

  buttonRegister(
      {required int move, required int type, IconData? icon, String? text}) {
    ItemRegisterModel newItem;
    return Container(
      padding: const EdgeInsets.all(2),
      width: 80,
      child: ElevatedButton(
        onPressed: () {
          listController.animateTo(
            listController.position.maxScrollExtent,
            curve: Curves.easeOut,
            duration: const Duration(milliseconds: 300),
          );

          newItem = ItemRegisterModel(
              DateTime.now(), move + 1, type, widget.place, widget.proyect);
          if(listRegister.length>20){
            listRegister.clear();
          }
          listRegister.add(newItem);
          RegisterRepository().writeRegisterItem(newItem, widget.nameFile);
          setState(() {});
        },
        style: ElevatedButton.styleFrom(
          shape: const CircleBorder(),
          padding: const EdgeInsets.all(15),
          primary: Colors.transparent,
          onPrimary: Colors.black12,
          side:const BorderSide(width: 1.0, color: Colors.white,)
        ),
        child: Column(
          children: [
            Icon(icon ?? Icons.menu, color:Colors.white,size: 35,),
          ],
        ),
      ),
    );
  }
}
