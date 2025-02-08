import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  final imgList = [  
    Image.asset('assets/tn2.jpg'),
    Image.asset('assets/tn3.jpg'),
    Image.asset('assets/tn4.jpg'),
  ];

  int myCurrentIndex = 0;

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
              'เซียมซี',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800, color: Colors.white),
            ),
          ),
        ),
      ),
     body: SingleChildScrollView(
       child: SizedBox(
         child: Column(
           children: [
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: CarouselSlider(options: CarouselOptions(
                autoPlay: true,
                height: 200,
                autoPlayCurve: Curves.fastOutSlowIn,
                autoPlayAnimationDuration: const Duration(seconds: 4),
                enlargeCenterPage: true,
              
                onPageChanged: (index, reason) {
                  setState(() {
                    myCurrentIndex = index;
                  });
                }
              ),
              items: imgList ),
            ),
             const Padding(
               padding: EdgeInsets.only(right: 60, left: 60, top: 20, bottom: 20),
               child: SizedBox(
                 child: Column(
              children: [
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: 'เซียมซี',
                        style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color:Color.fromRGBO(248, 176, 66, 1),),
                      ),
                      TextSpan(
                        text: 'เป็นคำภาษาจีน เซียม แปลว่า แผ่นกระดาษที่มีขนาดเล็กและยาว ซี หมายถึง บทกลอน คำว่า เซียมซี ใช้เรียกใบทำนายโชคชะตาตามศาลเจ้าหรือวัด เขียนเป็นคำกลอน มีตัวเลขกำกับผู้ที่ต้องการคำทำนายจะอธิษฐานขอทราบความเป็นไปล่วงหน้าเกี่ยวกับเรื่องต่าง ๆ จากนั้นผู้เสี่ยงต้องพยายามเขย่ากระบอกให้ติ้วหรือซี่ไม้ไผ่เล็ก ๆ ที่มีตัวเลขกำกับอยู่ให้กระเด็นหลุดออกมาจากกระบอก 1 อัน เมื่อดูหมายเลขบนติ้วว่าได้เลขอะไร แล้วจึงไปหยิบกระดาษแผ่นคำทำนายที่มีเลขตรงกัน  คำทำนายส่วนใหญ่จะเป็นบทกลอนถ้าคำทำนายดีผู้เสี่ยงเซียมซีจะเก็บติดตัวไป แต่ถ้าคำทำนายไม่ดีก็จะทิ้งหรือเก็บไว้ที่วัดหรือศาลเจ้านั้น',
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                   textAlign: TextAlign.justify,
                ),
                SizedBox(height: 10),
                Divider(thickness: 2,),
             
                SizedBox(
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Column(
                          children: [
                            Text('ตั้งจิตอธิษฐานต่อสิ่งศักดิ์สิทธิ์ จากนั้นให้เลือกคำถามที่จะถามเป็นข้อๆ ไม่ใช่อย่างที่หลายท่านได้กระทำกันคือ เสี่ยงถามรวมในใบเดียว การตั้งจิตอธิฐานควรเลือกถามทีละปัญหา',
                            style: TextStyle(fontSize: 10),textAlign: TextAlign.justify
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                )
              ],
                 ),
               ),
               ),
           ],
         ),
       ),
     ));
  }
}