import 'package:flutter/material.dart';
import 'package:wawchan/Model/Journal.dart';
import 'package:wawchan/Services/libs.dart';
import 'package:wawchan/ViewNote.dart';

class Libs extends StatefulWidget {
  @override
  _LibsState createState() => _LibsState();
}

class _LibsState extends State<Libs> {
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
        ? ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: _journalist.length,
            itemBuilder: (context, index) {
              return Row(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => ViewNote(
                                journal: _journalist[index],
                              )));
                    },
                    child: Container(
                      padding: EdgeInsets.only(top: 5, left: 8, right: 8),
                      child: Column(
                        children: [
                          Image.asset(
                            'assets/geh.png',
                            height: MediaQuery.of(context).size.height * .2,
                            width: MediaQuery.of(context).size.width * .3,
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * .2,
                            child: Text(
                              _journalist[index].chapter,
                              style: TextStyle(fontSize: 12),
                              maxLines: 4,
                              textAlign: TextAlign.start,
                              overflow: TextOverflow.visible,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * .01,
                  ),
                ],
              );
            })
        : Center(
            child: Icon(Icons.note, size: 90),
          );
  }
}
