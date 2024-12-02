


import 'package:flutter/material.dart';
import 'package:to_dont_list/checklist_data.dart';

typedef SettingsCallback = Function();
class SettingsScreen extends StatefulWidget {
  List passedlist;
  SettingsCallback setChecklist;
  SettingsScreen({super.key, required this.passedlist, required this.setChecklist});
  

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> with AutomaticKeepAliveClientMixin<SettingsScreen> {


  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        ),
    
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        children: checklists.map((checklistName) {
          return ListTile(
            leading: null,
            title: Text(checklistName),
            onTap: () {},
            trailing: 
                      Checkbox(
                        value: selected.contains(checklistName),
                        onChanged: (curval) {
                          if(selected.contains(checklistName))
                          {selected.remove(checklistName);}
                          else {selected.add(checklistName);}
                          widget.setChecklist();
  
                         setState(() {});
                         
                        
                        },
                      ),
          );
        }).toList(),
      ),
    );
  }
    @override
  bool get wantKeepAlive => true;
  }
 