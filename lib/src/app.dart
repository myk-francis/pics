// Import Flutter Helper library
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' show get;
import 'models/image_model.dart';
import 'widgets/image_list.dart';


class App extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return AppState();
  }
}



//Create a class that will be our custom widget
//This class must extend the 'StatelessWidget' base class
class AppState extends State<App> {
  int counter = 1;
  List<ImageModel> images = [];

  void fetchImage () async {
    try {
      var response = await get('https://jsonplaceholder.typicode.com/photos/$counter');
      var imageModel = ImageModel.fromJson(json.decode(response.body));


      setState(() {
        images.add(imageModel);
      });
      counter++;
    }
    catch(e) {
      print(e);
    }
  }

  //Must define a 'build' method that returns the widgets that *this* widget will show
  Widget build(context) {
    return MaterialApp(
      home: Scaffold(
        body: ImageList(images),
        floatingActionButton: FloatingActionButton(
          /*onPressed: () {
            // Add your onPressed code here!
            fetchImage();
          },*/
          onPressed: fetchImage,
          child: Icon(Icons.navigation),
          backgroundColor: Colors.green,
        ),
        appBar: AppBar(
          title: Text('Lets See Some Images'),
        ),
      ),
    );
  }
}


