import 'dart:convert';

import 'package:covid_19_tracker/components/info_panel.dart';
import 'package:covid_19_tracker/components/india_data.dart';
import 'package:covid_19_tracker/constants.dart';
import 'package:covid_19_tracker/pages/faq_page.dart';
import 'package:covid_19_tracker/pages/india_moreinfo.dart';
import 'package:covid_19_tracker/components/title_row.dart';
import 'package:covid_19_tracker/components/top_countries.dart';
import 'package:covid_19_tracker/pages/search_page.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ScrollController _controller = ScrollController();
  Map? indiaData;
  fetchIndiaData() async {
    http.Response response = await http.get(
        Uri.parse('https://corona.lmao.ninja/v3/covid-19/countries/india'));
    setState(() {
      indiaData = json.decode(response.body);
    });
  }

  List? worldData;
  fetchWorldData() async {
    http.Response response = await http.get(Uri.parse(
        'https://corona.lmao.ninja/v3/covid-19/countries?sort=cases'));
    setState(() {
      worldData = json.decode(response.body);
    });
  }

  Future fetchData() async {
    fetchIndiaData();
    fetchWorldData();
  }

  @override
  void initState() {
    fetchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kAppBarColor,
        elevation: 5,
        leadingWidth: 80,
        leading: Hero(
          tag: 'Mask',
          child: Image.asset(
            'asset/icons/mask.png',
          ),
        ),
        title: Text(
          "COVID-19 TRACKER",
        ),
        centerTitle: true,
      ),
      body: RefreshIndicator(
        onRefresh: fetchData,
        child: indiaData == null
            ? Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircularProgressIndicator(
                      color: Colors.white,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "WEAR MASK",
                      style: kQuoteTextStyle,
                    ),
                    Text(
                      'STAY SAFE',
                      style: kQuoteTextStyle,
                    )
                  ],
                ),
              )
            : SingleChildScrollView(
                physics: ScrollPhysics(),
                controller: _controller,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8.0,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TitleRow(
                          title: 'INDIA',
                          data: indiaData!['countryInfo']['flag'],
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => India(data: indiaData!),
                              ),
                            );
                          }),
                      indiaData == null
                          ? Center(
                              child: CircularProgressIndicator(),
                            )
                          : IndiaDataContainer(indiaData: indiaData),
                      TitleRow(
                        title: 'TOP COUNTRIES',
                        data: null,
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SearchPage(),
                            ),
                          );
                        },
                      ),
                      worldData == null
                          ? Center(
                              child: CircularProgressIndicator(),
                            )
                          : TopCountriesContainer(
                              countryData: worldData!,
                            ),
                      SizedBox(
                        height: 10,
                      ),
                      InfoPanel(
                        title: 'FAQ',
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => FAQPage(),
                            ),
                          );
                        },
                      ),
                      InfoPanel(
                        title: 'CHECK BED AVAILABILITY',
                        onPressed: () {
                          launch('https://tncovidbeds.tnega.org/');
                        },
                      ),
                      InfoPanel(
                        title: 'VISIT COWIN',
                        onPressed: () {
                          launch('https://www.cowin.gov.in/home');
                        },
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        height: 50,
                        color: Colors.white,
                        child: Center(
                          child: Text(
                            'WE ARE IN THIS TOGETHER',
                            style: kQuoteTextStyle.copyWith(
                                color: Colors.blue.shade900),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}
