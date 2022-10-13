import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
     return Center(
       child: Container(
        child: Center(
          child: Text('Profile Page',style: Theme.of(context).textTheme.headline3?.copyWith(color: Colors.black)),
        ),
    ),
     );
  }
}