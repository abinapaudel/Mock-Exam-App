// import 'package:accordion/accordion.dart';
import 'package:flutter/material.dart';

class FAQ extends StatefulWidget {
  @override
  _FAQState createState() => _FAQState();
}

class _FAQState extends State<FAQ> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        height: MediaQuery.of(context).size.height*0.08,
      ),
      appBar: AppBar(backgroundColor: Colors.indigo, title: Text(" FAQ")),
      body: FAQItems(),
    );
  }
}

class FAQItems extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Card qnatiles(String title, String des, String number) {
      return Card(
        child: ExpansionTile(
          leading: CircleAvatar(
              backgroundColor: Colors.indigo, child: Text("$number")),
          title: Text(
            "$title",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15.0),
          ),
          children: <Widget>[
            Divider(
              height: 0,
            ),
            Padding(
              padding: EdgeInsets.all(10.0),
              child: Text("$des", textAlign: TextAlign.start,),
            )
          ],
        ),
      );
    }

    return SingleChildScrollView(
      child: Center(
          child: Column(
        children: <Widget>[
          qnatiles(
              "When the exams of health assistant license exams are taken?",
              "The exams of health assistant are taken place in the period of every 3 months",
              "1"),
          qnatiles(
              "How long does the exam of health assistant license exams are taken ?",
              "The exam of health assistant license exams are taken2 hours",
              "2"),
          qnatiles("For how long does the health assistant license work ?",
              "The health assistant license work for the period of five years", "3"),
          qnatiles(
              "What is NHPC?",
              "Nepal Health Professional Council (NHPC) is a autonomous body established under the Nepal Health Professional Council Act 2053. The aim of this council is to register all the health professionals other than medical doctors and nurses according to their qualification; and bring them into a legal system as to make their services effective and timely, and in a scientific manner.",
              "4"),
          qnatiles(
              "How can I contact NHPC?",
              "Phone: 977-1-4373118, 977-1-4373118; Post Box No. 13839 E-mail: admin@nhpc.gov.np",
              "5"),
          qnatiles("Can I get government job by having the Health Assistant License Exam ",
              "Of course you can fight for the government job if you have the Health Assistant License Exam", "6"),
         
          qnatiles(
              "What is the fullform of NHPC",
              "The fullform of NHPC is Nepal Health Professional Council",
              "7"),
          qnatiles(
              "Can I pass entrance if I complete all the questions in this app?",
              "Yeah, if you complete all the sets in this app you will certainly obatin marks between (60-85)",
              "8"),
          qnatiles(
              "From where I can view the results?",
              "You can view the results from the site https://nhpc.gov.np/result ",
              "9"),
          qnatiles(
              "Why there are ads in app?",
              "As I am a student ,Ads are the only way that I can offer cup of coffee to my team for their hardwork. I will remove all ads once i get job.   ",
              "10")
        ],
      )),
    );
  }
}