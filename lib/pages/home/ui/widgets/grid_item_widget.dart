import 'package:flutter/material.dart';

import 'package:division/division.dart';

class GridItemWidget extends StatelessWidget {
  const GridItemWidget(
      {Key? key,
      required this.onPressed,
      required this.icon,
      required this.title})
      : super(key: key);

  final Function() onPressed;
  final IconData icon;
  final String title;
  
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      child: InkWell(
        onTap: () => onPressed(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              child: Parent(
                style: ParentStyle(),
                child: Icon(
                  icon,
                  size: 40,
                  color: Colors.grey,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(title),
            )
          ],
        ),
      ),
    );
  }
}
