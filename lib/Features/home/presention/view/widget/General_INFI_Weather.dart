import 'package:flutter/material.dart';

class General_INFI_Weather extends StatelessWidget {
  const General_INFI_Weather({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(left: 10.0),
                  child: Text(
                    "Clear",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ),
                Text(
                  "20",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 90,
                      fontWeight: FontWeight.w300),
                ),
              ],
            ),
            Text(
              "\u00B0",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 55,
                  fontWeight: FontWeight.w200),
            ),
            Padding(
              padding: EdgeInsets.only(left: 24, top: 66.0),
              child: Text(
                "C",
                style: TextStyle(color: Colors.white60, fontSize: 30),
              ),
            ),
          ],
        ),
        Row(
          spacing: 10,
          children: [
            Icon(
              Icons.arrow_downward,
              size: 30,
              color: Colors.red,
            ),
            Text(
              "27" + "\u00B0",
              style: TextStyle(color: Colors.white),
            ),
            Icon(
              Icons.arrow_upward,
              size: 30,
              color: Colors.blueAccent,
            ),
            Text(
              "12" + "\u00B0",
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
        TextButton(
            onPressed: () {},
            child: Text(
              "No precip 120 mon >",
              style: TextStyle(color: Colors.white),
            ))
      ]),
    );
  }
}
