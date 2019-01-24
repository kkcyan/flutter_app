import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

import 'package:flutter/rendering.dart';

import 'dart:async' show Future;
import 'package:flutter/services.dart' show rootBundle;

import 'package:flutter_app/state_y.dart';
import 'package:flutter_app/image_y.dart';
import 'package:flutter_app/switch_y.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

Future<String> loadAsset() async {
  return await rootBundle.loadString('assets/config.json');
}
class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}
class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  final String worldPair = WordPair.random().toString();
  void _incrementCounter() {
    setState(() {

      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        title: Text(widget.title),
      ),
      body: Center(
        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.display1,
            ),

            Text(
              '$worldPair' * 5,
              style: Theme.of(context).textTheme.display1,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              textScaleFactor: 0.8,
            ),

          RaisedButton(
            child: Text("normal"),
            onPressed: () => {},
          ),

            FlatButton(onPressed: (){
              Navigator.push(context, new MaterialPageRoute(builder: (context){
                return new NewRoute();
              }));
            },
              child: Text('open new route'),
              color: Colors.blue,
              splashColor: Colors.red,
            ),

            OutlineButton(
              child: Text("open new image"),
              onPressed: (){
                Navigator.push(context, new MaterialPageRoute(builder: (context){
                  return new ImageDart();
                }));
              },
            ),

            IconButton(
              icon: Icon(Icons.thumb_up),
              color: Colors.blue,
              onPressed: () => {},
            ),


            RaisedButton(
              color: Colors.blue,
              highlightColor: Colors.blue[700],
              colorBrightness: Brightness.dark,
              splashColor: Colors.red,
              child: Text("open switch"),
              shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
              onPressed: (){
                Navigator.push(context, new MaterialPageRoute(builder: (context){
                  return new SwitchDart();
                }));
              },
            ),

            
            FlatButton(onPressed: (){
//              debugDumpLayerTree();
//              debugDumpRenderTree();
//              debugDumpApp();
            },
              child: Text('click debug dumn btn'),
            ),

          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
class NewRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    //移除计数器
    //return CounterWidget();
    //随便返回一个Text()
//    return Text("xxx");

  return Scaffold(
    appBar: AppBar(
      title: Text('New Route'),
    ),
    body: ParentWidgetC(),
//    body: ParentWidget(),
//    body: TapboxA(),
  );
//    return Image.asset('images/img_3.jpeg');
//    return new DecoratedBox(
//      decoration: new BoxDecoration(
//        image: new DecorationImage(
//          image: new AssetImage('images/img_3.jpeg'),
//        ),
//      ),
//    );
  }
}


class CounterWidget extends StatefulWidget {
  const CounterWidget({
    Key key,
    this.initValue: 0
  });

  final int initValue;

  @override
  _CounterWidgetState createState() => new _CounterWidgetState();
}

class _CounterWidgetState extends State<CounterWidget> {
  int _counter;

  @override
  void initState() {
    super.initState();
    //初始化状态
    _counter=widget.initValue;
//    print('initState');
  }

  @override
  Widget build(BuildContext context) {
//    print("build");
    return Center(
      child: FlatButton(
        child: Text('$_counter'),
        //点击后计数器自增
        onPressed:()=>setState(()=> ++_counter) ,
      ),
    );
  }

  @override
  void didUpdateWidget(CounterWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
//    print("didUpdateWidget");
  }

  @override
  void deactivate() {
    super.deactivate();
//    print("deactive");
  }

  @override
  void dispose() {
    super.dispose();
//    print("dispose");
  }

  @override
  void reassemble() {
    super.reassemble();
//    print("reassemble");
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
//    print("didChangeDependencies");
  }

}