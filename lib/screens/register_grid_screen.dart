import 'package:flutter/material.dart';

import 'package:registro_vehicular/components/icon_text_button.dart';
import 'package:registro_vehicular/components/row_Register.dart';
import 'package:registro_vehicular/screens/main_screen.dart';
import 'package:registro_vehicular/service/register/register_repository.dart';
import 'package:registro_vehicular/util/util_file.dart';
import 'package:registro_vehicular/util/util_icon.dart';

import '../model/item_register_model.dart';

class RegisterGridScreen extends StatefulWidget {
  const RegisterGridScreen(
      {Key? key,
      required this.place,
      required this.project,
      required this.nameFile})
      : super(key: key);
  final String place;
  final String project;
  final String nameFile;

  @override
  State<RegisterGridScreen> createState() => _RegisterGridScreenState();
}

class _RegisterGridScreenState extends State<RegisterGridScreen> {
  @override
  void initState() {
    super.initState();
  }

  ScrollController listController = ScrollController();
  List<ItemRegisterModel> listRegister = [];
  int _selectNumber = 1;
  int _selectType = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      body: SafeArea(
        child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Row(
              children: [
                Expanded(
                    child: GridView.builder(
                        itemCount: 12,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          mainAxisSpacing: 10,
                          crossAxisSpacing: 10,
                        ),
                        itemBuilder: (BuildContext context, int index) {
                          return numberButton(index + 1);
                        })),
                Expanded(
                  child: dataScreen(),
                ),
                Expanded(
                    child: GridView(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                  ),
                  children: [
                    buttonRegister(
                        type: 1,
                        icon: Icons.directions_car,
                        text: "V. Livianos"),
                    buttonRegister(
                        type: 2, icon: Icons.local_taxi, text: "T. Básico"),
                    buttonRegister(
                        type: 3,
                        icon: Icons.local_taxi_rounded,
                        text: "T. Colec"),
                    buttonRegister(
                        type: 4, icon: Icons.directions_bus, text: "Taxibus"),
                    buttonRegister(
                        type: 5,
                        icon: Icons.directions_bus_filled_outlined,
                        text: "Bus"),
                    buttonRegister(
                        type: 6,
                        icon: Icons.bus_alert_rounded,
                        text: "B. InterU"),
                    buttonRegister(
                        type: 7, icon: Icons.local_shipping, text: "C. Simple"),
                    buttonRegister(
                        type: 8,
                        icon: Icons.fire_truck_outlined,
                        text: "C. +2 Ejes"),
                    buttonRegister(
                        type: 9, icon: Icons.motorcycle, text: "Motos"),
                    buttonRegister(
                        type: 10,
                        icon: Icons.directions_bike,
                        text: "Bicicletas"),
                    buttonRegister(
                        type: 11, icon: Icons.directions_run, text: "Peatones"),
                    buttonRegister(type: 12, icon: Icons.train, text: "Tren"),
                  ],
                ))
              ],
            )),
      ),
    );
  }

  buttonRegister({required int type, IconData? icon, String? text}) {
    ItemRegisterModel newItem;
    return Container(
      padding: const EdgeInsets.all(2),
      color: Colors.blue.withOpacity(0.1),
      width: 80,
      height: 100,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 50,
            child: ElevatedButton(
              onPressed: () {
                newItem = ItemRegisterModel(DateTime.now(), _selectNumber, type,
                    widget.place, widget.project);
                if (listRegister.length >= 19) {
                  setState(() {listRegister.clear();});
                }
                listRegister.add(newItem);
                RegisterRepository()
                    .writeRegisterItem(newItem, widget.nameFile);
                listController.animateTo(
                  (listController.position.maxScrollExtent+10),
                  curve: Curves.easeOut,
                  duration: const Duration(milliseconds: 100),
                );
                _selectType = type;
                setState(() {});
              },
              style: ElevatedButton.styleFrom(
                  shape: const CircleBorder(),
                  padding: const EdgeInsets.all(10),
                  primary: _selectType == type ? Colors.white : Colors.black,
                  onPrimary: Colors.blue,
                  side: const BorderSide(
                    width: 1.0,
                    color: Colors.white,
                  )),
              child: Column(
                children: [
                  Icon(
                    icon ?? Icons.menu,
                    color: _selectType == type ? Colors.black : Colors.white,
                    size: 30,
                  ),
                ],
              ),
            ),
          ),
          Text(
            text ?? '',
            maxLines: 1,
            style: const TextStyle(color: Colors.white),
          )
        ],
      ),
    );
  }

  numberButton(int index) {
    return SizedBox(
      width: 50,
      child: ElevatedButton(
        onPressed: () {
          _selectNumber = index;
          setState(() {});
        },
        style: ElevatedButton.styleFrom(
            shape: const CircleBorder(),
            padding: const EdgeInsets.all(15),
            primary: _selectNumber == index ? Colors.white : Colors.black,
            onPrimary: Colors.black12,
            side: const BorderSide(
              width: 1.0,
              color: Colors.white,
            )),
        child: Text(
          index.toString(),
          style: TextStyle(
              color: _selectNumber == index ? Colors.black : Colors.white,
              fontSize: 25),
        ),
      ),
    );
  }

  dataScreen() {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Proyecto: ${widget.project} - Esquina ${widget.place}",
            style: const TextStyle(color: Colors.white),
          ),
          Expanded(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                _selectNumber.toString(),
                textAlign: TextAlign.center,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 40,
                    fontWeight: FontWeight.bold),
              ),
              const Text(
                "-",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 40,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                width: 100,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(UtilIcon().intToIcon(_selectType),
                        size: 30, color: Colors.white),
                    Text(
                      UtilIcon().typeToString(_selectType),
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              )
            ],
          )),
          const Text(
            "Últimos ingresos",
            style: TextStyle(color: Colors.white),
          ),
          SizedBox(
            height: 200,
            child: ListView.builder(
                reverse: true,
                padding: const EdgeInsets.symmetric(vertical: 10),
                controller: listController,
                itemCount: listRegister.length,
                itemBuilder: (BuildContext context, int index) => RowRegister(
                      item: listRegister[index],
                    )),
          ),
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconTextButton(
                    icon: Icons.save,
                    text: 'Guardar',
                    onPressed: () {
                      UtilFile().writeFileDownload(widget.nameFile,context: context);
                    },
                  ),
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
              ),
              Text(
                "Archivo: ${widget.nameFile}",
                style: const TextStyle(color: Colors.white),
              ),
            ],
          )
        ],
      ),
    );
  }
}
