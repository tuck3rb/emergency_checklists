// Started with https://docs.flutter.dev/development/ui/widgets-intro
import 'package:flutter/material.dart';
import 'package:to_dont_list/objects/checklist_item.dart';
import 'package:to_dont_list/settings.dart';
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
  List<String> displaychecklists = checklists;

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

  void _addNewChecklist() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AddChecklistDialog(
          onListAdded: (String newChecklistName, TextEditingController controller) {
            setState(() {
              checklists.add(newChecklistName);
              checklistSteps[newChecklistName] = [];
              selected.add(newChecklistName);
            });
          },
        );
      },
    );
  }

  void _setChecklist(){
    setState(() {
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [IconButton(onPressed: () async {
            await Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => SettingsScreen(passedlist: [displaychecklists], setChecklist: _setChecklist,)));} , icon: const Icon(Icons.settings))],
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        children: selected.map((checklistName) {
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
      floatingActionButton: FloatingActionButton(
      onPressed: _addNewChecklist,
      child: const Icon(Icons.add),
      ),
    );
  }
}





class ChecklistDetailsScreen extends StatefulWidget {
  final String title;
  // final String info;

  const ChecklistDetailsScreen({super.key, required this.title});

  @override
  _ChecklistDetailsScreenState createState() => _ChecklistDetailsScreenState();

}

class _ChecklistDetailsScreenState extends State<ChecklistDetailsScreen> {
  final Set<String> _completedItems = {};

  void _handleListChanged(ChecklistItem item, bool completed) {
    setState(() {
      if (completed) {
        _completedItems.remove(item.name);
      } else {
        _completedItems.add(item.name);
      }
    });
  }

  void _addStep() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AddChecklistDialog(
          onListAdded: (String newStep, TextEditingController controller) {
            setState(() {
              checklistSteps[widget.title]?.add(newStep);
            });
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final steps = checklistSteps[widget.title] ?? [];
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        children: steps.map((step) {
          // final item = ChecklistItem(name: step);
          return ChecklistListItem(
            item: ChecklistItem(name: step),
            completed: _completedItems.contains(step),
            onListChanged: _handleListChanged,
            onDeleteItem: (_) {},
          );
        }).toList(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addStep,
        child: const Icon(Icons.add),
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

