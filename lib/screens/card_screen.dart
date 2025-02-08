import 'package:audioplayers/audioplayers.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:qiuqiao/components/detail_screen.dart';

class CardScreen extends StatefulWidget {
  const CardScreen({super.key});

  @override
  State<CardScreen> createState() => _CardScreenState();
}

class _CardScreenState extends State<CardScreen> {
  final CollectionReference fetchData = FirebaseFirestore.instance.collection("card");

  final AudioPlayer player = AudioPlayer();  

  void playSound() async {
    await player.play(AssetSource('audio/pop.mp3'));  
  }

  final List<Color> cardColors = [
    const Color.fromRGBO(157, 189, 186, 1), 
    const Color.fromRGBO(248, 176, 66, 1), 
    const Color.fromRGBO(236, 106, 82, 1),
  ];

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
              'ใบเซียมซีทั้งหมด 24 ใบ',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800, color: Colors.white),
            ),
          ),
        ),
      ),
      
      backgroundColor: Colors.white,
      body: StreamBuilder(
        stream: fetchData.orderBy('Num').snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
          if (streamSnapshot.hasData) {
            return Padding(
              padding: const EdgeInsets.only(right:40 ,left:40 ,top:5 ,bottom:15),
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 3,
                  mainAxisSpacing: 3,
                  childAspectRatio: 1.5,
                ),
                itemCount: streamSnapshot.data!.docs.length,
                itemBuilder: (context, index) {

                  final DocumentSnapshot documentSnapshot = streamSnapshot.data!.docs[index];

                  return Padding(
                    padding: const EdgeInsets.all(5),
                    child: Material(
                      borderRadius: BorderRadius.circular(20),
                      color: cardColors[index % 3],
                      child: InkWell(
                        borderRadius: BorderRadius.circular(20),
                        onTap: () {
                          playSound();
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DetailScreen(
                                cardTitle: documentSnapshot['Card'],
                                cardContent: documentSnapshot['Content'],
                              ),
                            ),
                          );
                        },
                        child: Center(
                          child: Text(
                            documentSnapshot['Card'],
                            textAlign: TextAlign.center,
                            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w800, color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}

