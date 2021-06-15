import 'package:covid_19_tracker/constants.dart';
import 'package:flutter/material.dart';

class InfoPanel extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  const InfoPanel({
    Key? key,
    required this.title,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: GestureDetector(
        onTap: onPressed,
        child: Container(
          height: 50,
          decoration: BoxDecoration(
            color: Colors.deepPurple.shade900,
            boxShadow: [
              BoxShadow(
                color: Colors.black,
                offset: Offset(2.0, 2.0),
                blurRadius: 6.0,
              )
            ],
          ),
          padding: EdgeInsets.symmetric(vertical: 4, horizontal: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: kInfoPanelTS,
              ),
              Icon(Icons.arrow_forward_ios),
            ],
          ),
        ),
      ),
    );
  }
}
