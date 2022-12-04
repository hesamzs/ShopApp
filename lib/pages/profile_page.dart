import 'dart:math';

import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Container(
            height: 25,
          ),
          Expanded(
              child: Container(
                child: Center(
                  child: Container(
                    height: 150,
                    child: Column(
                      children: [
                        Container(
                          height: 50,
                          child: Text(
                            'Please Register Or Login',
                            textDirection: TextDirection.rtl,
                            style: TextStyle(
                                color: Colors.black54,
                                fontSize: 18,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                        ),
                        Container(
                          height: 50,
                          child: ElevatedButton(
                            child: Text('Open Login Page'),
                            onPressed: () {
                            },
                          ),
                        ),
                        Container(
                          height: 50,
                        ),
                      ],
                    ),
                  )
                ),
              )
          ),
          Container(
            height: 30,
          )
        ],
      ),
    );
  }
}