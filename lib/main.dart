import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:navigation/arguments.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: "/",
      routes: {
        HomePage.routeName: (context) => HomePage(),
        _FirstPage.routeName: (context) => _FirstPage(),
        _SecondPage.routeName: (context) => _SecondPage(),
      },
    );
  }
}

class HomePage extends StatefulWidget {
  static const routeName = "/";

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              child: Text("First Page"),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => _FirstPage(),
                    settings: RouteSettings(
                      arguments: Arguments("First Page", "This is First Page."),
                    ),
                  ),
                );
              },
            ),
            RaisedButton(
              child: Text("Second Page"),
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  _SecondPage.routeName,
                  arguments: Arguments("Second Page", "This is Second Page."),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}

class _FirstPage extends StatelessWidget {
  static const routeName = "/first";

  @override
  Widget build(BuildContext context) {
    final Arguments args = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text(args.title),
      ),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(args.message),
            RaisedButton(
                child: Text("Back"),
                onPressed: () {
                  Navigator.pop(context);
                }),
          ],
        ),
      ),
    );
  }
}

class _SecondPage extends StatelessWidget {
  static const routeName = "/second";

  @override
  Widget build(BuildContext context) {
    final Arguments args = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text(args.title),
      ),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(args.message),
            RaisedButton(
                child: Text("Back"),
                onPressed: () {
                  Navigator.pop(context);
                }),
          ],
        ),
      ),
    );
  }
}
