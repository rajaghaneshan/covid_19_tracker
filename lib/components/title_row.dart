import 'package:covid_19_tracker/constants.dart';
import 'package:flutter/material.dart';

class TitleRow extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  final String? data;
  const TitleRow(
      {Key? key, required this.title, required this.onPressed, this.data})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Text(
                title,
                style: kTitleRowTS,
              ),
              data == null
                  ? Container()
                  : Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Image.network(
                        data!,
                        height: 20,
                      ),
                    ),
            ],
          ),
          IconButton(
            onPressed: onPressed,
            icon: Icon(Icons.arrow_forward_ios_outlined, color: Colors.blue.shade200,),
          ),
        ],
      ),
    );
  }
}