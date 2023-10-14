import 'package:flutter/material.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class MovieServer extends StatefulWidget {
  const MovieServer({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MovieServer> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.cyan[600],
          toolbarHeight:35 ,
          // context: context,
          title: const Text("MOVIE SERVER",style: TextStyle(fontSize: 17),
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
                  url: "https://bongobd.com/",
                  initialChild: Center(
                    child: CircularProgressIndicator(),
                  ))

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
              'There are no bottons to push :)',
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

///url: "https://bongobd.com/",
///MOVIE SERVER

