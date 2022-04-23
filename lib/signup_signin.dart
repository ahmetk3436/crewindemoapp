import 'package:crewindemoproject/signIn.dart';
import 'package:crewindemoproject/signUp.dart';
import 'package:flutter/material.dart';

class RegisterAndLogin extends StatelessWidget {
  const RegisterAndLogin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return body(context);
  }

  Widget body(BuildContext context) {
    return SizedBox(
      height: 50,
      width: MediaQuery.of(context).size.width,
      child: Card(
        color: Colors.grey,
        shape: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
        child: DefaultTabController(
            length: 2,
            child: Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.white,
                elevation: 0,
                bottom: const TabBar(
                    labelColor: Colors.redAccent,
                    unselectedLabelColor: Colors.white,
                    indicatorSize: TabBarIndicatorSize.label,
                    indicator: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10)),
                        color: Colors.white),
                    tabs: [
                      Tab(
                        child: Align(
                          alignment: Alignment.center,
                          child: Text("Sign Up"),
                        ),
                      ),
                      Tab(
                        child: Align(
                          alignment: Alignment.center,
                          child: Text("Sign In"),
                        ),
                      ),
                    ]),
              ),
              body: const TabBarView(children: <Widget>[
                SignUp(),
                SignIn(),
              ]),
            )),
      ),
    );
  }
}
