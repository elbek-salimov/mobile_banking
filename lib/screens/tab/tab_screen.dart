import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_banking/screens/tab/cards/cards_screen.dart';
import 'package:mobile_banking/screens/tab/pay/pay_screen.dart';
import 'package:mobile_banking/screens/tab/profile/profile_screen.dart';
import 'package:mobile_banking/screens/tab/statistics/statistics_screen.dart';
import 'package:size_util/size_util.dart';

import '../../blocs/tab/tab_bloc.dart';
import '../../blocs/tab/tab_event.dart';
import '../../blocs/tab/tab_state.dart';
import '../../utils/images/app_images.dart';
import '../routes.dart';
import 'home/home_screen.dart';

class TabScreen extends StatefulWidget {
  const TabScreen({super.key});

  @override
  State<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  List<Widget> screens = [
    const HomeScreen(),
    const StatisticsScreen(),
    const PayScreen(),
    const CardsScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: BlocBuilder<BottomBloc, ChangeIndexState>(
        builder: (context, state) {
          return IndexedStack(
            index: state.index,
            children: screens,
          );
        },
      ),
      bottomNavigationBar: BlocBuilder<BottomBloc, ChangeIndexState>(
        builder: (context, state) {
          return BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            showUnselectedLabels: true,
            unselectedItemColor: Colors.grey,
            fixedColor: Colors.green,
            currentIndex: state.index,
            onTap: (index) {
              context.read<BottomBloc>().add(ChangeIndexEvent(index: index));
            },
            items: [
              BottomNavigationBarItem(
                icon: Image.asset(AppImages.home, height: 25.h),
                label: "Home",
                activeIcon: Image.asset(AppImages.home,
                    height: 25.h, color: Colors.green),
              ),
              BottomNavigationBarItem(
                icon: Image.asset(AppImages.statistics, height: 25.h),
                label: "Statistics",
                activeIcon: Image.asset(AppImages.statistics,
                    height: 25.h, color: Colors.green),
              ),
              BottomNavigationBarItem(
                  icon: SizedBox(height: 25.h), label: 'Pay'),
              BottomNavigationBarItem(
                icon: Image.asset(AppImages.cards, height: 25.h),
                label: "Cards",
                activeIcon: Image.asset(AppImages.cards,
                    height: 25.h, color: Colors.green),
              ),
              BottomNavigationBarItem(
                icon: Image.asset(AppImages.profile, height: 25.h),
                label: "Profile",
                activeIcon: Image.asset(AppImages.profile,
                    height: 25.h, color: Colors.green),
              )
            ],
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        elevation: 0,
        backgroundColor: Colors.green,
        child: Container(
          margin: EdgeInsets.all(10.h),
          decoration: BoxDecoration(shape: BoxShape.circle, boxShadow: [
            BoxShadow(
              color: Colors.green.withOpacity(0.4),
              spreadRadius: 16.w,
            )
          ]),
          child: Image.asset(AppImages.pay),
        ),
        onPressed: () {
          Navigator.pushNamed(context, RouteNames.payScreen);
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
