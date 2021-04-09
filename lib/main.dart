// Annas Aufa 

import 'package:flutter/material.dart';
import './kuis.dart';

void main(){
  runApp(
      new MaterialApp(
        home: new KuisPahlawan(),
      )
  );
}

class KuisPahlawan extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
   return new KuisPahlawanState();
  }
}

class KuisPahlawanState extends State<KuisPahlawan>{
  @override
  Widget build(BuildContext context) {
   return new Scaffold(
     appBar: new AppBar(
       title: new Text("Kuis Pahlawan"),
       backgroundColor: Colors.blue,
     ),


     body: new Container(
          margin: const EdgeInsets.all(15.0),
       child: new Column(
          
         crossAxisAlignment: CrossAxisAlignment.stretch,
         mainAxisAlignment: MainAxisAlignment.center,
         children: <Widget>[

           new MaterialButton(
             height: 50.0,
               color: Colors.green,
               onPressed: startKuis,
               child: new Text("Mulai Kuis",
                 style: new TextStyle(
                     fontSize: 18.0,
                     color: Colors.white
                 ),)
           )
         ],
       ),
     ),


   );
  }

  void startKuis(){
   setState(() {
     Navigator.push(context, new MaterialPageRoute(builder: (context)=> new Kuis()));
   });
  }
}

