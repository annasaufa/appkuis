import 'package:flutter/material.dart';


var finalScore = 0;
var pertanyaanNomer = 0;
var kuis = new KuisPahlawan();

class KuisPahlawan{
  var images = [
    "diponegoro", "soekarno", "hatta", "sudirman"
  ];


  var pertanyaan = [
    "Salah satu pejuang pahlawan indonesia yang menggunakan strategi taktik gerilya pada penjajah",
    "Bapak Proklamasi Indonesia sekaligus presiden pertama Indonesia",
    "Ir. Soekarno Mengumumkan proklamasi kemerdekaan bersama dengan beliau",
    "Walaupun dengan penyakit paru beliau tetap berdiri memimpin pasukan dengan gagah berani walapun harus di tandu.",
  ];


  var pilihan = [
    ["Pangeran Diponegoro", "Sultan Agung", "Antasari", "Imam Bonjol"],
    ["Pattimura", "Ir. Soekarno", "Soeharto", "BJ. Habibie"],
    ["Muh. Yamin", "Soeharto", "Bung Hatta", "Sayuti Melik"],
    ["Jend. Katamso", "Jend. Ahmad Y.", "Soeharto", "Jend. Sudirman"]
  ];


  var jawabanBenar = [
    "Pangeran Diponegoro", "Ir. Soekarno", "Bung Hatta", "Jend. Sudirman"
  ];
}

class Kuis extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return new KuisState();
  }
}

class KuisState extends State<Kuis> {
  @override
  Widget build(BuildContext context) {
    return new WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(

          body: new Container(
            margin: const EdgeInsets.all(10.0),
            alignment: Alignment.topCenter,
            child: new Column(
              children: <Widget>[
                new Padding(padding: EdgeInsets.all(20.0)),

                new Container(
                  alignment: Alignment.centerRight,
                  child: new Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[

                      new Text("Question ${pertanyaanNomer + 1} of ${kuis.pertanyaan.length}",
                        style: new TextStyle(
                            fontSize: 18.0
                        ),),

                      new Text("Score: $finalScore",
                        style: new TextStyle(
                            fontSize: 18.0
                        ),)
                    ],
                  ),
                ),

                //image
                new Padding(padding: EdgeInsets.all(10.0)),

                // Meload image dari array images
                new Image.asset(
                  "images/${kuis.images[pertanyaanNomer]}.jpg",
                ),

                new Padding(padding: EdgeInsets.all(10.0)),

                new Text(kuis.pertanyaan[pertanyaanNomer],
                  style: new TextStyle(
                    fontSize: 18.0,
                  ),),

                new Padding(padding: EdgeInsets.all(10.0)),

                new Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[

                    //button 1
                    new MaterialButton(
                      minWidth: 120.0,
                      color: Colors.blueGrey,
                      onPressed: (){
                        if(kuis.pilihan[pertanyaanNomer][0] == kuis.jawabanBenar[pertanyaanNomer]){
                          debugPrint("Correct");
                          finalScore++;
                        }else{
                          debugPrint("Wrong");
                        }
                        updateQuestion();
                      },
                      child: new Text(kuis.pilihan[pertanyaanNomer][0],
                        style: new TextStyle(
                            fontSize: 18.0,
                            color: Colors.white
                        ),),
                    ),

                    //button 2
                    new MaterialButton(
                      minWidth: 120.0,
                      color: Colors.blueGrey,
                      onPressed: (){

                        if(kuis.pilihan[pertanyaanNomer][1] == kuis.jawabanBenar[pertanyaanNomer]){
                          debugPrint("Correct");
                          finalScore++;
                        }else{
                          debugPrint("Wrong");
                        }
                        updateQuestion();
                      },
                      child: new Text(kuis.pilihan[pertanyaanNomer][1],
                        style: new TextStyle(
                            fontSize: 18.0,
                            color: Colors.white
                        ),),
                    ),

                  ],
                ),

                new Padding(padding: EdgeInsets.all(10.0)),

                new Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[

                    //button 3
                    new MaterialButton(
                      minWidth: 120.0,
                      color: Colors.blueGrey,
                      onPressed: (){

                        if(kuis.pilihan[pertanyaanNomer][2] == kuis.jawabanBenar[pertanyaanNomer]){
                          debugPrint("Correct");
                          finalScore++;
                        }else{
                          debugPrint("Wrong");
                        }
                        updateQuestion();
                      },
                      child: new Text(kuis.pilihan[pertanyaanNomer][2],
                        style: new TextStyle(
                            fontSize: 18.0,
                            color: Colors.white
                        ),),
                    ),

                    //button 4
                    new MaterialButton(
                      minWidth: 120.0,
                      color: Colors.blueGrey,
                      onPressed: (){

                        if(kuis.pilihan[pertanyaanNomer][3] == kuis.jawabanBenar[pertanyaanNomer]){
                          debugPrint("Correct");
                          finalScore++;
                        }else{
                          debugPrint("Wrong");
                        }
                        updateQuestion();
                      },
                      child: new Text(kuis.pilihan[pertanyaanNomer][3],
                        style: new TextStyle(
                            fontSize: 18.0,
                            color: Colors.white
                        ),),
                    ),

                  ],
                ),

                new Padding(padding: EdgeInsets.all(15.0)),

                new Container(
                  alignment: Alignment.bottomCenter,
                  child:  new MaterialButton(
                      minWidth: 240.0,
                      height: 30.0,
                      color: Colors.red,
                      onPressed: resetkuis,
                      child: new Text("Quit",
                        style: new TextStyle(
                            fontSize: 18.0,
                            color: Colors.white
                        ),)
                  )
                ),
              ],
            ),
          ),
      )
    );
  }

  void resetkuis(){
    setState(() {
      Navigator.pop(context);
      finalScore = 0;
      pertanyaanNomer = 0;
    });
  }

  void updateQuestion(){
    setState(() {
      if(pertanyaanNomer == kuis.pertanyaan.length - 1){
        Navigator.push(context, new MaterialPageRoute(builder: (context)=> new Summary(score: finalScore,)));

      }else{
        pertanyaanNomer++;
      }
    });
  }
}

class Summary extends StatelessWidget{
  final int score;
  Summary({Key key, @required this.score}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(

        body: new Container(
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[

              new Text("Skor Akhir: $score",
                style: new TextStyle(
                    fontSize: 35.0
                ),),

              new Padding(padding: EdgeInsets.all(30.0)),

              new MaterialButton(
                color: Colors.red,
                onPressed: (){
                  pertanyaanNomer = 0;
                  finalScore = 0;
                  Navigator.pop(context);
                },
                child: new Text("Reset kuis",
                  style: new TextStyle(
                      fontSize: 20.0,
                      color: Colors.white
                  ),),)

            ],
          ),
        ),

      ),
    );
  }
}