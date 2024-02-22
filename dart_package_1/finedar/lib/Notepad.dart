import 'package:flutter/material.dart';
import 'dart:io';

void main() {
  runApp(MyNotepad());
}

class MyNotepad extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return note();
  }

  MaterialApp note() {
    return MaterialApp(
      title: 'Flutter Notepad',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Notepad(),
    );
  }
}

class Notepad extends StatefulWidget {
  @override
  _NotepadState createState() => _NotepadState();
}

class _NotepadState extends State<Notepad> {
  TextEditingController _controller = TextEditingController();
  String _notes = '';

  @override
  void initState() {
    super.initState();
    _readNotes().then((String value) {
      setState(() {
        _notes = value;
      });
    });
  }

  Future<String> _getLocalPath() async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  Future<File> _getLocalFile() async {
    final path = await _getLocalPath();
    return File('$path/notes.txt');
  }

  Future<File> _writeNotes(String notes) async {
    final file = await _getLocalFile();
    return file.writeAsString(notes);
  }

  Future<String> _readNotes() async {
    try {
      final file = await _getLocalFile();
      String contents = await file.readAsString();
      return contents;
    } catch (e) {
      return '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Notepad'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              child: TextField(
                controller: _controller,
                maxLines: null,
                onChanged: (value) {
                  setState(() {
                    _notes = value;
                  });
                },
              ),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                _writeNotes(_notes);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Notes saved!')),
                );
              },
              child: Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}

getApplicationDocumentsDirectory() {}
