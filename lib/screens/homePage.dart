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
    initSpeech();
  }
  void  initSpeech ()async{
     speechEnabled = await _speechToText.initialize();
     setState(() {
       
     });
  }

  void startListening() async{
       await _speechToText.listen(onResult:_onSpeechResult );
       setState(() {
         _coonfidenceLevel = 0;
       });
  }
  void stopListening()async{
     await _speechToText.stop();
     setState(() {
       
     });
  }
  void _onSpeechResult (result){
    setState(() {
      _wordSpoken = "${result.recognizedWords}";
      _coonfidenceLevel = result.confidence;
    });
  }

   final SpeechToText _speechToText = SpeechToText();
   bool speechEnabled = false;
   String _wordSpoken = "";
   int _coonfidenceLevel = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar:  AppBar(
      backgroundColor: Colors.purple,
      title: const Text("VoiceNova",
      style: TextStyle(
        color: Colors.white,
        fontSize: 25,
      ),
      
      ),
      centerTitle: true,
    ),
    body: Center(
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(12.0),
            child: Text(_speechToText.isListening ?"Listening": speechEnabled? "Tap the microphone to start listening": "Speech is not available"),
          ),
          Expanded(child: Container(
            padding: const EdgeInsets.all(12.0),
            child: Text(_wordSpoken),))
        ],
      ),
    ),
    floatingActionButton: FloatingActionButton(onPressed: _speechToText.isListening ? stopListening : startListening,
    tooltip: "Listen",
    backgroundColor: Colors.black,
    child: Icon(_speechToText.isNotListening? Icons.mic_off : Icons.mic,
    color: Colors.white,
    ),
    ),
    );
  }
}