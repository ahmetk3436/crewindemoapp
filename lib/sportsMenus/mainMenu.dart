import 'package:cached_network_image/cached_network_image.dart';
import 'package:crewindemoproject/model/links.dart';
import 'package:favorite_button/favorite_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MainMenu extends StatefulWidget {
  const MainMenu({Key? key}) : super(key: key);

  @override
  State<MainMenu> createState() => _MainMenuState();
}

class _MainMenuState extends State<MainMenu> {
  final FirebaseAuth auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("SPOR YAPMA ZAMANI"),
        centerTitle: true,
        actions: [
          PopupMenuButton<int>(
            onSelected: (value) => makeFunction(context, value),
            itemBuilder: (context) => [
              const PopupMenuItem(
                child: Text("Favoriler"),
                value: 0,
              ),
              const PopupMenuItem(
                child: Text("Çıkış Yap"),
                value: 1,
              ),
            ],
          ),
        ],
      ),
      body: body(context),
    );
  }

  void makeFunction(BuildContext context, int value) {
    switch (value) {
      case 0:
        Navigator.pushNamed(context, "/favourites");
        break;
      case 1:
        auth.signOut();
        Navigator.pushNamedAndRemoveUntil(context, "/home", (route) => false);
        break;
      default:
    }
  }

  Widget body(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: Card(
          color: Colors.blueAccent.shade200,
          elevation: 8,
          child: makeList(url, explanation),
        ),
      ),
    );
  }

  ListView makeList(List<String> url, List<String> explanation) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: url.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            elevation: 8,
            color: Colors.lime,
            child: Column(
              children: [
                ListTile(
                  title: CachedNetworkImage(
                    imageUrl: url[index],
                    placeholder: (context, url) =>
                        const CircularProgressIndicator(),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                  ),
                  subtitle: FavoriteButton(
                    valueChanged: (value) {
                      setState(() {
                        isFavourite[index] = value;
                        if (isFavourite[index]) {
                          favourites.add(Favourites(
                              url: url[index],
                              explanation: explanation[index]));
                        }
                      });
                    },
                    isFavorite: isFavourite[index],
                  ),
                ),
                Text(
                  explanation[index],
                  style: const TextStyle(fontSize: 20),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
