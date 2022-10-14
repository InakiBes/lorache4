import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

import '../values/dimen.dart';

// TODO BORRAR SI NO SE USA
class WidgetDropdownListCity2 extends StatefulWidget {
  const WidgetDropdownListCity2({Key? key}) : super(key: key);

  @override
  State<WidgetDropdownListCity2> createState() =>
      _WidgetDropdownListCity2State();
}

class _WidgetDropdownListCity2State extends State<WidgetDropdownListCity2> {
  final List<String> items = [
    'Aab',
    'Aabb',
    'aabbc',
    'aabbd',
    'aabbb',
    'aabbbd',
    'Abc1',
    'abc2',
  ];

  String? selectedValue;
  final TextEditingController textEditingController = TextEditingController();

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        elevation: 12,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius),
        ),
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(marginL, 0.0, marginL, 0.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Center(
                child: DropdownButtonHideUnderline(
                  child: DropdownButton2(
                    isExpanded: true,
                    hint: Text(
                      'Select Item',
                      style: TextStyle(
                        fontSize: 14,
                        color: Theme
                            .of(context)
                            .hintColor,
                      ),
                    ),
                    items: items
                        .map((item) =>
                        DropdownMenuItem<String>(
                          value: item,
                          child: Text(
                            item,
                            style: const TextStyle(
                              fontSize: 14,
                            ),
                          ),
                        ))
                        .toList(),
                    value: selectedValue,
                    onChanged: (value) {
                      setState(() {
                        selectedValue = value as String;
                      });
                    },
                    buttonHeight: 40,
                    buttonWidth: 200,
                    itemHeight: 40,
                    dropdownMaxHeight: 300,
                    searchController: textEditingController,
                    searchInnerWidget: Padding(
                      padding: const EdgeInsets.only(
                        top: 8,
                        bottom: 4,
                        right: 8,
                        left: 8,
                      ),
                      child: TextFormField(
                        controller: textEditingController,
                        decoration: InputDecoration(
                          isDense: true,
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 8,
                          ),
                          hintText: 'Search for an item...',
                          hintStyle: const TextStyle(fontSize: 12),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                    ),
                    searchMatchFn: (item, searchValue) {
                      return (item.value.toString().contains(searchValue));
                    },
                    //This to clear the search value when you close the menu
                    onMenuStateChange: (isOpen) {
                      if (!isOpen) {
                        textEditingController.clear();
                      }
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
