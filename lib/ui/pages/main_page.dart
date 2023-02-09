// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import '/cubit/page_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '/ui/pages/setting_page.dart';
import '/ui/pages/transaction_page.dart';
import '/ui/pages/wallet_page.dart';
import '/shared/theme.dart';
import '/ui/widget/custome_bottom_navigation_item.dart';
import '../pages/home_page.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget buildContent(int currentIndex) {
      switch (currentIndex) {
        case 0:
          return HomePage();
        case 1:
          return TransactionPage();
        case 2:
          return WalletPage();
        case 3:
          return SettingPage();
        default:
          return HomePage();
      }
    }

    Widget customeButtonNavigation() {
      return Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          margin: EdgeInsets.only(
            left: defaultMargin,
            right: defaultMargin,
            bottom: 30,
          ),
          width: double.infinity,
          height: 60,
          decoration: BoxDecoration(
            color: kWhiteColor,
            borderRadius: BorderRadius.circular(18),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CustomeBottomNavigationItem(
                index: 0,
                imageUrl: "assets/icon_home.png",
              ),
              CustomeBottomNavigationItem(
                index: 1,
                imageUrl: "assets/icon_booking.png",
              ),
              CustomeBottomNavigationItem(
                index: 2,
                imageUrl: "assets/icon_card.png",
              ),
              CustomeBottomNavigationItem(
                index: 3,
                imageUrl: "assets/icon_settings.png",
              ),
            ],
          ),
        ),
      );
    }

    return BlocBuilder<PageCubit, int>(
      builder: (context, currentIndex) {
        return Scaffold(
          body: Stack(
            children: [
              buildContent(currentIndex),
              customeButtonNavigation(),
            ],
          ),
        );
      },
    );
  }
}
