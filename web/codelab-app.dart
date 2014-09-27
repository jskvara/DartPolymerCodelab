import 'package:polymer/polymer.dart';

class Note extends Observable {

   @observable String body;

   @observable bool done;

   Note([this.body = "", this.done = false]);
}

@CustomTag('codelab-app')
class CodelabApp extends PolymerElement {

  @observable String newNote = "";
  
  @observable List data = toObservable([]);

  CodelabApp.created() : super.created() {
  }
  
  ready() {
    $['newNoteInput'].style.display = 'none';
  }

  toggleDrawer() {
    $['drawerPanel'].togglePanel();
  }

  showNewNoteInput() {
    $['newNoteInput'].style.display = 'block';
  }

  add() {
    if (newNote != null && newNote != "") {
      data.add(new Note(newNote));
      $['newNoteInput'].style.display = 'none';
      $['newNoteInput'].value = null;
    }
  }
}
