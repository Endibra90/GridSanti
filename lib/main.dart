import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Grid',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Prueba Grid'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
    void _incrementCounter() {
    setState(() {
      if (_counter == 33) {
        _counter = 33;
      } else {
        _counter++;
      }
    });
  }

  void _decrementCounter() {
    setState(() {
      if (_counter == 0) {
        _counter = 0;
      } else {
        _counter--;
      }
    });
  }

  Widget myWidgets(int contador, int index) {
    if (index % 5 == 0 && index % 3 == 0) {
      return  Container(
              width:300,
              height:300,
              decoration: BoxDecoration(color: Colors.red,border:Border.all(color:Colors.purple,width:2)),
              child:Center(child: Text("FB",style:TextStyle(color: Colors.white),)));
    } else if (index % 5 == 0) {
      return 
          Container(
              width:300,
              height:300,
              decoration: BoxDecoration(color: Colors.green,border:Border.all(color:Colors.purple,width:2)),
              child: Center(child:Text("Book",style:TextStyle(color: Colors.white),)));
    } else if (index % 3 == 0) {
      return 
          Container(
              width:300,
              height:300,
              decoration: BoxDecoration(color: Colors.blue,border:Border.all(color:Colors.purple,width:2)),
              child: Center(child:Text("Face",style:TextStyle(color: Colors.white),)));
    } else {
      return Container(
        width:300,
        height:300,
        decoration: BoxDecoration(color:Colors.black,border:Border.all(color:Colors.purple,width:2)),
        child: Center(child:Text('$index',style:TextStyle(color: Colors.white),))
        );
    }
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
            Padding(
                padding: new EdgeInsets.all(130),
                child: Row(
                  children: [
                    FloatingActionButton(
                      onPressed: () => {_decrementCounter()},
                      child: Text('-', style: TextStyle(fontSize: 20)),
                    ),
                    Text(
                      '$_counter',
                      style: Theme.of(context).textTheme.headline4,
                    ),
                    FloatingActionButton(
                      onPressed: () => {_incrementCounter()},
                      child: Text('+', style: TextStyle(fontSize: 20)),
                    ),
                  ],
                )),
            Container(
                child: Expanded(
                    child: GridView.count(
                        crossAxisCount: 8,
                        children: List.generate(
                          _counter,
                          (index) {
                            return myWidgets(_counter, index + 1);//le paso un +1 porque si no el index empezaria en 0 y no lo iria a la par que el contador
                          },
                        ))))
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
