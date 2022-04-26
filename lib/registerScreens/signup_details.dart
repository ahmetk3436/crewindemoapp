import 'package:crewindemoproject/services/firebase_service.dart';
import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../model/users.dart';

class SignUpDetails extends StatefulWidget {
  const SignUpDetails({Key? key, required this.name}) : super(key: key);
  final String name;
  @override
  State<SignUpDetails> createState() => _SignUpDetailsState();
}

class _SignUpDetailsState extends State<SignUpDetails> {
  final _controller = PageController(viewportFraction: 0.8, keepPage: true);
  final FirebaseAuthh authh = FirebaseAuthh();
  Color femaleColor = Colors.grey;
  Color maleColor = Colors.grey;
  String userGender = "";
  int activeIndex = 0;
  int _currentAge = 18;
  int _currentWeight = 50;
  int _currentHeight = 150;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("KAYDOL"),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 500,
                child: PageView.builder(
                  controller: _controller,
                  itemCount: 4,
                  itemBuilder: (context, index) {
                    switch (index) {
                      case 0:
                        return pages1();
                      case 1:
                        return pages2();
                      case 2:
                        return pages3();
                      case 3:
                        return pages4();
                      default:
                        return pages1();
                    }
                  },
                  onPageChanged: (index) {
                    setState(() {
                      activeIndex = index;
                    });
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: ElevatedButton(
                        onPressed: () {
                          if (activeIndex == 3) {
                            userDetails.add(UserDetails(
                                name: widget.name,
                                height: _currentHeight,
                                weight: _currentWeight,
                                age: _currentAge,
                                gender: userGender));
                            authh.updateFirestore(widget.name, userGender,
                                _currentHeight, _currentWeight, _currentAge);
                            Navigator.pushNamedAndRemoveUntil(
                                context, "/mainMenu", (route) => false);
                          } else {
                            _controller.nextPage(
                                duration: const Duration(milliseconds: 500),
                                curve: Curves.ease);
                          }
                        },
                        child: const Text("NEXT"))),
              ),
              Padding(
                  padding: const EdgeInsets.only(bottom: 15.0),
                  child: SmoothPageIndicator(
                    controller: _controller,
                    count: 4,
                    effect: const WormEffect(),
                    onDotClicked: (index) {},
                  )),
            ],
          ),
        ),
      ),
    );
  }

  Widget pages1() {
    return Padding(
      padding: const EdgeInsets.only(top: 100.0),
      child: Column(
        children: [
          const Text(
            "What is your sex ?",
            style: TextStyle(fontSize: 20),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 50.0),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 5.0),
                  child: Column(
                    children: [
                      Card(
                        elevation: 8,
                        child: IconButton(
                          color: maleColor,
                          iconSize: 100,
                          icon: const Icon(
                            Icons.male,
                            size: 100,
                          ),
                          onPressed: () {
                            setState(() {
                              userGender = "MALE";
                              femaleColor = Colors.grey;
                              maleColor = Colors.black;
                            });
                          },
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 8.0),
                        child: Text("MALE"),
                      ),
                    ],
                  ),
                ),
                Column(
                  children: [
                    Card(
                      elevation: 8,
                      child: IconButton(
                        color: femaleColor,
                        iconSize: 100,
                        icon: const Icon(
                          Icons.female,
                        ),
                        onPressed: () {
                          setState(() {
                            userGender = "FEMALE";
                            femaleColor = Colors.black;
                            maleColor = Colors.grey;
                          });
                        },
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 8.0),
                      child: Text("FEMALE"),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget pages2() {
    return Padding(
      padding: const EdgeInsets.only(top: 100.0),
      child: Column(
        children: <Widget>[
          NumberPicker(
            itemHeight: 100,
            value: _currentAge,
            minValue: 0,
            maxValue: 100,
            onChanged: (value) {
              setState(() {
                _currentAge = value;
              });
            },
          ),
          Text(
            'Yaşınız : $_currentAge',
            style: const TextStyle(fontSize: 20),
          ),
        ],
      ),
    );
  }

  Widget pages3() {
    return Padding(
      padding: const EdgeInsets.only(top: 100.0),
      child: Column(
        children: <Widget>[
          NumberPicker(
            itemHeight: 100,
            value: _currentWeight,
            minValue: 0,
            maxValue: 250,
            onChanged: (value) => {
              setState(() {
                _currentWeight = value;
              })
            },
          ),
          Text('Kilonuz : $_currentWeight',
              style: const TextStyle(fontSize: 20)),
        ],
      ),
    );
  }

  Widget pages4() {
    return Padding(
      padding: const EdgeInsets.only(top: 100.0),
      child: Column(
        children: <Widget>[
          NumberPicker(
            itemHeight: 100,
            value: _currentHeight,
            minValue: 0,
            maxValue: 250,
            onChanged: (value) => {
              setState(() {
                _currentHeight = value;
              })
            },
          ),
          Text('Boyunuz : $_currentHeight',
              style: const TextStyle(fontSize: 20)),
        ],
      ),
    );
  }
}
