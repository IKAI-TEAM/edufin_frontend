import 'package:edufin/constants.dart';
import 'package:edufin/screens/activity/activity_screen.dart';
import 'package:edufin/screens/chat/chat_screen.dart';
import 'package:edufin/screens/home/home_screen.dart';
import 'package:edufin/screens/profile/profile._screen.dart';
import 'package:edufin/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NavBar extends StatefulWidget {
  const NavBar({
    super.key,
    required this.currentTab,
  });
  final int currentTab;
  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int currentIndex = 0;
  List activePages = [];
  List pages = [
    HomePage.routeName,
    ActivityScreen.routeName,
    ProfileScreen.routeName,
    ChatScreen.routeName,
  ];

  @override
  void initState() {
    activePages = [
      ...List.generate(4, (index) {
        if (widget.currentTab == index) {
          return 'active';
        } else {
          return 'nonactive';
        }
      })
    ];
    super.initState();
  }

  void onTap(int index) {
    setState(() {
      currentIndex = index;

      for (var i = 0; i < 4; i++) {
        activePages[i] = 'nonactive';
      }

      activePages[index] = 'active';

      Navigator.pushNamed(
        context,
        pages[index],
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: kBackgroundColor,
      notchMargin: 10,
      child: SizedBox(
        height: 60,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Material(
              color: kBackgroundColor,
              child: Center(
                child: InkWell(
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () {
                    setState(() {
                      onTap(0);
                    });
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        'assets/icons/${activePages[0]}/home.svg',
                        width: getProportionateScreenHeight(25),
                        height: getProportionateScreenHeight(25),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Material(
              color: kBackgroundColor,
              child: Center(
                child: InkWell(
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () {
                    setState(() {
                      onTap(1);
                    });
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        'assets/icons/${activePages[1]}/transaction.svg',
                        width: getProportionateScreenHeight(25),
                        height: getProportionateScreenHeight(25),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              width: getProportionateScreenWidth(20),
            ), //to make space for the floating button
            Material(
              color: kBackgroundColor,
              child: Center(
                child: InkWell(
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () {
                    setState(() {
                      onTap(2);
                    });
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        'assets/icons/${activePages[2]}/cash.svg',
                        width: getProportionateScreenHeight(25),
                        height: getProportionateScreenHeight(25),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Material(
              color: kBackgroundColor,
              child: Center(
                child: InkWell(
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () {
                    setState(() {
                      onTap(3);
                    });
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        'assets/icons/${activePages[3]}/card.svg',
                        width: getProportionateScreenHeight(25),
                        height: getProportionateScreenHeight(25),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
