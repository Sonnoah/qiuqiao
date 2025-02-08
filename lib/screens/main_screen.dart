import 'dart:math';
import 'package:audioplayers/audioplayers.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';


class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  final CollectionReference fetchData = FirebaseFirestore.instance.collection("card");
  final AudioPlayer player = AudioPlayer();
  bool isAnimating = false;  

  void playSound() async {
    await player.play(AssetSource('audio/shake-popcorn-bag2.mp3'));
    setState(() {
      isAnimating = true;    
    }); 

  Future.delayed(const Duration(milliseconds: 500), () {
    setState(() {
      isAnimating = false; 
    });
  });
}

   void showPopup() async {
    QuerySnapshot snapshot = await fetchData.get();

    if (snapshot.docs.isNotEmpty) {

      await Future.delayed(const Duration(seconds: 1));

      Random random = Random();
      int randomIndex = random.nextInt(snapshot.docs.length); 
      var randomCard = snapshot.docs[randomIndex];
      String cardTitle = randomCard['Card'];
      String cardContent = randomCard['Content'];

        showDialog(
          // ignore: use_build_context_synchronously
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(

              title:  Center(child: Column(
                children: [
                  Text('คำทำนาย$cardTitle', style: const TextStyle(fontSize: 20,fontWeight: FontWeight.w800),),

                ],
              )),
              
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right:20 ,left: 20),
                    child: Text(cardContent, style: const TextStyle(fontSize: 16,),textAlign: TextAlign.justify,),
                  ),
                ],
              ),
          );
        },
      );     
    }
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
         title: const Padding(
          padding: EdgeInsets.all(30),
          child: Center(
            child: Text(
              'แตะเซียมซีเพื่อรับคำทำนาย',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800, color: Color.fromRGBO(255, 255, 255, 1),),
            ),
          ),
        ),
      ),

        body: Expanded(
          child: Stack(
            alignment: Alignment.center,
            children: [
              Container(
                width:400, 
                height: 430,
                decoration: const BoxDecoration(
                  color: Color.fromRGBO(248, 176, 66, 1), 
                  shape: BoxShape.circle,
                ),
              ),
              
              Center(child: Text("幸 福", 
                style: TextStyle(fontSize: 150, fontWeight: FontWeight.w800,
                foreground: Paint()
                  ..style = PaintingStyle.stroke
                  ..color = Colors.white )),
            ),
              Expanded(
                child: InkWell(
                  splashColor:const Color.fromRGBO(248, 176, 66, 1), 
                  onTap: () {
                      playSound();
                      showPopup(); 
                  },
                  child: Image.asset(
                    'assets/IMG_0209.png',
                    width: 800,
                    height: 800,
                  ).animate(target: isAnimating? 1 : 0,).shake(duration: 1000.ms)
                )
              ),
            ],
          ),
        ),
    );
  }
}
