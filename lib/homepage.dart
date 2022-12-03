import 'package:flutter/material.dart';
import 'package:test_flutter/constants/styles.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      body: Center(
        child: Wrap(
          runSpacing: 20,
          spacing: 20,
          children: [
            GestureDetector(
              onTap: () => Navigator.pushNamed(context, '/test-api'),
              child: Container(
                height: 150,
                width: 150,
                decoration: const BoxDecoration(
                    color: redColor,
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Test API',
                      textAlign: TextAlign.center,
                      style: whiteTextStyle.copyWith(
                          fontSize: 24, fontWeight: semiBold),
                    ),
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () => Navigator.pushNamed(context, '/upload'),
              child: Container(
                height: 150,
                width: 150,
                decoration: const BoxDecoration(
                    color: redColor,
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Upload',
                      textAlign: TextAlign.center,
                      style: whiteTextStyle.copyWith(
                          fontSize: 24, fontWeight: semiBold),
                    ),
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () => Navigator.pushNamed(context, '/map'),
              child: Container(
                height: 150,
                width: 150,
                decoration: const BoxDecoration(
                    color: redColor,
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Maps',
                      textAlign: TextAlign.center,
                      style: whiteTextStyle.copyWith(
                          fontSize: 24, fontWeight: semiBold),
                    ),
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () => Navigator.pushNamed(context, '/coffee'),
              child: Container(
                height: 150,
                width: 150,
                decoration: const BoxDecoration(
                    color: redColor,
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Coffee',
                      textAlign: TextAlign.center,
                      style: whiteTextStyle.copyWith(
                          fontSize: 24, fontWeight: semiBold),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
