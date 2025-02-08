import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  final String cardTitle;
  final String cardContent;

   DetailScreen({super.key, required this.cardTitle, required this.cardContent});

   final AudioPlayer player = AudioPlayer();  

  void playSound() async {
    await player.play(AssetSource('audio/pop.mp3'));  
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(227, 98, 85, 1),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(50),
          ),
        ),
        /////////
        title: const Center(
          child: Padding(
            padding: EdgeInsets.all(30),
            child: Text(
              'คำทำนาย',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800, color: Colors.white),
            ),
          ),
        ),
          leading: Padding(
            padding: const EdgeInsets.only(left: 25),
            child: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white), 
            onPressed: () {
              playSound();
              Navigator.of(context).pop(); 
            },
          ),
        ),
        actions: const [
          SizedBox(width: 50,)
        ],
      ),
      
      body: Padding(
        padding: const EdgeInsets.only(right: 40, left: 40, top:30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              cardTitle,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const Divider(height: 20,thickness: 2,),
            Text(
              cardContent,
              style: const TextStyle(fontSize: 18),
              textAlign: TextAlign.justify,
            ),
          ],
        ),
      ),
    );
  }
}
