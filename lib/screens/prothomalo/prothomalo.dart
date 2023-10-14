import 'package:flutter/material.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class Prothomalo extends StatefulWidget {
  const Prothomalo({Key? key}) : super(key: key);

  @override
  _ProthomaloState createState() => _ProthomaloState();
}

class _ProthomaloState extends State<Prothomalo> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.cyan[600],
          toolbarHeight:35 ,
          // context: context,
          title: const Text("All Newspaper",style: TextStyle(fontSize: 17),
          ),centerTitle: true
      ),
      body: OfflineBuilder(
        connectivityBuilder: (
            BuildContext context,
            ConnectivityResult connectivity,
            Widget child,
            ) {
          final bool connected = connectivity != ConnectivityResult.none;
          return Stack(
            fit: StackFit.expand,
            children: [
              connected? const WebviewScaffold(
                  url: "https://www.allbanglanewspaperbd.com/",
                  ///https://allonlinebanglanewspapers.com/
                  ///https://www.allbdnewspaper.com/
                  ///https://www.allbanglanewspaper.co/
                  ///https://www.allbanglanewspaperbd.com/
                  ///https://www.allbanglanewspaper.co/prothom-alo/
                  initialChild: Center(
                    child: CircularProgressIndicator(),
                  )
              )

                  :Center(
                child: Image.asset(
                  "assets/icons/n1.png",fit: BoxFit.cover,
                ),
              ),

            ],
          );
        },
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'There are no bottoms to push :)',
            ),
            Text(
              'Just turn off your internet.',
            ),
          ],
        ),
      ),
    );
  }
}
