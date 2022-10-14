import 'package:flutter/material.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:lorache/utils/shared_prefs.dart';
import '../values/dimen.dart';

Widget selectCity(String city){
  return Padding(
    padding: const EdgeInsets.fromLTRB(marginL, 0.0, marginL, 0.0),
    child: Row(
      children: [
        Expanded(
          child: Card(
            elevation: 12,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(radius),
            ),
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
              child: DropdownSearch<String>(
                items: getCities(),
                selectedItem: city,
                onChanged: (String? city) => saveCity(city),
                dropdownDecoratorProps: const DropDownDecoratorProps(
                  dropdownSearchDecoration: InputDecoration(
                    fillColor: Colors.white,
                    disabledBorder: InputBorder.none,
                  ),
                ),
                popupProps: const PopupProps.menu(
                  showSearchBox: true,
                ),
              ),
            ),
          ),
        ),
      ],
    ));
}

saveCity(String? city) {
  SharedPrefs sharedPrefs = SharedPrefs();
  sharedPrefs.city = city ?? "Selecciona una opción";
}

getCities() {
  final List<String> items = [
    'Uesca',
    'Casbas de Uesca',
    'Fontiellas',
    'Ayerbe',
    'Alquezra',
  ];
  return items;
}
