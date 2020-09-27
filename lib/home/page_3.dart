import 'package:flutter/material.dart';

import 'dart:typed_data';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flare_flutter/flare_actor.dart';

import 'package:sample/home/DataHolder.dart';
import 'package:sample/home/page_3_body_2.dart';

class Page3 extends StatelessWidget {
  final FirebaseUser user;

  Page3({Key key, @required this.user}) : super(key: key);

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.withOpacity(0.1),
      appBar: AppBar(
        title: Text("User Logged In"),
        backgroundColor: Colors.grey.shade900,
        centerTitle: true,
        elevation: 0.0,
        iconTheme: new IconThemeData(color: Colors.deepPurpleAccent),
      ),
      body: Container(
        child: makeImageGrid(),
      ),
    );
  }

  Widget makeImageGrid() {
    return GridView.builder(
        itemCount: 12,
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (context, index) {
          return ImageGridItem(index + 1);
        });
  }
}

class ImageGridItem extends StatefulWidget {
  final int _index;

  ImageGridItem(this._index);

  @override
  _ImageGridItemState createState() => _ImageGridItemState();
}

class _ImageGridItemState extends State<ImageGridItem> {
  StorageReference photosReference =
      FirebaseStorage.instance.ref().child("photos");
  Uint8List imageFile;

  bool _loading = true;

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 10), () {
      setState(() {
        _loading = false;
      });
    });

    if (_loading == true) {
      return Container(
        width: 50.0,
        height: 50.0,
        child: FlareActor(
          "assets/svgs/animation_1.flr",
          animation: "circular",
          fit: BoxFit.contain,
          alignment: Alignment.center,
        ),
      );
    } else {
      return GridTile(
        child: decideGridTileWidget(),
      );
    }
  }

  @override
  void initState() {
    super.initState();
    if (!imageData.containsKey(widget._index)) {
      getImage();
    } else {
      this.setState(() {
        imageFile = imageData[widget._index];
      });
    }
  }

  getImage() {
    if (!requestedIndexes.contains(widget._index)) {
      int maxSize = 2 * 1024 * 1024;

      photosReference
          .child("image_${widget._index}.jpg")
          .getData(maxSize)
          .then((data) {
        this.setState(() {
          imageFile = data;
          _loading = false;
        });
        imageData.putIfAbsent(widget._index, () {
          return data;
        });
      }).catchError((error) {
        debugPrint(error.toString());
      });

      requestedIndexes.add(widget._index);
    }
  }

  Widget decideGridTileWidget() {
    if (imageFile == null) {
      return Center(
          child: Text(
        "No Image",
        style: TextStyle(
          color: Colors.grey,
        ),
      ));
    } else {
      return Image.memory(
        imageFile,
        fit: BoxFit.cover,
      );
    }
  }
}
