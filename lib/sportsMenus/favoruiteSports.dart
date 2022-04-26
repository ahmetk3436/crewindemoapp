import 'package:cached_network_image/cached_network_image.dart';
import 'package:crewindemoproject/model/links.dart';
import 'package:flutter/material.dart';

class FavouriteSports extends StatefulWidget {
  const FavouriteSports({Key? key}) : super(key: key);

  @override
  State<FavouriteSports> createState() => _FavouriteSportsState();
}

class _FavouriteSportsState extends State<FavouriteSports> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("SPOR YAPMA ZAMANI"),
        centerTitle: true,
      ),
      body: body(context),
    );
  }

  Widget body(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: Card(
          color: Colors.blueAccent.shade200,
          elevation: 8,
          child: makeList(favourites),
        ),
      ),
    );
  }

  Widget makeList(List<Favourites> favouriteList) {
    if (favouriteList.isNotEmpty) {
      return ListView.builder(
        shrinkWrap: true,
        itemCount: favouriteList.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              elevation: 8,
              color: Colors.lime,
              child: Dismissible(
                direction: DismissDirection.endToStart,
                key: UniqueKey(),
                onDismissed: (_) {
                  favouriteList.removeAt(index);
                },
                child: Column(
                  children: [
                    ListTile(
                      title: CachedNetworkImage(
                        imageUrl: favouriteList[index].url,
                        placeholder: (context, url) =>
                            const CircularProgressIndicator(),
                        errorWidget: (context, url, error) =>
                            const Icon(Icons.error),
                      ),
                    ),
                    Text(
                      favouriteList[index].explanation,
                      style: const TextStyle(fontSize: 20),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      );
    } else {
      return const Center(
        child: Text(
          "FAVORİLERİNİZ BOŞ",
          style: TextStyle(fontSize: 25),
        ),
      );
    }
  }
}
