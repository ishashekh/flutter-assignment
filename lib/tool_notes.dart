// Importing the material library from Flutter
import 'package:flutter/material.dart';

// Declaring a StatefulWidget named ToolNotes
class ToolNotes extends StatefulWidget {
  const ToolNotes({Key? key}) : super(key: key);

  // Overriding createState method to return an instance of _ToolNotesState
  @override
  _ToolNotesState createState() => _ToolNotesState();
}

// Declaring a State class named _ToolNotesState which extends State<ToolNotes>
class _ToolNotesState extends State<ToolNotes> {
  List<String> _notes = [];

  TextEditingController _noteController = TextEditingController();

  // Defining a function named _addNote to add a note to _notes List
  void _addNote() {
    if (_noteController.text.isNotEmpty) {
      setState(() {
        _notes.add(_noteController.text);
        _noteController.clear();
      });
    }
  }

  // Defining a function named _deleteNoteAt to remove a note from _notes List
  void _deleteNoteAt(int index) {
    setState(() {
      _notes.removeAt(index);
    });
  }

  // Defining a function named _editNoteAt to edit a note in _notes List
  void _editNoteAt(int index) {
    _noteController.text = _notes[index];
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text('Edit note'),
        content: TextField(controller: _noteController),
        actions: [
          TextButton(
            onPressed: () {
              setState(() {
                _notes[index] = _noteController.text;
                _noteController.clear();
              });
              Navigator.pop(context);
            },
            child: Text('Save'),
          ),
          TextButton(
            onPressed: () {
              _noteController.clear();
              Navigator.pop(context);
            },
            child: Text('Cancel'),
          ),
        ],
      ),
    );
  }

  // Implementing the build method to build the UI
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tool Notes'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _notes.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(_notes[index]),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        onPressed: () => _editNoteAt(index),
                        icon: Icon(Icons.edit),
                      ),
                      IconButton(
                        onPressed: () => _deleteNoteAt(index),
                        icon: Icon(Icons.delete),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          Divider(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _noteController,
                    decoration: InputDecoration(
                      hintText: 'Add note here',
                    ),
                    onSubmitted: (_) => _addNote(),
                  ),
                ),
                SizedBox(width: 8.0),
                IconButton(
                  onPressed: _addNote,
                  icon: Icon(Icons.add),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
