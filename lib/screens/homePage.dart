import 'package:flutter/material.dart';
import 'package:speech_to_text/speech_to_text.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
  }
  void  initSpeech ()async{
    await _speechToText.initialize();
  }
   final SpeechToText _speechToText = SpeechToText();
  @override
  Widget build(BuildContext context) {
    return Scaffold(

    );
  }
}