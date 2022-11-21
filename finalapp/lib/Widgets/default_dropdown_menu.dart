import 'package:flutter/material.dart';
import 'package:dropdown_search/dropdown_search.dart';

class DefaultDropDownMenu extends StatefulWidget {
  final List<String> items;

  const DefaultDropDownMenu({
    super.key,
    required this.items,
  });

  @override
  State<DefaultDropDownMenu> createState() => _DState();
}

class _DState extends State<DefaultDropDownMenu> {
  String selectedItem = "Select Item";
  @override
  Widget build(BuildContext context) {
    return DropdownSearch<String>(
      popupProps: PopupProps.menu(
        showSelectedItems: true,
        disabledItemFn: (String s) => s.startsWith('I'),
      ),
      items: widget.items,
      dropdownDecoratorProps: DropDownDecoratorProps(
        dropdownSearchDecoration: InputDecoration(
          labelText: "Menu mode",
          hintText: "Select Item",
        ),
      ),
      onChanged: print,
      selectedItem: "Item1 ",
    );

// DropdownSearch<String>.multiSelection(
//     items: ["Brazil", "Italia (Disabled)", "Tunisia", 'Canada'],
//     popupProps: PopupPropsMultiSelection.menu(
//         showSelectedItems: true,
//         disabledItemFn: (String s) => s.startsWith('I'),
//     ),
//     onChanged: print,
//     selectedItems: ["Brazil"],
// )
  }
}
