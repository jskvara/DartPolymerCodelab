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

  @observable bool fadeSelected = false;

  @observable var fontSize = 14;

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
  
  delete() {
//    (note) => !note.done
//    
//    function(note) {
//      return !note.done;
//    }
    data = data.where((note) => !note.done).toList();
  }
  
  fontSizeChanged() {
    var cards = shadowRoot.querySelectorAll('.card');
    for (var i = 0; i < cards.length; i++) {
      cards[i].style.fontSize = "${fontSize}px";
    }
  }

  reset() {
    fontSize = 14;
    fadeSelected = false;
    $['toast'].show();
  }
}
