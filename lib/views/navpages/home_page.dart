import 'package:flutter/material.dart';
import 'package:flutter_medical_app/constants/const.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const AppbarAndApointmentGroups(),
            GridView(shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              addAutomaticKeepAlives: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1.2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 5),
              children: const [
                CustomCard(
                  cardColor: Colors.blue,
                  icon: Icons.date_range,
                  iconcolor: Colors.white,
                  title: 'Book an Appointment',
                  titleColor: Colors.white,
                  subtitle: 'When a GP or Nurse',
                  subTitleColor: Colors.white,
                  indicatorcolor: Colors.white,
                ),
                CustomCard(
                  cardColor: Colors.white,
                  icon: Icons.note_alt_outlined,
                  iconcolor: Colors.blue,
                  title: 'Request a Prescription',
                  titleColor: Colors.black,
                  subtitle: 'We am for same day service',
                  subTitleColor: Colors.grey,
                  indicatorcolor: Colors.blue,
                ),
                CustomCard(
                  cardColor: Colors.white,
                  icon: Icons.settings_applications_outlined,
                  iconcolor: Colors.blue,
                  title: 'Administration Requests',
                  titleColor: Colors.black,
                  subtitle:
                      'Requests for Sick notes, driving licence forms, general admin',
                  subTitleColor: Colors.grey,
                  indicatorcolor: Colors.blue,
                ),
                CustomCard(
                  cardColor: Colors.white,
                  icon: Icons.notification_add,
                  iconcolor: Colors.blue,
                  title: 'Messages & Notifications',
                  titleColor: Colors.black,
                  subtitle: 'How va contact you',
                  subTitleColor: Colors.grey,
                  indicatorcolor: Colors.blue,
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(right: 20, left: 10),
              child: Text(
                'Discover',
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
            GridView(shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              addAutomaticKeepAlives: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1.0,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10),
              children: const [
                CustomImageCard(
                    title: 'Coronavirus - World Health',
                    subtitle: 'Organization',
                    image: MedicalConst.homePageCardImageTwo),
                CustomImageCard(
                    title: 'Coronavirus Update (Live):',
                    subtitle: '1,425,468 Casses and...',
                    image: MedicalConst.homePageCardImageOne),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class CustomImageCard extends StatelessWidget {
  const CustomImageCard({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.image,
  }) : super(key: key);
  final String title;
  final String subtitle;
  final String image;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 90,
              width: 200,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  image,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 20),
            FittedBox(
                child:
                    Text(title, style: TextStyle(fontWeight: FontWeight.bold))),
            SizedBox(height: 5),
            Text(
              subtitle,
              style: TextStyle(fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }
}

class CustomCard extends StatelessWidget {
  const CustomCard({
    Key? key,
    required this.icon,
    required this.iconcolor,
    required this.title,
    required this.titleColor,
    required this.subtitle,
    required this.subTitleColor,
    required this.indicatorcolor,
    required this.cardColor,
  }) : super(key: key);
  final IconData icon;
  final String title;
  final Color iconcolor, titleColor, subTitleColor, indicatorcolor, cardColor;
  final String subtitle;
  @override
  Widget build(BuildContext context) {
    return Card(
      color: cardColor,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Icon(
                icon,
                color: iconcolor,
                size: 40,
              ),
              FittedBox(
                child: Text(
                  title,
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium
                      ?.copyWith(color: titleColor),
                ),
              ),
              Text(subtitle,
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium
                      ?.copyWith(color: subTitleColor)),
              Container(
                width: 25,
                height: 2,
                color: indicatorcolor,
              )
            ]),
      ),
    );
  }
}

class AppbarAndApointmentGroups extends StatelessWidget {
  const AppbarAndApointmentGroups({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(40), topLeft: Radius.circular(40)),
              color: Colors.blue),
          height: MediaQuery.of(context).size.height / 3.5,
        ),
        const Padding(
          padding: EdgeInsets.only(right: 20, left: 20, top: 60),
          child: AppBarGroups(),
        )
      ],
    );
  }
}

class AppBarGroups extends StatelessWidget {
  const AppBarGroups({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            HelloUsersText(),
            MessageAndNotificationIcons(),
          ],
        ),
        const SizedBox(height: 30),
        const AppointmentGroup(),
      ],
    );
  }
}

class HelloUsersText extends StatelessWidget {
  const HelloUsersText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Hello ,',
          style: Theme.of(context)
              .textTheme
              .subtitle1
              ?.copyWith(color: Colors.white),
        ),
        Text('Makgul!',
            style: Theme.of(context)
                .textTheme
                .headline5
                ?.copyWith(color: Colors.white))
      ],
    );
  }
}

class MessageAndNotificationIcons extends StatelessWidget {
  const MessageAndNotificationIcons({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        Icon(
          Icons.mail_outline_rounded,
          color: Colors.white,
        ),
        SizedBox(width: 10),
        Icon(
          Icons.notifications_none,
          color: Colors.white,
        )
      ],
    );
  }
}

class cardwidget extends StatelessWidget {
  const cardwidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 100,
      color: Colors.amber,
    );
  }
}

class AppointmentGroup extends StatelessWidget {
  const AppointmentGroup({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
          ),
          height: 75,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Appointment Due in 7 mins',
                    style: Theme.of(context)
                        .textTheme
                        .labelMedium
                        ?.copyWith(color: Colors.grey),
                  ),
                  SizedBox(height: 5),
                  Text(
                    'Enter The Waiting Room',
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium
                        ?.copyWith(color: Colors.black),
                  )
                ],
              ),
              Container(
                child: Icon(
                  Icons.arrow_forward,
                  color: Colors.white,
                ),
                decoration: BoxDecoration(
                    color: Colors.blue.shade500,
                    borderRadius: BorderRadius.circular(5)),
                width: 60,
                height: 60,
              )
            ],
          ),
        )
      ],
    );
  }
}
