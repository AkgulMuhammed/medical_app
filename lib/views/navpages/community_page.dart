import 'package:flutter/material.dart';

class CommunityPage extends StatelessWidget {
  const CommunityPage({super.key});

  @override
  Widget build(BuildContext context) {
     return Center(
       child: Container(
        child: Center(
          child: Text('Community Page',style: Theme.of(context).textTheme.headline3?.copyWith(color: Colors.black)),
        ),
    ),
     );
  }
}