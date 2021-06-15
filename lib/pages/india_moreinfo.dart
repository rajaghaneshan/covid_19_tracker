import 'package:covid_19_tracker/constants.dart';
import 'package:flutter/material.dart';

class India extends StatelessWidget {
  final Map data;
  const India({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kAppBarColor,
        title: Hero(
          tag: 'Mask',
          child: Image.asset(
            'asset/icons/mask.png',
            height: 80,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios)),
      ),
      body: Padding(
        padding: EdgeInsets.all(10.0),
        child: Column(
          children: [
            Image.asset(
              'asset/images/corona_lab.png',
              height: 100,
            ),

            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Text(
                "INDIA DATA",
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2),
              ),
            ),
            ListView(
              shrinkWrap: true,
              children: [
                Cards(
                  title: 'TOTAL CASES',
                  countData: data['cases'].toString(),
                  color: Colors.red,
                ),
                Cards(
                  title: 'TODAY CASES',
                  countData: data['todayCases'].toString(),
                  color: Colors.red.shade100,
                ),
                Cards(
                  title: 'DEATHS',
                  countData: data['deaths'].toString(),
                  color: Colors.yellow,
                ),
                Cards(
                  title: 'TODAY DEATHS',
                  countData: data['todayDeaths'].toString(),
                  color: Colors.yellow.shade100,
                ),
                Cards(
                  title: 'RECOVERED',
                  countData: data['recovered'].toString(),
                  color: Colors.green,
                ),
                Cards(
                  title: 'TODAY RECOVERED',
                  countData: data['todayRecovered'].toString(),
                  color: Colors.green.shade100,
                ),
                Cards(
                  title: 'ACTIVE',
                  countData: data['active'].toString(),
                  color: Colors.blue,
                ),
              ],
            ),
            // GridView.builder(gridDelegate: gridDelegate, itemBuilder: itemBuilder)
          ],
        ),
      ),
    );
  }
}

class Cards extends StatelessWidget {
  final String title;
  final String countData;
  final Color color;
  const Cards({
    Key? key,
    required this.title,
    required this.countData,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      color: color,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text(
                title,
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.5,
                    fontSize: 16),
              ),
            ),
          ),
          Expanded(
            child: Text(
              ":    $countData",
              style: TextStyle(
                  color: Colors.black, letterSpacing: 1, fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}
