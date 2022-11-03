// ignore_for_file: prefer_const_constructors

import 'package:finalapp/Screens/screens_barrel.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryState();
}

class _HistoryState extends State<HistoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text(
        'Index 3: History',
      ),
    );
  }
}
