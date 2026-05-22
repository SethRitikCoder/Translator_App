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

  static Widget customButton({
    required String buttonName,
    required VoidCallback callback,
  }) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        alignment: Alignment.center,
        foregroundColor: Colors.white,
        backgroundColor: Color.fromRGBO(0, 168, 132, 1),
        elevation: 1.0,

        // side: BorderSide(color: Colors.cyan, width: 2.0),
      ),
      onPressed: () {
        callback();
      },
      child: Text(
        buttonName,
        style: TextStyle(fontFamily: "Inter", fontWeight: FontWeight.bold),
      ),
    );
  }

  static Widget customDropdown({
    required Color disablecolor,
    required Color enablecolor,
    Color? focuscolor,
    required String initialvalue,
    required Map<String, String> mapdata,
    required ValueChanged<String?> onchanged,
  }) {
    return Container(
      height: 40,

      decoration: BoxDecoration(
        border: Border.all(color: Color.fromRGBO(0, 168, 132, 1), width: 2),
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Padding(
        padding: EdgeInsets.all(5.0),
        child: DropdownButton(
          alignment: Alignment.center,
          iconDisabledColor: disablecolor,
          iconEnabledColor: enablecolor,
          dropdownColor: Colors.grey.shade400,
          focusColor: focuscolor ?? Colors.blueGrey,
          value: initialvalue,
          items: mapdata.entries
              .map(
                (entry) => DropdownMenuItem(
                  value: entry.value,
                  child: Text(entry.key),
                ),
              )
              .toList(),
          onChanged: onchanged,
        ),
      ),
    );
  }

  static Color customColor() {
    return Color.fromRGBO(0, 168, 132, 1);
  }

  static dynamic commonToast(BuildContext context, {required String data,required String labelName,required VoidCallback callback}) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(data,style: TextStyle(fontFamily: "Roboto"),),
        duration: Duration(seconds: 2),
        backgroundColor: Colors.red.shade400,
        behavior: SnackBarBehavior.floating,
        elevation: 2.0,

        action: SnackBarAction(
          label: labelName,
          textColor: Colors.white,

          onPressed:(){callback();}
        ),
      ),
    );
  }
}
