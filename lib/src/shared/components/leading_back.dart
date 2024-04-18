import 'package:flutter/material.dart';

class LeadingBack extends StatelessWidget {
  const LeadingBack({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        Icons.arrow_back,
        color: Theme.of(context).colorScheme.onBackground,
      ),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );
  }
}
