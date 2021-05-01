import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  final title;

  Header({this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width: 32.0,
          height: 0.0,
        ),
        Container(
          child: Text(
            title,
            textAlign: TextAlign.center,
          ),
        ),
        Container(
            child: IconButton(
                icon: Icon(
                  Icons.add,
                  size: 32.0,
                ),
                onPressed: null))
      ],
    );
  }
}
