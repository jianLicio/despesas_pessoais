import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdaptativeButton extends StatelessWidget {
  final String label;
  final Function() onPressed;

  const AdaptativeButton(
      {Key? key, required this.label, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? CupertinoButton(
            child: Text(
              label,
              style: TextStyle(
                color: Theme.of(context).primaryColor,
              ),
            ),
            onPressed: onPressed)
        : ElevatedButton(
            // style: Theme.of(context).textTheme.button.color,
            child: Text(
              label,
              style: const TextStyle(color: Colors.white, fontSize: 22),
            ),
            onPressed: onPressed,
          );
  }
}
