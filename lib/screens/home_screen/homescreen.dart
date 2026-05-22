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

  Future translateText() async {
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
        Uihelper.commonToast(
          context,
          data: "You Are Offline Please Check Your Internet Connection",
          labelName: "Retry",
          callback: () {
            translateText();
          },
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
        backgroundColor: Uihelper.customColor(),

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
                Uihelper.customDropdown(
                  disablecolor: Uihelper.customColor(),
                  enablecolor: Uihelper.customColor(),

                  initialvalue: fromLanguage,
                  mapdata: languages,
                  onchanged: (String? value) {
                    setState(() {
                      fromLanguage = value!;
                    });
                  },
                ),

                SizedBox(width: screenwidth * 0.10),
                IconButton(
                  onPressed: () {
                    swapFunction();
                  },
                  icon: Icon(
                    Icons.swap_horiz,
                    color: Uihelper.customColor(),
                    size: 30,
                  ),
                ),
                SizedBox(width: screenwidth * 0.10),

                Uihelper.customDropdown(
                  disablecolor: Uihelper.customColor(),
                  enablecolor: Uihelper.customColor(),

                  initialvalue: toLanguage,
                  mapdata: languages,
                  onchanged: (String? value) {
                    setState(() {
                      toLanguage = value!;
                    });
                  },
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
                          color: Uihelper.customColor(),
                          width: 3,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Uihelper.customColor(),
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Uihelper.customColor(),
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
                        translateText();
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
                        color: Uihelper.customColor(),
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
