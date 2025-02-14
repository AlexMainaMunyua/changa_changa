
import 'package:flutter/material.dart';
class Page extends StatelessWidget {
  final Widget child;

  const Page({super.key,  required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: child,
      ),
    );
  }
}
