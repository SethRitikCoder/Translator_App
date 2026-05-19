import 'package:flutter/material.dart';
import 'package:translator_app/widgets/uihelper.dart';
import 'package:translator/translator.dart';

class MyHomeScreen extends StatefulWidget {
  const MyHomeScreen({super.key});

  @override
  State<MyHomeScreen> createState() => _MyHomeScreenState();
}

class _MyHomeScreenState extends State<MyHomeScreen> {
  Map<String, String> languages = {
    "English": "en",
    "Hindi": "hi",
    "Spanish": "es",
    "French": "fr",
  };
  final translator = GoogleTranslator();
  Future tranlateText() async {
    var translation = await translator.translate(
      textController.text,
      from: fromLanguage,
      to: toLanguage,
    );
    setState(() {
      translatedText = translation.text;
    });
  }

  void swapFunction() {
    String temp = fromLanguage;
    fromLanguage = toLanguage;
    toLanguage = temp;
    setState(() {});
    // text ko badlane wala code
    String temptext = textController.text;
    textController.text = translatedText;
    translatedText = temptext;
  }

  String translatedText = "";
  String fromLanguage = "en";
  String toLanguage = "hi";
  TextEditingController textController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenwidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text('Translator App'),
        centerTitle: true,
        backgroundColor: Color.fromRGBO(0, 168, 132, 2),

        titleTextStyle: TextStyle(
          fontSize: 23,
          color: Colors.white,

          fontFamily: "Roboto",
          fontWeight: FontWeight.bold,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: screenHeight * 0.02),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 40,

                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Color.fromRGBO(0, 168, 132, 2),
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(5.0),
                    child: DropdownButton(
                      alignment: Alignment.center,
                      value: fromLanguage,
                      iconEnabledColor: Color.fromRGBO(0, 168, 132, 2),
                      focusColor: Theme.of(context).cardColor,
                      dropdownColor: Theme.of(context).canvasColor,
                      iconDisabledColor: Color.fromRGBO(0, 168, 132, 2),
                      items: languages.entries
                          .map(
                            (entry) => DropdownMenuItem(
                              value: entry.value,
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Text(entry.key),
                              ),
                            ),
                          )
                          .toList(),
                      onChanged: (String? value) {
                        setState(() {
                          fromLanguage = value!;
                        });
                      },
                    ),
                  ),
                ),
                SizedBox(width: screenwidth * 0.10),
                IconButton(
                  onPressed: () {
                    swapFunction();
                  },
                  icon: Icon(
                    Icons.swap_horiz,
                    color: Color.fromRGBO(0, 168, 132, 2),
                    size: 30,
                  ),
                ),
                SizedBox(width: screenwidth * 0.10),

                Container(
                  height: 40,

                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Color.fromRGBO(0, 168, 132, 2),
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(5.0),
                    child: DropdownButton(
                      alignment: AlignmentGeometry.center,
                      value: toLanguage,
                      iconEnabledColor: Color.fromRGBO(0, 168, 132, 2),
                      focusColor: Colors.blueGrey,
                      dropdownColor: Theme.of(context).canvasColor,
                      iconDisabledColor: Color.fromRGBO(0, 168, 132, 2),
                      items: languages.entries
                          .map(
                            (entry) => DropdownMenuItem(
                              value: entry.value,
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Text(entry.key),
                              ),
                            ),
                          )
                          .toList(),
                      onChanged: (String? value) {
                        setState(() {
                          toLanguage = value!;
                        });
                      },
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: screenHeight * 0.05),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Uihelper.customText("Enter Your Text --", 25),
                SizedBox(height: screenHeight * 0.02),
                Padding(
                  padding: const EdgeInsets.only(right: 20, left: 20),
                  child: Container(
                    height: screenHeight * .20,
                    width: screenwidth,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Color.fromRGBO(0, 168, 132, 2),
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(
                        top: 5,
                        bottom: 5,
                        left: 5,
                        right: 5,
                      ),
                      child: TextField(
                        controller: textController,

                        maxLines: 10,

                        decoration: InputDecoration(
                          border: UnderlineInputBorder(
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: screenHeight * 0.02),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Uihelper.customButton(
                      buttonName: "Translate",
                      callback: () {
                        tranlateText();
                      },
                    ),
                    SizedBox(width: screenwidth * 0.03),
                    Uihelper.customButton(
                      buttonName: "ClearData",
                      callback: () {
                        setState(() {
                          textController.text = "";
                        });
                      },
                    ),
                  ],
                ),

                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Container(
                    height: screenHeight * 0.10,
                    width: screenwidth,

                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Color.fromRGBO(0, 168, 132, 2),
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Center(
                      child: SelectableText(
                        translatedText,
                        style: TextStyle(fontSize: 17),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
