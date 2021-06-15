import 'package:flutter/material.dart';

class IndiaDataContainer extends StatelessWidget {
  final Map? indiaData;
  IndiaDataContainer({ Key? key , required this.indiaData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 3,
                    child: Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          countContainer(title: 'CONFIRMED',data: indiaData!['cases'].toString(), color: Colors.red),
                          countContainer(title: 'ACTIVE',data: indiaData!['active'].toString(), color: Colors.blue),
                          countContainer(
                              title: 'RECOVERED',data: indiaData!['recovered'].toString(), color: Colors.green),
                          countContainer(title: 'DEATHS',data: indiaData!['deaths'].toString(), color: Colors.black)
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Container(
                      child: Image.asset('asset/images/covid_image.png'),
                    ),
                  )
                ],
              );
  }
  Padding countContainer({required String title,required String data, required Color color}) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 6.0),
      child: Container(
        width: 240,
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.white,
        ),
        // decoration: ,
        child: Text(
          "$title : $data",
          style: TextStyle(
              color: color, fontSize: 18, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}
