import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  static const String id = "homeScreen";

  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DateTime? selectedDate;
  List<Row> generatedFields = [];
  final TextEditingController numberOfPeopleController =
      TextEditingController();
  final TextEditingController textController =
      TextEditingController(text: "Select date");

  Future<void> selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(9999),
    );

    if (picked != null) {
      setState(() {
        selectedDate = picked;
        textController.value = TextEditingValue(
            text:
                "${selectedDate?.day}/${selectedDate?.month}/${selectedDate?.year}");
      });
    }
  }

  Widget textField(double width, double height,
      [TextAlignVertical? align, TextEditingController? controller]) {
    return SizedBox(
      width: width,
      height: height,
      child: TextField(
        maxLines: null,
        expands: true,
        autofocus: true,
        controller: controller,
        textAlignVertical: align,
        onChanged: (String text) {
          if (controller != null) {
            int? n = int.tryParse(text);
            setState(() {
              n ??= 0;
              generatedFields = [];
              for (var i = 0; i < n!; i++) {
                generatedFields.add(Row(
                  children: [
                    const Padding(padding: EdgeInsets.only(left: 36)),
                    Text(
                      "${i + 1}.",
                      style: const TextStyle(fontFamily: 'Zain', fontSize: 20),
                    ),
                    const Padding(padding: EdgeInsets.only(left: 10)),
                    hintBox("sex"),
                    const Padding(padding: EdgeInsets.only(left: 10, top: 50)),
                    hintBox("age")
                  ],
                ));
              }
            });
          }
        },
        decoration: const InputDecoration(
            border: OutlineInputBorder(),
            contentPadding: EdgeInsets.symmetric(horizontal: 10)),
        textAlign: TextAlign.left,
      ),
    );
  }

  SizedBox hintBox(String hintText) {
    return SizedBox(
      width: 100,
      height: 30,
      child: TextField(
        decoration: InputDecoration(
            hintText: hintText,
            hintStyle: const TextStyle(color: Color.fromRGBO(217, 217, 217, 1)),
            border: const OutlineInputBorder(),
            contentPadding: const EdgeInsets.symmetric(horizontal: 10)),
      ),
    );
  }

  Widget textWithQuestions(String question) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.only(left: 36),
        child: Text(question,
            style: const TextStyle(fontSize: 20, fontFamily: 'Zain')),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: [
          const Padding(padding: EdgeInsets.only(top: 102)),
          textWithQuestions("Where we going?"),
          textField(339, 37),
          const Padding(padding: EdgeInsets.only(top: 20)),
          textWithQuestions("When we going?"),
          SizedBox(
            width: 339,
            height: 37,
            child: GestureDetector(
              onTap: () => selectDate(context),
              child: AbsorbPointer(
                child: TextField(
                  controller: textController,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.symmetric(horizontal: 10)),
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      color: Colors.black, fontSize: 24, fontFamily: 'Zain'),
                ),
              ),
            ),
          ),
          const Padding(padding: EdgeInsets.only(top: 20)),
          textWithQuestions("How long we'll be there?"),
          textField(339, 37),
          const Padding(padding: EdgeInsets.only(top: 20)),
          textWithQuestions("How many people?"),
          textField(339, 37, null, numberOfPeopleController),
          const Padding(padding: EdgeInsets.only(top: 20)),
          Column(children: generatedFields),
          textWithQuestions("What do we want to do there?"),
          textField(339, 105, TextAlignVertical.top),
          const Padding(padding: EdgeInsets.only(top: 20)),
          Align(
              alignment: Alignment.centerRight,
              child: Padding(
                  padding: const EdgeInsets.only(right: 25, bottom: 25),
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: const CircleBorder(),
                          backgroundColor: const Color.fromRGBO(98, 233, 76, 1),
                          minimumSize: const Size(43, 43)),
                      onPressed: () {},
                      child: const Icon(Icons.arrow_forward_ios_rounded))))
        ],
      ),
    ));
  }
}
