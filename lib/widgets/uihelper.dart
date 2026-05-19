import 'package:flutter/material.dart';

class Uihelper {
  static Widget customText(
    String textdata,
    double fontsize, {
    Color? textcolor,
    String? family,
    FontWeight? fontweight,
  }) {
    return Text(
      textdata,
      selectionColor: Colors.blue,
      style: TextStyle(
        fontSize: fontsize,
        color: textcolor ?? Color.fromRGBO(0, 168, 132, 2),
        fontStyle: FontStyle.normal,
        fontFamily: family ?? "Roboto",
        fontWeight: fontweight ?? FontWeight.bold,
      ),
    );
  }

  static Widget customButton({required String buttonName,required VoidCallback callback
  }) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        alignment: Alignment.center,
        foregroundColor: Colors.white,
        backgroundColor: Color.fromRGBO(0, 168, 132, 2),
        elevation: 1.0,
        // side: BorderSide(color: Colors.cyan, width: 2.0),
        
      ),
      onPressed: () {callback();},
      child: Text(
        buttonName,
        style: TextStyle(fontFamily: "Inter", fontWeight: FontWeight.bold),
      ),
    );
  }
}
