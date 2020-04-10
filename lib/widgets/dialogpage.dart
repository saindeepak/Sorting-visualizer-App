import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sortingalgorithms_visualizer/services/providernotifer.dart';

int val = 0;
String algoname = 'Bubble';
int p=0;


class ChangeAlgo extends StatelessWidget {
  static TextEditingController _tileslength = TextEditingController();
  static TextEditingController _speed = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final parachange = Provider.of<UpdateLength>(context);
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18.0),
      ),
      child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18.0),
            color: Colors.lightBlue[100],
          ),
          padding: EdgeInsets.all(2.0),
          height: 550.0,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(18.0),
                    color: Colors.blueGrey,
                  ),
                  child: Container(
                    padding: EdgeInsets.all(8.0),
                    child: SingleChildScrollView(
                      padding: EdgeInsets.all(4.0),
                      child:  Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15.0),
                            color: Colors.lightBlue[100],
                            shape: BoxShape.rectangle,
                          ),
                          child: TextField(
                            controller: _tileslength,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              hintText: 'Length(0-300)',
                              contentPadding:
                                  EdgeInsets.symmetric(horizontal: 50.0),
                            ),
                          ),
                        ),
                        Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15.0),
                            color: Colors.lightBlue[100],
                            shape: BoxShape.rectangle,
                          ),
                          child: TextField(
                            controller: _speed,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              hintText: 'Speed(1-100)millisec',
                              contentPadding:
                                  EdgeInsets.symmetric(horizontal: 50.0),
                            ),
                          ),
                        ),
                      ],
                    ),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: Stack(
                  children: <Widget>[
                    ListView(
                      padding: EdgeInsets.all(2.0),
                      physics: AlwaysScrollableScrollPhysics(),
                      children: <Widget>[
                        ChooseAlgo('Bubble',parachange.sele),
                        ChooseAlgo('Selection',parachange.sele),
                        ChooseAlgo('Insertion',parachange.sele),
                        ChooseAlgo('Merge',parachange.sele),
                        ChooseAlgo('Quick',false),
                        ChooseAlgo('Heap',false),
                        ChooseAlgo('PigeonHole',false),
                        ChooseAlgo('Shell',false),
                        ChooseAlgo('Wave',parachange.sele),
                        ChooseAlgo('Bucket',false),
                        ChooseAlgo('Counting',false),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Align(
                        alignment: Alignment.bottomRight,
                        child: RaisedButton(
                            elevation: 5.0,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0)),
                            color: Colors.black,
                            child: Text(
                              'submit!',
                              style: TextStyle(color: Colors.lightBlue[100]),
                            ),
                            onPressed: () {
                              Provider.of<UpdateLength>(context, listen: false)
                                  .updatelen(int.parse(_tileslength.text));
                              Provider.of<UpdateLength>(context, listen: false)
                                  .updatespeed(int.parse(_speed.text));
                              Provider.of<UpdateLength>(context, listen: false)
                                  .algochoosed(val, algoname);
                              Navigator.of(context).pop();
                            }),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )),
    );
  }
}

class ChooseAlgo extends StatelessWidget {
  final String title;
  final bool select;

  _choosepara(){
    algoname = title;
    if (title == 'Bubble') {
      val = 0;
    } else if (title == 'Selection') {
      val = 1;
    } else if (title == 'Insertion') {
      val = 2;
    } else if (title == 'Merge') {
      val = 3;
    } else if (title == 'Quick') {
      val = 8;
    } else if (title == 'Heap') {
      val = 5;
    } else if (title == 'PigeonHole') {
      val = 6;
    } else if (title == 'Shell') {
      val = 7;
    } else if (title == 'Wave') {
      val = 4;
    } else if (title == 'Bucket') {
      val = 9;
    } else if (title == 'Counting') {
      val = 10;
    }
  }


  ChooseAlgo(this.title,this.select);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18.0),
        color: Colors.lightBlue[100],
      ),
      child: ListTile(
          onTap: _choosepara,
          title: Text(title,
              style: GoogleFonts.roboto(
                fontSize: 16.0,
                color: select?Colors.brown:Colors.black,
                fontWeight:
                    FontWeight.lerp(FontWeight.w400, FontWeight.w500, 2.0),
              ))),
    );
  }
}
