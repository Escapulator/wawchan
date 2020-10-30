import 'package:wawchan/Model/Journal.dart';
import 'package:wawchan/Utils/Repository.dart';

class JournalService {
  Repo _repo;

  JournalService() {
    _repo = Repo();
  }

  saveJournal(Journal journal) async {
    return await _repo.insertData('journal_entries', journal.journalMap());
  }

  readJournal() async {
    return await _repo.readData('journal_entries');
  }
}
