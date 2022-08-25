import 'package:flutter/material.dart';
import 'package:registro_vehicular/screens/register_grid_screen.dart';
import 'package:registro_vehicular/util/permission_handler.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<MainScreen> {
  final TextEditingController _placeController = TextEditingController();
  final TextEditingController _proyectController = TextEditingController();
  final TextEditingController _nameFileController = TextEditingController();

  @override
  void initState() {
    PermissionHandler().getPermission();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: SingleChildScrollView(
            reverse: true,
            child: Container(
              padding: const EdgeInsets.all(8.0),
              width: MediaQuery.of(context).size.width * 0.4,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Text("Crear Nuevo registro",
                        style: TextStyle(fontSize: 16, color: Colors.grey)),
                  ),
                  TextFormField(
                    controller: _placeController,
                    textInputAction: TextInputAction.next,
                    onEditingComplete: () => FocusScope.of(context).nextFocus(),
                    decoration: const InputDecoration(
                      labelText: 'Esquina Registro',
                      labelStyle: TextStyle(fontSize: 16, color: Colors.grey),
                      hintText: 'Lago Icalma',
                      hintStyle: TextStyle(fontSize: 16, color: Colors.grey),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                    ),
                    style: const TextStyle(fontSize: 18, color: Colors.white),
                  ),
                  TextFormField(
                    textInputAction: TextInputAction.next,
                    controller: _proyectController,
                    onEditingComplete: () => FocusScope.of(context).nextFocus(),
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Proyecto',
                      labelStyle: TextStyle(fontSize: 16, color: Colors.grey),
                      hintText: 'IMIVI Portal de Peñuelas (Lago Maihue)',
                      hintStyle: TextStyle(fontSize: 16, color: Colors.grey),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                    ),
                    style: const TextStyle(fontSize: 18, color: Colors.white),
                  ),
                  TextFormField(
                    textInputAction: TextInputAction.done,
                    controller: _nameFileController,
                    decoration: const InputDecoration(
                      labelText: 'Nombre Archivo',
                      labelStyle: TextStyle(fontSize: 16, color: Colors.grey),
                      hintText: 'registro2022',
                      hintStyle: TextStyle(fontSize: 16, color: Colors.grey),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                    ),
                    style: const TextStyle(fontSize: 18, color: Colors.white),
                  ),
                  /*ElevatedButton(
                      onPressed: () {
                        if(_placeController.text.isNotEmpty&&
                            _proyectController.text.isNotEmpty &&
                        _nameFileController.text.isNotEmpty){

                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      RegisterScreen(
                                        place: _placeController.text,
                                        proyect: _proyectController.text,
                                        nameFile: _nameFileController.text,
                                      )));
                        }

                      },
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(width: 2.0, color: Colors.white),
                      ),
                      child: const Text(
                        "Iniciar registro",
                        style: TextStyle(color: Colors.white),
                      )),*/
                  ElevatedButton(
                      onPressed: () {
                        if (_placeController.text.isNotEmpty &&
                            _proyectController.text.isNotEmpty &&
                            _nameFileController.text.isNotEmpty) {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      RegisterGridScreen(
                                        place: _placeController.text,
                                        project: _proyectController.text,
                                        nameFile: _nameFileController.text,
                                      )));
                        }
                      },
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(width: 2.0, color: Colors.white),
                      ),
                      child: const Text(
                        "Iniciar Grid registro",
                        style: TextStyle(color: Colors.white),
                      )),
                ],
              ),
            )),
      ),
    );
  }
}
