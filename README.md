# Flutter-Gallery


![ezgif com-video-to-gif](https://user-images.githubusercontent.com/39940314/40966065-1db58cf8-68cd-11e8-9fa3-f0057ad5eecd.gif)

Dependency In pubspect.yamal

                        flutter_staggered_grid_view:
                          

1) Initialize images 
                   assets:
                      - images/one.jpeg
                      - images/two.jpeg
                      - images/three.jpeg
                      - images/four.jpg
                      - images/five.jpeg
                      - images/six.jpg
                      - images/seven.jpg
                      - images/eight.png
                      - images/nine.jpg


2) Imports
                      import 'package:flutter/material.dart';
                      import 'dart:async';
                      import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
                      import 'package:wall_paper_app/full_screen.dart';

3) In the HomeState

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


II Second page.dart

                      String imgPath;
                      FullScreenImagePage(this.imgPath);
                      final LinearGradient backgroundGradient = new LinearGradient(
                        colors: [new Color(0x10000000), new Color(0x30000000)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight
                      );

                      @override
                        Widget build(BuildContext context) {
                          return new Scaffold(
                            body: new SizedBox.expand(
                              child: new Container(
                                decoration: new BoxDecoration(gradient: backgroundGradient),
                                child: new Stack(
                                  children: <Widget>[
                                    new Align(alignment: Alignment.center,
                                    child: new Hero(
                                      tag: imgPath,
                                      child: new Image.asset(imgPath),
                                    ),
                                    ),

                                    new Align(
                                      alignment: Alignment.topCenter,
                                      child: new Column(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        mainAxisSize: MainAxisSize.min,
                                        children: <Widget>[
                                          new AppBar(
                                            elevation: 0.0,
                                            backgroundColor: Colors.transparent,
                                            leading: new IconButton(
                                              icon: new Icon(Icons.close, color: Colors.black,),
                                              onPressed: () => Navigator.of(context).pop(),
                                            ),

                     
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          );
                        }                      
                      }
