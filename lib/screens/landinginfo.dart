import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:auto_size_text/auto_size_text.dart';

class LandingPage extends StatefulWidget {
  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        color: Colors.purpleAccent,
        child: Row(children: <Widget>[

        ],)
      ),
      body: Container(
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Image(image: AssetImage('assets/backgroung_image.jpg'),fit: BoxFit.cover,alignment: Alignment.center,),
            Positioned(
              top: 150.0,
              left: 50.0,
              child: Opacity(
                opacity: 0.5,
                child: Container(
                  padding: EdgeInsets.all(20.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.0),
                    color: Colors.white
                  ),
                  width: 250.0,
                  height: 200.0,
                  child: AutoSizeText(
                    'Hey, welcome here this is a sorting visualiser  application that provides you a intiution regarding the different algorithm',
                    style: GoogleFonts.roboto(fontSize: 25.0,color: Colors.black),
                    maxLines: 10,
                  ),
                ),
              )
            ),
            Positioned(
              top: 60.0,
              left: 40.0,
              child: Text('Visualiser',style: GoogleFonts.roboto(fontSize: 30.0,color: Colors.white),),
            ),
            Positioned(
              bottom: 30.0,
              width: 260.0,
              height: 70.0,
              child: Opacity(
                opacity: 0.5,
                child: Card(
                  color: Colors.black,
                  elevation: 10.0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Center(
                        child: FlatButton(
                          onPressed: (){
                            Navigator.pushNamed(context, '/visualizer');
                          },
                          child: Text('Let\'s start',style: GoogleFonts.roboto(fontSize: 30.0,color: Colors.white)),
                        )
                      ),
                      Center(
                        child: Icon(Icons.arrow_forward,color: Colors.white,),
                      )
                    ],
                  ),
                ),
              )
            ),
          ],
        ),
      ),
    );
  }
}