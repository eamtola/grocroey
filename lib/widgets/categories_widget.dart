import 'package:flutter/material.dart';
import 'package:grocery_app/providers/dark_theme_provider.dart';
import 'package:grocery_app/widgets/text_widget.dart';
import 'package:provider/provider.dart';

class CategoriesWidget extends StatelessWidget {
  const CategoriesWidget(
      {Key? key,
      required this.catText,
      required this.imgPath,
      required this.passedcolor})
      : super(key: key);
  final String catText, imgPath;
  final Color passedcolor;

  @override
  Widget build(BuildContext context) {
    // final themeState = Provider.of<DarkThemeProvider>(context);
    double _screenWidgeth = MediaQuery.of(context).size.width;
    // final Color passedcolor =
    //     themeState.getDarkTheme ? Colors.white : Colors.black;
    return InkWell(
      onTap: () {
        print('Category prossed');
      },
      child: Container(
        // height: _screenWidgeth * 0.6,
        decoration: BoxDecoration(
          color: passedcolor.withOpacity(0.1),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: passedcolor.withOpacity(0.7),
            width: 2,
          ),
        ),
        child: Column(
          children: [
            Container(
              height: _screenWidgeth * 0.3,
              width: _screenWidgeth * 0.3,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(
                        imgPath,
                      ),
                      fit: BoxFit.fill)),
            ),
            TextWidget(
              text: catText,
              color: passedcolor,
              textSize: 20,
              isTitle: true,
            ),
          ],
        ),
      ),
    );
  }
}
