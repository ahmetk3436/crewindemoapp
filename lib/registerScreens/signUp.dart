import 'package:crewindemoproject/services/firebase_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:url_launcher/url_launcher.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController textEditingControllerEmail = TextEditingController();
  final Uri _url = Uri.parse(
      'https://docs.flutter.io/flutter/services/UrlLauncher-class.html');
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
          Padding(
            padding: const EdgeInsets.only(top: 50.0, left: 30, right: 30),
            child: InkWell(
                child: Column(
                  children: const [
                    Text(
                        "Curabitur lobortis id lorem id bibendum. Ut id consectetur magna.  "),
                    Text(
                      "Terms of use augue enim,",
                      style: TextStyle(
                          decoration: TextDecoration.underline,
                          color: Colors.blue),
                    ),
                    Text("pulvinar Privacy Notice lacinia at.",
                        style: TextStyle(
                            decoration: TextDecoration.underline,
                            color: Colors.blue)),
                  ],
                ),
                onTap: () => makeUrl()),
          ),
          continueButton(context)
        ],
      ),
    );
  }

  void makeUrl() async {
    await launchUrl(_url);
  }

  Align continueButton(BuildContext context) {
    changeBackgroundColor();
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
                          MaterialStateProperty.all(backgroundColor)),
                  onPressed: () {
                    if (textEditingControllerPassword.text ==
                        textEditingControllerRePassword.text) {
                      FirebaseAuth firebaseAuth = FirebaseAuth.instance;
                      FirebaseAuthh authhh = FirebaseAuthh();
                      try {
                        authhh.registerFirebase(
                            textEditingControllerEmail.text.toString(),
                            textEditingControllerPassword.text.toString(),
                            context);
                      } catch (e) {
                        Fluttertoast.showToast(msg: e.toString());
                      }
                      if (firebaseAuth.currentUser != null) {
                        Navigator.pushNamed(context, "/name");
                      } else {
                        Fluttertoast.showToast(
                            msg:
                                "Kullanıcı kaydı yapılamadığından devam edilemiyor");
                        Navigator.pushNamedAndRemoveUntil(
                            context, "/home", (route) => false);
                      }
                    } else {
                      Fluttertoast.showToast(msg: "Şifreniz eşleşmemektedir !");
                    }
                  },
                  child: const Center(
                      child: Text(
                    "Continue",
                    style: TextStyle(fontSize: 18),
                  )))),
        ));
  }

  void changeBackgroundColor() {
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
  }

  TextFormField emailFormField(
      String failInput, TextEditingController textEditingController) {
    return TextFormField(
      controller: textEditingController,
      autocorrect: true,
      decoration: InputDecoration(
          filled: true,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: const BorderSide(color: Colors.grey)),
          label: const Text("E-mail"),
          hintText: "abcdefgh@gmail.com"),
      onChanged: (value) {
        changeBackgroundColor();
      },
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
          filled: true,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: const BorderSide(color: Colors.grey)),
          label: const Text("Password"),
          hintText: "123456abcdef"),
      obscureText: obscureText,
      onChanged: (value) {
        changeBackgroundColor();
      },
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
          filled: true,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: const BorderSide(color: Colors.grey)),
          label: const Text("Password"),
          hintText: "123456abcdef"),
      obscureText: obscureText2,
      onChanged: (value) {
        changeBackgroundColor();
      },
    );
  }
}
