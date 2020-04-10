import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'dart:async';
import 'dart:math';
import 'package:sortingalgorithms_visualizer/widgets/dialogpage.dart';
import 'package:sortingalgorithms_visualizer/widgets/tiles.dart';
import 'package:sortingalgorithms_visualizer/services/providernotifer.dart';

class Home extends StatefulWidget{
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<int> a = [];
  StreamController<List<int>> _controller = StreamController();
  double n = 300;  
  
  _randomize() {
    a = [];
    for (int i = 0; i < n; ++i) {
      a.add(Random().nextInt(500));
    }
    print('unordered again');
    _controller.add(a);
  }

  String algorithm = "Bubble Sort";

  _choose(int len ,int speed ,int algo){
    print('algo : $algo');
    print('tapped');
    if(algo==0){
      _bubble(len,speed);
    }else if(algo==1){
      _selection(len,speed);
    }else if(algo==2){
      _insertion(len, speed);
    }else if(algo==3){
      _mergesort(0,len,speed);
    }else if(algo==4){
      _wave(len, speed);
    }

  }

//insertion sort
  _insertion(int len,int speed) async {
    for (int i = 1; i < (len); ++i) {
      int j = i-1;
      int ele = a[i];
      while(j>=0 && a[j]>ele){
        a[j+1] = a[j];
        j--;
      }
      a[j+1] = ele;
      await Future.delayed(Duration(milliseconds: speed),(){});
      _controller.add(a);
    }
    print('sorted');
  }

// selection sort algorithm
  _selection(int len,int speed) async {
    for (int i = 0; i < (len); ++i) {
      int minidx = i;
      for (int j = i + 1; j < (len); ++j) {
        if (a[j] < a[minidx]) {
          int temp = a[j];
          a[j] = a[minidx];
          a[minidx] = temp;
        }
        await Future.delayed(Duration(microseconds: speed),(){});
        _controller.add(a);
      }
    }
    print('sorted');
  }

// Bubble sort algorithm
  _bubble(int len,int speed) async {
    for(int i=0; i<len-1; ++i){
      for(int j=0 ; j<len-i-1 ; ++j){
        if(a[j]>a[j+1]){
          int temp = a[j];
          a[j] = a[j+1];
          a[j+1] = temp;
        }
        await Future.delayed(Duration(microseconds:speed),(){});
        _controller.add(a);
      }
    }
    print('sorted');
  }

  // Merge function
  _merge(int s,int e,int speed) async{
    int mid = (s+((e-s)/2).floor());
    int i=s;
    int j=mid+1;
    int k=s;
    List<int> temp;

    while(i<=j){
      if(a[i]<a[j]){
        temp[++k] = a[++i];
      }
      else{
        temp[++k] = a[++j];
      }
    }

    while(i<=mid){
      temp[++k] = a[++i];
    }

    while(j<=e){
      temp[++k] = a[++j];
    }

    for(int i=s; i<=e; ++i){
      a[i] = temp[i];
      await Future.delayed(Duration(microseconds:speed),(){});
      _controller.add(a);
    }

  }

  //Mergesort
  _mergesort(int s,int e,int speed){
    if(s>=e){
      return;
    }
    int mid = (s+((e-s)/2).floor());
    _mergesort(s, mid, speed);
    _mergesort(mid+1, e, speed);
    _merge(s,e,speed);
  }

  //wave sort
  _wave(int len,int speed) async {
    for(int i=0;i<len;i+2){
      if(i>0 && a[i-1]>a[i]){
        int temp = a[i-1];
        a[i-1] = a[i];
        a[i] = temp;
      }
      if(i<n-2 && a[i+1]>a[i]){
        int tmp = a[i+1];
        a[i+1] = a[i];
        a[i] = tmp;
      }
      await Future.delayed(Duration(microseconds: speed),(){});
      _controller.add(a);
    }
    print('sorted');
  }

  @override
  void initState() {
    super.initState();
    _randomize();
  }

  @override
  void dispose() {
    _controller.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final count = Provider.of<UpdateLength>(context);
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text('${count.algoname}'),
          actions: <Widget>[
            Align(
              alignment: Alignment.center,
              child: Text('Tiles: ${count.n}',style: GoogleFonts.roboto(fontSize: 20.0,color: Colors.lightBlue[100])),
            ),
            Padding(padding: EdgeInsets.all(2.0)),
             Align(
              alignment: Alignment.center,
              child: Text('Speed: ${count.speed}',style: GoogleFonts.roboto(fontSize: 20.0,color: Colors.lightBlue[100])),
            ),
            Padding(padding: EdgeInsets.all(2.0)),
          ],
        ),
        body: Container(
          child: StreamBuilder(
            initialData: a,
            stream: _controller.stream,
            builder: (context, snapshot) {
              List<int> a = snapshot.data;
              int counter = 0;
              return Row(
                children: a.map((int i) {
                  counter++;
                  return CustomPaint(
                    painter: Tiles(
                        idx: counter,
                        value: i,
                        width: MediaQuery.of(context).size.width / count.n)
                  );
                }).toList(),
              );
            },
          ),
        ),
        bottomNavigationBar: Container(
          padding: EdgeInsets.symmetric(horizontal: 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Expanded(
                flex:2,
                child: FlatButton(onPressed: _randomize,child: Icon(Icons.shuffle),color:Colors.lightBlue[100],)
              ),
              Expanded(
                flex:3,
                child: FloatingActionButton(
                  child: Icon(Icons.add),
                  onPressed: (){
                    showDialog(
                      context: context,
                      builder: (BuildContext context){
                        return ChangeAlgo();
                      }
                    );
                  },
                ), 
              ),
              Expanded(
                flex:2,
                child: FlatButton(onPressed: (){
                  _choose(count.n,count.speed,count.chosenalgo);
                },child: Icon(Icons.play_arrow),color:Colors.lightBlue[100])
              ),
            ],
          ),
        ),
    );
  }
}

