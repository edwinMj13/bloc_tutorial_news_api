import 'package:bloc_mini_project_new/features/on_boarding_screen/onboarding_model.dart';
import 'package:flutter/material.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {

  List<OnBoardModel> onboardingDemo = [
    OnBoardModel(
      image: 'assets/onboarding/onb-1.png', description: 'Description 1',),
    OnBoardModel(
      image: 'assets/onboarding/onb-2.jpg', description: 'Description 2',),
    OnBoardModel(
      image: 'assets/onboarding/onb-3.png', description: 'Description 3',)
  ];

  final pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          PageView.builder(
            itemCount: onboardingDemo.length,
            controller: pageController,
            itemBuilder: (context, index) {
              return BoardScreen(image: onboardingDemo[index].image,
                  description: onboardingDemo[index].description);
            },
          ),

        ],
      ),
    );
  }
}

class BoardScreen extends StatelessWidget {
  String image;
  String description;

  BoardScreen({super.key, required this.image, required this.description});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(image),
          Text(description),
        ],
      ),
    );
  }
}

