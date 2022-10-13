import 'package:flutter/material.dart';

import '../widgets/custom_Appbar.dart';
import '../widgets/doctor_cards.dart';

class AppointmentPage extends StatelessWidget {
  const AppointmentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const CustomAppbar(),
            Container(
              height: MediaQuery.of(context).size.height/1.6,
              child: ListView(
                children: const [
                  DoctorCards(),
                  DoctorCards(),
                  DoctorCards(),
                ],
              ),
            ),
            SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: SizedBox(height: MediaQuery.of(context).size.height/13,width: MediaQuery.of(context).size.width,
                child: ElevatedButton(onPressed: () {}, child: Text('New Appointment',style: Theme.of(context).textTheme.headline6?.copyWith(color: Colors.white),))),
            )
          ],
        ),
      ),
    );
  }
}
