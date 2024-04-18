class DropdownModel {
  final int id;
  final String value;
  final String name;
  static int _autoIncrement = 0;

  DropdownModel({
    required this.value,
    required this.name,
  }) : id = _autoIncrement++;
}
