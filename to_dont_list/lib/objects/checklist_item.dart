// Data class to keep the string and have an abbreviation function

class ChecklistItem {
  const ChecklistItem({required this.name});

  final String name;

  String abbrev() {
    return name.substring(0, 1);
  }
}
