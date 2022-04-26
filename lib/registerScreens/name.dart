import 'package:flutter/material.dart';

class Name extends StatelessWidget {
  const Name({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("AD"),
        centerTitle: true,
      ),
      body: body(context),
    );
  }

  Widget body(BuildContext context) {
    String failInput = "Hatalı giriş yaptınız.";
    TextEditingController textEditingController = TextEditingController();
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          const Padding(
            padding: EdgeInsets.only(top: 100.0),
            child: Text(
              "What's Your Name",
              style: TextStyle(fontSize: 20),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 50.0,
              left: 15,
              right: 15,
            ),
            child: nameFormField(failInput, textEditingController),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 100.0, left: 15, right: 15),
            child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, "/signUpDetails",
                          arguments: textEditingController.text.toString());
                    },
                    child: const Text("NEXT"))),
          ),
        ],
      ),
    );
  }
}

TextFormField nameFormField(
    String failInput, TextEditingController textEditingController) {
  return TextFormField(
    controller: textEditingController,
    autocorrect: true,
    decoration: InputDecoration(
        errorText: failInput, label: const Text("Name"), hintText: "Ahmet"),
  );
}
