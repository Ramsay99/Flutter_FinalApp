import 'package:dropdown_search/dropdown_search.dart';
import 'package:finalapp/style/style_barrel.dart';
import 'package:flutter/material.dart';

class DropDownWidget extends StatelessWidget {
  final String hint;
  final String title;
  final List<String> items;
  final TextEditingController controller;
  const DropDownWidget({
    super.key,
    required this.hint,
    required this.title,
    required this.controller,
    required this.items,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 9, horizontal: 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(2, 0, 0, 7),
            child: Text(
              title,
              style: const TextStyle(
                color: oxford_blue_tint_4,
                fontSize: 13,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          SizedBox(
            width: 300,
            child: DropdownSearch<String>(
              popupProps: const PopupProps.bottomSheet(
                bottomSheetProps: BottomSheetProps(
                  elevation: 16,
                ),
              ),
              items: items,
              dropdownDecoratorProps: DropDownDecoratorProps(
                dropdownSearchDecoration: InputDecoration(
                  filled: true,
                  fillColor: light_blue_tint_2,
                  focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4),
                    borderSide: const BorderSide(
                      color: red_tint_1,
                      width: 1,
                    ),
                  ),
                  errorStyle: const TextStyle(color: red_tint_1),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4),
                    borderSide: const BorderSide(
                      color: red_tint_1,
                      width: 1,
                    ),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4),
                    borderSide: const BorderSide(
                      width: 0,
                      style: BorderStyle.none,
                    ),
                  ),
                  hintText: "City",
                  hintStyle: const TextStyle(
                    color: light_grey_tint_1,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                  isCollapsed: true,
                  contentPadding: const EdgeInsets.all(18),
                ),
              ),
              onChanged: (val) {
                controller.text = val!;
              },
            ),
          )
        ],
      ),
    );
  }
}
