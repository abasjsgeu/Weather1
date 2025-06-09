import 'package:flutter/material.dart';

class Custom_appBar extends StatelessWidget {
  const Custom_appBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
        scrolledUnderElevation: 5,
        elevation: 80.3,
        shadowColor: const Color.fromARGB(255, 0, 0, 0),
        flexibleSpace: FlexibleSpaceBar(
          background: Image.asset(
            'assets/7.jpg',
            fit: BoxFit.fill,
          ),
        ),
        pinned: true,
        snap: true,
        floating: true,
        title: const Center(
            child: Column(
          children: [
            Text(
              "Dmascus",
              style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: Colors.white),
            ),
            Text(
              "mon 1:33",
              style: TextStyle(color: Color.fromARGB(128, 218, 213, 213)),
            )
          ],
        )),
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {
            Scaffold.of(context).openDrawer();
          },
          icon: Icon(Icons.sort),
          iconSize: 30,
          color: Colors.white,
        ),
        actions: [
          Image.asset(
            width: 30,
            "assets/2.png",
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(
              Icons.add,
              size: 30,
              color: Colors.white,
            ),
          ),
        ]);
  }
}
