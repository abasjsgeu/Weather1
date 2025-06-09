import 'package:flutter/material.dart';

class Item_Allergy extends StatelessWidget {
  const Item_Allergy({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Dust & Dande",
            style: TextStyle(
                color: const Color.fromARGB(199, 255, 255, 255), fontSize: 15),
          ),
          Text(
            "High",
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
          )
        ],
      ),
    );
  }
}
