import 'package:flutter/material.dart';

class SignIn extends StatelessWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String failInput = "Hatalı giriş yapıldı";

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 40.0, right: 10, left: 10),
          child: emailFormField(failInput),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 40.0, right: 10, left: 10),
          child: passwordFormField(failInput),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, "/resetPassword");
            },
            child: const Text(
              "Forgot Password ?",
              style: TextStyle(
                  fontSize: 18,
                  color: Colors.blue,
                  letterSpacing: 1.5,
                  decoration: TextDecoration.underline,
                  decorationThickness: 1),
              textAlign: TextAlign.center,
            ),
          ),
        )
      ],
    );
  }

  TextFormField emailFormField(String failInput) {
    return TextFormField(
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

  TextFormField passwordFormField(String failInput) {
    return TextFormField(
      autocorrect: true,
      decoration: InputDecoration(
          errorText: failInput,
          filled: true,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: const BorderSide(color: Colors.grey)),
          label: const Text("Password"),
          hintText: "123456abcdef"),
    );
  }
}
