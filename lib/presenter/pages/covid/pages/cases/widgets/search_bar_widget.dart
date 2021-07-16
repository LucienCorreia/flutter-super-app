import 'package:flutter/material.dart';

class SearchBarWidget extends StatelessWidget {
  final String value;
  final Function(String value) onChanged;

  const SearchBarWidget({
    this.value = '',
    required this.onChanged,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: TextEditingController(text: value),
      onChanged: onChanged,
    );
  }
}
