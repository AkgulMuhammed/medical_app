import 'package:flutter/material.dart';

import '../../constants/const.dart';

class DoctorCards extends StatelessWidget {
  const DoctorCards({
    Key? key,
  }) : super(key: key);

  final double dividerheight = 2.0;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: _dateAndStatus(),
          ),
          Divider(height: dividerheight, color: Colors.grey),
          const SizedBox(
            height: 5,
          ),
          _mapIcon(),
          const Divider(height: 2, color: Colors.grey),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.person,
                      color: Colors.blue,
                    ),
                    SizedBox(width: 5),
                    Text('Mr. Joe Bloggs | Age :31 Y')
                  ],
                ),
                Container(
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Text('Complete',style: Theme.of(context).textTheme.labelLarge?.copyWith(color: Colors.green),),
                  ),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.green.withOpacity(0.1)),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Padding _mapIcon() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          const circularImage(),
          const CardDoctorInfoTexts(),
          Column(
            children: const [
              Icon(
                Icons.location_on_rounded,
                color: Colors.blue,
              ),
              Text(
                'Map',
                style: TextStyle(color: Colors.blue),
              )
            ],
          )
        ],
      ),
    );
  }
}

class _dateAndStatus extends StatelessWidget {
  const _dateAndStatus({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Sat, 4 April 2020 3.15 PM',
          style: Theme.of(context)
              .textTheme
              .labelLarge
              ?.copyWith(color: Colors.black54),
        ),
        _cardOnlineGroups()
      ],
    );
  }
}

class _cardOnlineGroups extends StatelessWidget {
  const _cardOnlineGroups({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        Icon(
          Icons.circle,
          color: Colors.green,
          size: 12,
        ),
        SizedBox(width: 5),
        Text('Online'),
        SizedBox(width: 10),
        Icon(
          Icons.more_vert,
          color: Colors.black54,
        )
      ],
    );
  }
}

class circularImage extends StatelessWidget {
  const circularImage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 100,
      decoration: BoxDecoration(
        border: Border.all(width: 5, color: Colors.green.shade500),
        borderRadius: BorderRadius.circular(100),
      ),
      child: ClipRRect(
          borderRadius: BorderRadius.circular(100),
          child: Image.asset(
            MedicalConst.doctor,
            fit: BoxFit.cover,
          )),
    );
  }
}

class CardDoctorInfoTexts extends StatelessWidget {
  const CardDoctorInfoTexts({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Dr. Daniela Morris',
          style: Theme.of(context)
              .textTheme
              .titleMedium
              ?.copyWith(color: Colors.blue),
        ),
        Text(
          'Ophthamology',
          style: Theme.of(context)
              .textTheme
              .labelMedium
              ?.copyWith(color: Colors.grey),
        ),
        Text(
          'Churchtown Medical',
          style: Theme.of(context)
              .textTheme
              .subtitle2
              ?.copyWith(color: Colors.black),
        ),
      ],
    );
  }
}
