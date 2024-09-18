import 'package:flutter/material.dart';

typedef CourseAddedCallback = Function(
    String value, TextEditingController textController, String r, TextEditingController rController, String g, TextEditingController gController, String b, TextEditingController bController);

class NewCourseDialog extends StatefulWidget {
  const NewCourseDialog({
    super.key,
    required this.onListAdded,
  });

  final CourseAddedCallback onListAdded;

  @override
  State<NewCourseDialog> createState() => _NewCourseDialogState();
}

class _NewCourseDialogState extends State<NewCourseDialog> {
  // Dialog with text from https://www.appsdeveloperblog.com/alert-dialog-with-a-text-field-in-flutter/
  final TextEditingController _inputController = TextEditingController();
  final TextEditingController _rController = TextEditingController();
  final TextEditingController _gController = TextEditingController();
  final TextEditingController _bController = TextEditingController();
  final ButtonStyle yesStyle = ElevatedButton.styleFrom(
      textStyle: const TextStyle(fontSize: 20), backgroundColor: Colors.green);
  final ButtonStyle noStyle = ElevatedButton.styleFrom(
      textStyle: const TextStyle(fontSize: 20), backgroundColor: Colors.red);

  String valueText = "";
  String r = "";
  String g = "";
  String b = "";

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Course to add:'),
      content: Column(
        children: <Widget>[
          TextField(
            onChanged: (value) {
              setState(() {
                valueText = value;
              });
            },
            controller: _inputController,
            decoration: const InputDecoration(hintText: "type the course name here"),
            key: const Key('CN'),
          ),
          TextField(
            onChanged: (value) {
              setState(() {
                r = value;
              });
            },
            controller: _rController,
            decoration: const InputDecoration(hintText: 'Enter red value here from 0-255'),
            key: const Key('r'),
          ),
          TextField(
            onChanged: (value) {
              setState(() {
                g = value;
              });
            },
            controller: _gController,
            decoration: const InputDecoration(hintText: 'Enter green value here from 0-255'),
            key: const Key('g'),
          ),
          TextField(
            onChanged: (value) {
              setState(() {
                b = value;
              });
            },
            controller: _bController,
            decoration: const InputDecoration(hintText: 'Enter blue value here from 0-255'),
            key: const Key('b'),
          )

        ]
      ),
      actions: <Widget>[
        ValueListenableBuilder<TextEditingValue>(
          valueListenable: _inputController,
          builder: (context, value, child) {
            return ElevatedButton(
              key: const Key("OKButton"),
              style: yesStyle,
              onPressed: value.text.isNotEmpty
                  ? () {
                      setState(() {
                        widget.onListAdded(valueText, _inputController, r, _rController, g, _gController, b, _bController);
                        Navigator.pop(context);
                      });
                    }
                  : null,
                child: const Text('OK'),
            );
          },
        ),
        // https://stackoverflow.com/questions/52468987/how-to-turn-disabled-button-into-enabled-button-depending-on-conditions


        ElevatedButton(
          key: const Key("CancelButton"),
          style: noStyle,
          child: const Text('Cancel'),
          onPressed: () {
            setState(() {
              Navigator.pop(context);
            });
          },
        ),
      ],
    );
  }
}
