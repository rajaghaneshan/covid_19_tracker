import 'package:covid_19_tracker/constants.dart';
import 'package:flutter/material.dart';

class TopCountriesContainer extends StatelessWidget {
  final List countryData;
  const TopCountriesContainer({
    Key? key,
    required this.countryData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List colors = [
      Colors.red,
      Colors.green,
      Colors.yellow,
      Colors.blue,
      Colors.orange
    ];
    return SizedBox(
      height: 230,
      child: ListView.builder(
        shrinkWrap: true,
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 22),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: colors[index],
                boxShadow: [
                  BoxShadow(
                    color: Colors.black,
                    offset: Offset(2.0, 2.0),
                    blurRadius: 6.0,
                  )
                ]
              ),
              width: 130,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.network(
                    countryData[index]['countryInfo']['flag'],
                    height: 30,
                  ),
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          countryData[index]['country'],
                          style: kCountryTitle,
                        ),
                        Text(
                          "cases : ${countryData[index]['cases'].toString()}",
                          style: kCountryCases,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        },
        itemCount: 5,
      ),
    );
  }
}
