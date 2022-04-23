import 'package:flutter/material.dart';

class SignUp extends StatelessWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String failInput = "Hatalı giriş yapıldı";
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 50.0, right: 10, left: 10),
            child: emailFormField(failInput),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 40.0, right: 10, left: 10),
            child: passwordFormField(failInput),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 40.0, right: 10, left: 10),
            child: rewritePasswordFormField(failInput),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 50.0, left: 30, right: 30),
            child: Text(
                "Curabitur lobortis id lorem id bibendum. Ut id consectetur magna. Terms of use augue enim, pulvinar Privacy Notice lacinia at."),
          ),
          Align(
              heightFactor: 1.2,
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Card(
                    elevation: 8,
                    color: Colors.blue,
                    child: ElevatedButton(
                        onPressed: () {},
                        child: const Center(
                            child: Text(
                          "Continue",
                          style: TextStyle(fontSize: 18),
                        )))),
              ))
        ],
      ),
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

  TextFormField rewritePasswordFormField(String failInput) {
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
