// Started with https://docs.flutter.dev/development/ui/widgets-intro
import 'package:flutter/material.dart';
import 'package:to_dont_list/objects/checklist_item.dart';
import 'package:to_dont_list/widgets/checklist_list_item.dart';
import 'package:to_dont_list/widgets/checklist_dialog.dart';
import 'checklist_data.dart';

class ToDoList extends StatefulWidget {
  final String title;
  const ToDoList({super.key, required this.title});

  @override
  State createState() => _ToDoListState();
}

class _ToDoListState extends State<ToDoList> {
  final List<ChecklistItem> items = [const ChecklistItem(name: "add more todos")];
  final _itemSet = <ChecklistItem>{};

  void _handleListChanged(ChecklistItem item, bool completed) {
    setState(() {
      // When a user changes what's in the list, you need
      // to change _itemSet inside a setState call to
      // trigger a rebuild.
      // The framework then calls build, below,
      // which updates the visual appearance of the app.

      items.remove(item);
      if (!completed) {
        print("Completing");
        _itemSet.add(item);
        items.add(item);
      } else {
        print("Making Undone");
        _itemSet.remove(item);
        items.insert(0, item);
      }
    });
  }

  void _handleDeleteItem(ChecklistItem item) {
    setState(() {
      print("Deleting item");
      items.remove(item);
    });
  }

  void _handleNewItem(String itemText, TextEditingController textController) {
    setState(() {
      print("Adding new item");
      ChecklistItem item = ChecklistItem(name: itemText);
      items.insert(0, item);
      textController.clear();
    });
  }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: Text(widget.title),
//         ),
//         body: ListView(
//           padding: const EdgeInsets.symmetric(vertical: 8.0),
//           children: items.map((item) {
//             return ChecklistListItem(
//               item: item,
//               completed: _itemSet.contains(item),
//               onListChanged: _handleListChanged,
//               onDeleteItem: _handleDeleteItem,
//             );
//           }).toList(),
//         ),
//         floatingActionButton: FloatingActionButton(
//             child: const Icon(Icons.add),
//             onPressed: () {
//               showDialog(
//                   context: context,
//                   builder: (_) {
//                     return ToDoDialog(onListAdded: _handleNewItem);
//                   });
//             }));
//   }
// }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        children: checklists.map((checklistName) {
          return ListTile(
            leading: const CircleAvatar(
              backgroundColor: Colors.red,
              child: warningIcon,
            ),
            title: Text(checklistName),
            onTap: () {
              Navigator.push(
                context, 
                MaterialPageRoute(
                  builder: (context) => ChecklistDetailsScreen(title: checklistName),
                  )
                );
            },
          );
        }).toList(),
      ),
    );
  }
}

class ChecklistDetailsScreen extends StatelessWidget {
  final String title;

  const ChecklistDetailsScreen({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Text(title),
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(
    title: 'Emergency Checklists',
    home: ToDoList(title: 'Emergency Checklists',),
  ));
}

