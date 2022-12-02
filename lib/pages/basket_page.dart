import 'package:flutter/material.dart';

class BasketPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return
      Expanded(
      child: Column(
        children: [
          Container(
            height: 25,
            width: 500,
            color: Colors.red,
          ),
          Expanded(
            child: Container(),
          )
        ],
      )
    );
  }
}