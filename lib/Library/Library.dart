import 'package:flutter/material.dart';
import 'package:wawchan/Model/Journal.dart';
import 'package:wawchan/Services/libs.dart';
import 'package:wawchan/ViewNote.dart';

class Library extends StatefulWidget {
  @override
  _LibraryState createState() => _LibraryState();
}

class _LibraryState extends State<Library> {
  JournalService journalService;

  List<Journal> _journalist = List<Journal>();

  @override
  initState() {
    super.initState();
    getjournal();
  }

  getjournal() async {
    journalService = JournalService();
    _journalist = List<Journal>();

    var joruna = await journalService.readJournal();

    joruna.forEach((journals) {
      setState(() {
        var model = Journal();
        model.id = journals['id'];
        model.chapter = journals['chapter'];
        model.post = journals['post'];
        model.name = journals['name'];
        model.category = journals['category'];
        _journalist.add(model);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    //final post = Provider.of<List<Journal>>(context);
    return (_journalist.length > 0)
        ? Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.white,
              title: Text(
                'Library',
                style: TextStyle(color: Colors.black),
              ),
              centerTitle: true,
              elevation: 0,
              iconTheme: new IconThemeData(color: Color(0xff01C606)),
            ),
            body: ListView.builder(
              itemCount: _journalist.length,
              itemBuilder: (context, index) {
                return InkWell(
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Container(
                        padding: EdgeInsets.symmetric(
                          vertical: 5,
                          horizontal: 5,
                        ),
                        color: Color(0xff333333),
                        child: Text(
                          _journalist[index].chapter,
                          style: TextStyle(color: Colors.white),
                        )),
                  ),
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => ViewNote(
                              journal: _journalist[index],
                            )));
                  },
                );
              },
            ),
          )
        : Center(
            child: Icon(Icons.note, size: 90),
          );
  }
}
