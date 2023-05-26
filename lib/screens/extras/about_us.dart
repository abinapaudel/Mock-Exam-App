import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../datas/developer_data.dart';

class AboutusPage extends StatelessWidget {
  const AboutusPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 239, 238, 236),
      appBar: AppBar(
        title: Text('About Us'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                  child: Text(
                'HA License Preparation',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Quando"),
              )),
              Center(
                  child: Text(
                'Version 1.0.0',
                style: TextStyle(fontFamily: "Satisfy"),
              )),
              SizedBox(
                height: 15,
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(
                  20,
                ),
                child: Container(
                  // padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: Color.fromARGB(255, 219, 218, 216),
                      // border: Border.all(
                      //   color: Colors.indigo,
                      //   width: 2,
                      // ),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            blurRadius: 5,
                            spreadRadius: 2)
                      ]),
                  height: 200,
                  width: MediaQuery.of(context).size.width,
                  child: Image(
                    image: AssetImage('assets/images/doctor.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Container(
                    width: MediaQuery.of(context).size.width / 1.1,
                    child: Column(
                      children: [
                        Text(
                          'Welcome to our HA license preparation app, the ultimate tool for students who are looking to ace their exams. Our app is designed to help you study smarter, not harder, by providing you with a wealth of information and practice questions, all in one place.',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w400,
                              fontFamily: "Sofia"),
                        ),
                        Text(
                          'Whether you are preparing for a  test, entrance exam, or professional certification, our app has you covered. With a user-friendly interface and a vast database of questions, you will be able to easily find the information you need to succeed. Our app also includes practice exams, allowing you to test your knowledge and track your progress.With these app, you will have the tools you need to succeed, right at your fingertips.',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w400),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Development Team',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Quando"),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Wrap(
                    spacing: 10,
                    runSpacing: 20,
                    children: List.generate(
                      developers.length,
                      (index) => Container(
                        width: MediaQuery.of(context).size.width / 2.4,
                        decoration: BoxDecoration(
                            color: Color.fromARGB(255, 219, 218, 216),
                            borderRadius: BorderRadius.circular(10)),
                        child: Column(
                          children: [
                            CircleAvatar(
                                radius: 50,
                                backgroundImage:
                                    NetworkImage(developers[index]['image'])),
                            Text(
                              developers[index]['name'],
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  fontFamily: "Sofia"),
                            ),
                            Text(
                              '- ${developers[index]['role']}',
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 20,
                                  fontFamily: "Sofia"),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                IconButton(
                                  onPressed: () {
                                    launchUrl(Uri.parse(
                                        developers[index]['facebookUrl']));
                                  },
                                  icon: Icon(
                                    Icons.facebook,
                                    size: 40,
                                    color: Colors.blue,
                                  ),
                                ),
                                IconButton(
                                  onPressed: () {
                                    launchUrl(Uri.parse(
                                        developers[index]['instagramUrl']));
                                  },
                                  icon: Icon(
                                    LineAwesomeIcons.instagram,
                                    size: 40,
                                    color: Colors.red,
                                  ),
                                ),
                                IconButton(
                                  onPressed: () {
                                    launchUrl(Uri.parse(
                                        developers[index]["githubUrl"]));
                                  },
                                  icon: Icon(
                                    LineAwesomeIcons.github,
                                    size: 40,
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
