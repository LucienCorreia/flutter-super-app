import 'package:flutter/material.dart';

class SearchBarWidget extends StatelessWidget {
  final ValueNotifier<String> textSearchBarListenable;

  const SearchBarWidget({
    required this.textSearchBarListenable,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: TextEditingController(),
      onChanged: (String value) => textSearchBarListenable.value = value,
    );
  }
}
