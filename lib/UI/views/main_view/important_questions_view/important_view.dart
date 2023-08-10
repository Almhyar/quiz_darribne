import 'package:flutter/material.dart';

class ImportantView extends StatefulWidget {
  const ImportantView({Key? key}) : super(key: key);

  @override
  State<ImportantView> createState() => _ImportantViewState();
}

class _ImportantViewState extends State<ImportantView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(body: Text('important'),));
  }
}
