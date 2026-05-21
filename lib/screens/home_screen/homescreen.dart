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
  bool isLoading = false;
  final translator = GoogleTranslator();

  Future tranlateText() async {
    if (textController.text.trim().isEmpty) return;
    try {
      var translation = await translator.translate(
        textController.text,
        from: fromLanguage,
        to: toLanguage,
      );
      setState(() {
        translatedText = translation.text;
        isLoading = false;
      });
    } catch (error) {
      setState(() {
        isLoading = false;
      });
      if (mounted) {
        ScaffoldMessenger.of(context).clearSnackBars();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              "You Are Offline Please Check Your Internet Connection",
              style: TextStyle(fontFamily: "Roboto"),
            ),
            duration: Duration(seconds: 2),
            backgroundColor: Colors.red.shade400,
            behavior: SnackBarBehavior.floating,
            elevation: 2.0,

            action: SnackBarAction(
              label: "Retry",
              textColor: Colors.white,

              onPressed: () {
                tranlateText();
              },
            ),
          ),
        );
      }
    }
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

                  child: TextField(
                    controller: textController,
                    showCursor: true,
                    cursorHeight: 18,
                    maxLength: 1000,

                    maxLines: 10,

                    decoration: InputDecoration(
                      fillColor: Colors.grey.shade200,
                      filled: true,
                      isDense: true,
                      contentPadding: EdgeInsets.all(8),
                      suffixIcon: textController.text.isNotEmpty
                          ? IconButton(
                              onPressed: () {
                                textController.clear();
                                setState(() {
                                  translatedText = "";
                                });
                              },
                              icon: Icon(Icons.clear),
                            )
                          : null,
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color.fromRGBO(0, 168, 132, 2),
                          width: 3,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color.fromRGBO(0, 168, 132, 2),
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color.fromRGBO(0, 168, 132, 2),
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(10),
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
                        isLoading = true;
                        setState(() {});
                      },
                    ),
                    SizedBox(width: screenwidth * 0.03),
                    Uihelper.customButton(
                      buttonName: "ClearData",
                      callback: () {
                        setState(() {
                          // textController.text = "";
                          textController.clear();
                          translatedText = "";
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
                      child: isLoading
                          ? CircularProgressIndicator()
                          : SelectableText(
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
