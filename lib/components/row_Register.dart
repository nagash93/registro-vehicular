import 'package:flutter/material.dart';
import 'package:registro_vehicular/model/item_register_model.dart';

class RowRegister extends StatelessWidget {
  const RowRegister({Key? key, required this.item}) : super(key: key);
  final ItemRegisterModel item;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          item.timeNow.toString(),
          style: const TextStyle(color: Colors.white),
        ),
        const SizedBox(
          width: 10,
        ),
        Text(item.move.toString(), style: const TextStyle(color: Colors.white)),
        const SizedBox(
          width: 10,
        ),
        Text(item.type.toString(), style: const TextStyle(color: Colors.white)),
        const SizedBox(
          width: 10,
        ),
      ],
    );
  }
}
