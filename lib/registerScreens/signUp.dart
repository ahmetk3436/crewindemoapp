import 'package:crewindemoproject/services/firebase_service.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController textEditingControllerEmail = TextEditingController();

  TextEditingController textEditingControllerPassword = TextEditingController();

  TextEditingController textEditingControllerRePassword =
      TextEditingController();
  bool obscureText = true;
  bool obscureText2 = true;
  Color backgroundColor = Colors.grey;
  @override
  Widget build(BuildContext context) {
    String failInput = "Hatalı giriş yapıldı";
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 50.0, right: 10, left: 10),
            child: emailFormField(failInput, textEditingControllerEmail),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 40.0, right: 10, left: 10),
            child: passwordFormField(failInput, textEditingControllerPassword),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 40.0, right: 10, left: 10),
            child: rewritePasswordFormField(
                failInput, textEditingControllerRePassword),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 50.0, left: 30, right: 30),
            child: Text(
                "Curabitur lobortis id lorem id bibendum. Ut id consectetur magna. Terms of use augue enim, pulvinar Privacy Notice lacinia at."),
          ),
          continueButton(context)
        ],
      ),
    );
  }

  Align continueButton(BuildContext context) {
    return Align(
        heightFactor: 1.2,
        alignment: Alignment.bottomCenter,
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Card(
              elevation: 8,
              color: backgroundColor,
              child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(changeBackgroundColor())),
                  onPressed: () {
                    FirebaseAuthh authhh = FirebaseAuthh();
                    authhh.registerFirebase(
                        textEditingControllerEmail.text.toString(),
                        textEditingControllerPassword.text.toString(),
                        context);
                    Navigator.pushNamed(context, "/name");
                  },
                  child: const Center(
                      child: Text(
                    "Continue",
                    style: TextStyle(fontSize: 18),
                  )))),
        ));
  }

  Color changeBackgroundColor() {
    if ((textEditingControllerEmail.text.toString().isNotEmpty &&
        textEditingControllerPassword.text.toString().isNotEmpty &&
        textEditingControllerRePassword.text.toString().isNotEmpty)) {
      setState(() {
        backgroundColor = Colors.blue;
      });
    } else {
      setState(() {
        backgroundColor = Colors.grey;
      });
    }
    return backgroundColor;
  }

  TextFormField emailFormField(
      String failInput, TextEditingController textEditingController) {
    return TextFormField(
      controller: textEditingController,
      autocorrect: true,
      decoration: InputDecoration(
          errorText: failInput,
          filled: true,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: const BorderSide(color: Colors.grey)),
          label: const Text("E-mail"),
          hintText: "abcdefgh@gmail.com"),
    );
  }

  TextFormField passwordFormField(
      String failInput, TextEditingController textEditingController) {
    return TextFormField(
      controller: textEditingControllerPassword,
      autocorrect: true,
      decoration: InputDecoration(
          suffixIcon: IconButton(
            icon: Icon(
              obscureText ? Icons.visibility : Icons.visibility_off,
            ),
            onPressed: () {
              setState(() {
                obscureText = !obscureText;
              });
            },
          ),
          errorText: failInput,
          filled: true,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: const BorderSide(color: Colors.grey)),
          label: const Text("Password"),
          hintText: "123456abcdef"),
      obscureText: obscureText,
    );
  }

  TextFormField rewritePasswordFormField(
      String failInput, TextEditingController textEditingController) {
    return TextFormField(
      controller: textEditingControllerRePassword,
      autocorrect: true,
      decoration: InputDecoration(
          suffixIcon: IconButton(
            icon: Icon(
              obscureText2 ? Icons.visibility : Icons.visibility_off,
            ),
            onPressed: () {
              setState(() {
                obscureText2 = !obscureText2;
              });
            },
          ),
          errorText: failInput,
          filled: true,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: const BorderSide(color: Colors.grey)),
          label: const Text("Password"),
          hintText: "123456abcdef"),
      obscureText: obscureText2,
    );
  }
}
