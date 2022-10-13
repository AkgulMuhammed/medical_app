import 'package:flutter/material.dart';
import 'package:flutter_medical_app/constants/const.dart';
import 'package:flutter_medical_app/views/login_page.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  late PageController _pageController;
  int currentpage = 0;
  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    super.initState();
    _pageController.addListener(() {
      setState(() {
        currentpage = _pageController.page!.toInt();
      });
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(
        children: [
          Expanded(
            child: PageView.builder(
                itemCount: onboardData.length,
                controller: _pageController,
                itemBuilder: (context, index) => OnboardContent(
                    image: onboardData[index].image,
                    title: onboardData[index].title,
                    description: onboardData[index].description)),
          ),
          Padding(
            padding: const EdgeInsets.all(45.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('${currentpage + 1}/' + onboardData.length.toString()),
                MaterialButton(
                 
                  onPressed: () {
                    _pageController.nextPage(
                        duration: const Duration(milliseconds: 700),
                        curve: Curves.ease);
                    if (currentpage == 2) {
                      Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: ((context) => LoginPage())));
                    }
                  },
                  child: Text('Next'),
                ),
              ],
            ),
          )
        ],
      ),
    ));
  }
}

class Onboard {
  final String image, title, description;

  Onboard({
    required this.image,
    required this.title,
    required this.description,
  });
}

final List<Onboard> onboardData = [
  Onboard(
    image: MedicalConst.onboardScreenImageOne,
    title: MedicalConst.onboardScreenTitleOne,
    description: MedicalConst.onboardScreenDescriptionOne,
  ),
  Onboard(
    image: MedicalConst.onboardScreenImageTwo,
    title: MedicalConst.onboardScreenTitleTwo,
    description: MedicalConst.onboardScreenDescriptionTwo,
  ),
  Onboard(
    image: MedicalConst.onboardScreenImageThree,
    title: MedicalConst.onboardScreenTitleThree,
    description: MedicalConst.onboardScreenDescriptionThree,
  )
];

class OnboardContent extends StatelessWidget {
  const OnboardContent({
    Key? key,
    required this.image,
    required this.title,
    required this.description,
  }) : super(key: key);

  final String image, title, description;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Spacer(),
        Padding(
          padding: const EdgeInsets.only(right: 20, top: 20, bottom: 20),
          child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
            TextButton(
              style: const ButtonStyle(),
              onPressed: () {
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: ((context) => LoginPage())));
              },
              child: Text('Skip'),
            ),
          ]),
        ),
        Image.asset(
          image,
          height: 300,
        ),
        const Spacer(),
        Text(title,
            textAlign: TextAlign.center,
            style: Theme.of(context)
                .textTheme
                .headline4
                ?.copyWith(color: Colors.black)),
        const SizedBox(height: 13),
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Text(
            description,
            textAlign: TextAlign.center,
          ),
        ),
        const Spacer(),
      ],
    );
  }
}
