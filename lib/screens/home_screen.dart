import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:grocery_app/inner_screens/on_sale_screen.dart';
import 'package:grocery_app/services/global_methods.dart';
import 'package:grocery_app/services/utils.dart';
import 'package:grocery_app/widgets/text_widget.dart';

import '../inner_screens/feeds_screen.dart';
import '../widgets/feed_items.dart';
import '../widgets/on_sale_widget.dart';

class HomerScreen extends StatefulWidget {
  const HomerScreen({Key? key}) : super(key: key);

  @override
  State<HomerScreen> createState() => _HomerScreenState();
}

class _HomerScreenState extends State<HomerScreen> {
  final List<String> _offesImages = [
    'assets/images/offes/Offer1.jpg',
    'assets/images/offes/Offer2.jpg',
    'assets/images/offes/Offer3.jpg',
    'assets/images/offes/Offer4.jpg'
  ];
  @override
  Widget build(BuildContext context) {
    final Utils utils = Utils(context);
    final themeState = Utils(context).getTheme;
    final Color color = Utils(context).color;
    Size size = utils.getScreenSize;
    GlobalMethods globalMethods = GlobalMethods();
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: size.height * 0.33,
              child: Swiper(
                itemBuilder: (BuildContext context, int index) {
                  return Image.asset(
                    _offesImages[index],
                    fit: BoxFit.fill,
                  );
                },
                autoplay: true,
                itemCount: _offesImages.length,
                pagination: const SwiperPagination(
                    alignment: Alignment.bottomCenter,
                    builder: DotSwiperPaginationBuilder(
                        color: Colors.white, activeColor: Colors.red)),
                // control: SwiperControl(color: Colors.amber),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            TextButton(
              onPressed: () {
                GlobalMethods.navigateTo(
                    ctx: context, routeName: OnSaleScreen.routeName);
              },
              child: TextWidget(
                text: 'View all',
                maxLine: 1,
                color: Colors.blue,
                textSize: 20,
                // isTitle: true,
              ),
            ),
            const SizedBox(
              height: 6,
            ),
            Row(
              children: [
                RotatedBox(
                  quarterTurns: -1,
                  child: Row(
                    children: [
                      TextWidget(
                        text: 'On Sale'.toUpperCase(),
                        color: Colors.red,
                        textSize: 22,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      const Icon(
                        IconlyLight.discount,
                        color: Colors.red,
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  width: 8,
                ),
                Flexible(
                  child: SizedBox(
                    height: size.height * 0.24,
                    child: ListView.builder(
                        itemCount: 10,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return const OnSaleWidget();
                        }),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextWidget(
                    text: 'Our Products',
                    color: color,
                    textSize: 22,
                    isTitle: true,
                  ),
                  TextButton(
                    onPressed: () {
                      GlobalMethods.navigateTo(
                          ctx: context, routeName: FeedsScreen.routeName);
                    },
                    child: TextWidget(
                      text: 'Browse all',
                      maxLine: 1,
                      color: Colors.blue,
                      textSize: 22,
                    ),
                  ),
                ],
              ),
            ),
            GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              padding: EdgeInsets.zero,
              // crossAxisSpacing: 10,
              childAspectRatio: size.width / (size.height * 0.67),
              children: List.generate(4, (index) {
                return const FeedsWidget();
              }),
            )
          ],
        ),
      ),
    );
  }
}

/*
SwitchListTile(
          title: Text("Theme"),
          secondary: Icon(themeState.getDarkTheme
              ? Icons.dark_mode_outlined
              : Icons.light_mode_outlined),
          onChanged: (bool value) {
            setState(
              () {
                themeState.setDarkTheme = value;
              },
            );
          },
          value: themeState.getDarkTheme,
        ),
*/
