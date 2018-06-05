import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:wall_paper_app/full_screen.dart';


class WallScreen extends StatefulWidget {
  @override
  _WallScreenState createState() => new _WallScreenState();
}

class _WallScreenState extends State<WallScreen> {

  List wallpapersList = new List();

@override
  void initState() {
    super.initState();
 
wallpapersList.add("images/one.jpeg");
     wallpapersList.add("images/two.jpeg");
     wallpapersList.add("images/three.jpeg");
     wallpapersList.add("images/four.jpg");
     wallpapersList.add("images/five.jpeg");
     wallpapersList.add("images/six.jpg");
     wallpapersList.add("images/seven.jpg");
     wallpapersList.add("images/eight.png");
     wallpapersList.add("images/nine.jpg");
// wallpapersList = {""}

  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Wall Paper"),

      ),
      body: wallpapersList != null ? 
      new StaggeredGridView.countBuilder(
        padding: const EdgeInsets.all(8.0),
        crossAxisCount: 4,
        itemCount: wallpapersList.length,

        itemBuilder: (context, i) {
String imgPath = wallpapersList[i];
return new Material(
elevation: 8.0,
borderRadius: new BorderRadius.all(new Radius.circular(8.0)),
child: new InkWell(

  onTap: () => Navigator.push(context, new MaterialPageRoute(
    builder: (context) => new FullScreenImagePage(imgPath),
  )) ,
  child: new Hero(
    tag: imgPath,
    child: new FadeInImage(
      image: new AssetImage(imgPath),
      fit: BoxFit.cover ,
      placeholder: new AssetImage("images/two.jpeg"),
    ),
  ),
),

);
        },
        staggeredTileBuilder: (i) => new StaggeredTile.count(2, i.isEven ? 2:3),
mainAxisSpacing: 8.0,
crossAxisSpacing: 8.0,
      ) : new Center(
        child: new CircularProgressIndicator(),
      )
      
    );
  }
}