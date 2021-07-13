import 'package:flutter/material.dart';

class SearchBarWidget extends StatelessWidget {
  final Function(String value) onChanged;

  const SearchBarWidget({
    required this.onChanged,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: TextEditingController(),
      onChanged: onChanged,
    );
  }
}
