import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class MainMenu extends StatelessWidget {
  const MainMenu({Key? key}) : super(key: key);

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
    return Center(
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 8.0, left: 10, right: 10),
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Card(
                color: Colors.blueAccent.shade200,
                elevation: 8,
                child: Center(
                    child: CachedNetworkImage(
                  imageUrl: "https://i.hizliresim.com/P1lgVQ.gif",
                  placeholder: (context, url) => CircularProgressIndicator(),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                )),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0, left: 10, right: 10),
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Card(
                color: Colors.blueAccent.shade200,
                elevation: 8,
                child: Center(
                    child: CachedNetworkImage(
                  imageUrl: "https://i.hizliresim.com/P1lgVQ.gif",
                  placeholder: (context, url) => CircularProgressIndicator(),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                )),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0, left: 10, right: 10),
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Card(
                color: Colors.blueAccent.shade200,
                elevation: 8,
                child: Center(
                    child: CachedNetworkImage(
                  imageUrl: "https://i.hizliresim.com/P1lgVQ.gif",
                  placeholder: (context, url) => CircularProgressIndicator(),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                )),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0, left: 10, right: 10),
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Card(
                color: Colors.blueAccent.shade200,
                elevation: 8,
                child: Center(
                    child: CachedNetworkImage(
                  imageUrl: "https://i.hizliresim.com/P1lgVQ.gif",
                  placeholder: (context, url) => CircularProgressIndicator(),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                )),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
