import 'package:flutter/material.dart';

class Anoda extends StatefulWidget {
  final String post;
  final String chapter;
  final String category;
  final int id;
  final String name;
  final String title;
  final String imageUrl;
  final String index;

  Anoda(
      {this.post,
      this.chapter,
      this.category,
      this.id,
      this.title,
      this.name,
      this.index,
      this.imageUrl});
  @override
  _AnodaState createState() => _AnodaState();
}

class _AnodaState extends State<Anoda> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Test'),
      ),
      body: PageView.builder(
          // On page change might hold the key to opening up more
          itemCount: 20,
          itemBuilder: (context, index) {
            return SingleChildScrollView(
              child: Text(widget.post),
            );
          }),
    );
  }
}
