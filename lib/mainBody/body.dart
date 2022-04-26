import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);
  final TextStyle style =
      const TextStyle(fontStyle: FontStyle.italic, fontSize: 18);
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          makeImage(),
          appDescription(),
          continueWithEmail(context),
          continueWithoutSigningUp(),
        ],
      ),
    );
  }

  Align continueWithoutSigningUp() {
    return Align(
      heightFactor: 2,
      alignment: Alignment.bottomCenter,
      child: Card(
        elevation: 8,
        color: Colors.cyan,
        child: ElevatedButton(
            onPressed: () {},
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.cyan),
            ),
            child: Text("Continue Without Signing Up", style: style)),
      ),
    );
  }

  Padding continueWithEmail(BuildContext context) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          elevation: 8,
          color: Colors.cyan,
          child: ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, "/signinsignup");
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.cyan),
              ),
              child: Text("Continue With E-mail", style: style)),
        ),
      );

  Padding appDescription() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 8,
        shape: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.0),
            borderSide: BorderSide.none),
        color: Colors.greenAccent,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            'What is a Fitness App? Fitness apps are applications designed by companies to keep you fit and healthy. These apps can be downloaded on mobile phones quite easily. The aim of these apps is to make your lifestyle healthier by tracking your food intake, water intake and workout pattern.',
            style: style,
          ),
        ),
      ),
    );
  }

  Padding makeImage() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: CachedNetworkImage(
          imageUrl:
              "https://img2.storyblok.com/1440x0/filters:format(webp)/f/47007/2401x1261/48ac03313d/2020-03_fitnessapp-marketingplan_card.png",
          placeholder: (context, url) => const CircularProgressIndicator(),
          errorWidget: (context, url, error) => const Icon(Icons.error)),
    );
  }
}
