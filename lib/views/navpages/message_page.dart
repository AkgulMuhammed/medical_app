import 'package:flutter/material.dart';

class MessagePage extends StatelessWidget {
  const MessagePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text('Message Page',style: Theme.of(context).textTheme.headline3?.copyWith(color: Colors.black)),
      ),
    );
  }
}
