import 'package:flutter/material.dart';
import '../../shared/theme.dart';
import '../../ui/widget/custome_button.dart';

class GetStartedPage extends StatelessWidget {
  const GetStartedPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/image_get_started.png"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  "Fly Like a Bird",
                  style: whiteTextStyle.copyWith(
                    fontSize: 32,
                    fontWeight: semibold,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "Explore new world with us and let\nyourself get an amazing experiences",
                  textAlign: TextAlign.center,
                  style: whiteTextStyle.copyWith(
                    fontSize: 18,
                    fontWeight: light,
                  ),
                ),
                CostumeButton(
                  title: "Get Started",
                  width: 220,
                  margin: const EdgeInsets.only(
                    top: 50,
                    bottom: 80,
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, '/sign-up');
                  },
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
