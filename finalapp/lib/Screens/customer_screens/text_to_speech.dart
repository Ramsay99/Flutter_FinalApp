import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

class TextToSpeech extends StatefulWidget {
  const TextToSpeech({super.key});

  @override
  State<TextToSpeech> createState() => _TextToSpeechState();
}

class _TextToSpeechState extends State<TextToSpeech> {
  TextEditingController textFieldController = TextEditingController();
  FlutterTts flutterTts = FlutterTts();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
          child: Container(
        alignment: Alignment.center,
        child: Column(children: [
          TextField(
            controller: textFieldController,
          ),
          ElevatedButton(onPressed: startSpeaking, child: Text("Start"))
        ]),
      )),
    );
  }

  void startSpeaking() async {
    flutterTts.speak(textFieldController.text);
    flutterTts.setVolume(6);
  }
}
