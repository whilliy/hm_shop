import 'package:flutter/material.dart';

class HmSuggestion extends StatefulWidget {
  const HmSuggestion({super.key});

  @override
  State<HmSuggestion> createState() => _HmSuggestionState();
}

class _HmSuggestionState extends State<HmSuggestion> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsGeometry.symmetric(horizontal: 10), //Padding包裹使其有内边距
      child: Container(
        color: Colors.blue,
        height: 300,
        alignment: Alignment.center,
        child: Text('推荐', style: TextStyle(color: Colors.white)),
      ),
    );
  }
}
