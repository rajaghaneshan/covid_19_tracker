import 'package:covid_19_tracker/constants.dart';
import 'package:flutter/material.dart';

class FAQPage extends StatelessWidget {
  const FAQPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[900]!.withOpacity(0.2),
        title: Text('FAQ'),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios),
        ),
      ),
      backgroundColor: Colors.blue[900]!.withOpacity(0.2),
      body: ListView.builder(
          itemCount: questionAnswers.length,
          itemBuilder: (BuildContext context, index) {
            return ExpansionTile(
              title: Text(
                questionAnswers[index]['question'],
                style: TextStyle(
                    fontSize: 18,
                    letterSpacing: 1.2,
                    fontWeight: FontWeight.bold),
              ),
              children: [
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Text(
                    questionAnswers[index]['answer'],
                    style: TextStyle(
                      fontSize: 16,
                      wordSpacing: 1.2,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                )
              ],
            );
          }),
    );
  }
}
