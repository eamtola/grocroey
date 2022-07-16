import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:provider/provider.dart';

import '../providers/dark_theme_provider.dart';
import '../widgets/text_widget.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({Key? key}) : super(key: key);

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  final TextEditingController _addressTextConttroller =
      TextEditingController(text: "");
  @override
  void dispose() {
    _addressTextConttroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final themeState = Provider.of<DarkThemeProvider>(context);
    final Color color = themeState.getDarkTheme ? Colors.white : Colors.black;
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 20,
                ),
                RichText(
                  text: TextSpan(
                    text: 'Hi,',
                    style: const TextStyle(
                      color: Colors.cyan,
                      fontSize: 27,
                      fontWeight: FontWeight.bold,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                          text: 'MyName',
                          style: TextStyle(
                            color: color,
                            fontSize: 25,
                            fontWeight: FontWeight.w600,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              debugPrint('My name is pressed');
                            }),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                TextWidget(
                  text: 'tola@email.com',
                  color: color,
                  textSize: 18,
                  // isTile: true,
                ),
                const SizedBox(
                  height: 20,
                ),
                const Divider(
                  thickness: 2,
                ),
                const SizedBox(
                  height: 20,
                ),
                _listTiles(
                  title: 'Address 2',
                  subtitle: 'My subtitle',
                  icon: IconlyLight.profile,
                  onPressed: () async {
                    await _showAddressDialog();
                  },
                  color: color,
                ),
                _listTiles(
                  title: 'Order',
                  icon: IconlyLight.bag,
                  onPressed: () {},
                  color: color,
                ),
                _listTiles(
                  title: 'Wishlish',
                  icon: IconlyLight.heart,
                  onPressed: () {},
                  color: color,
                ),
                _listTiles(
                  title: 'Viewed',
                  icon: IconlyLight.show,
                  onPressed: () {},
                  color: color,
                ),
                _listTiles(
                  title: 'Forget password',
                  icon: IconlyLight.unlock,
                  onPressed: () {},
                  color: color,
                ),
                SwitchListTile(
                  title: TextWidget(
                    text: themeState.getDarkTheme ? 'Dark mode' : 'Light mode',
                    color: color,
                    textSize: 18,
                    // isTile: true,
                  ),
                  secondary: Icon(themeState.getDarkTheme
                      ? Icons.dark_mode_outlined
                      : Icons.light_mode_outlined),
                  onChanged: (bool value) {
                    setState(() {
                      themeState.setDarkTheme = value;
                    });
                  },
                  value: themeState.getDarkTheme,
                ),
                _listTiles(
                  title: 'Logout',
                  icon: IconlyLight.logout,
                  onPressed: () {
                    _showLoputDialog();
                  },
                  color: color,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _showLoputDialog() async {
    await showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Row(
              children: [
                Image.asset(
                  'assets/images/warning-sign.png',
                  height: 20,
                  width: 20,
                  fit: BoxFit.fill,
                ),
                const Text('Sign Out'),
              ],
            ),
            content: const Text('Do you wanna sign out?'),
            actions: [
              TextButton(
                onPressed: () {
                  if (Navigator.canPop(context)) {
                    Navigator.pop(context);
                  }
                },
                child: TextWidget(
                  text: 'Cancel',
                  color: Colors.cyan,
                  textSize: 18,
                ),
              ),
              TextButton(
                onPressed: () {},
                child: TextWidget(
                  text: 'Ok',
                  color: Colors.red,
                  textSize: 18,
                ),
              ),
            ],
          );
        });
  }

  Future<void> _showAddressDialog() async {
    await showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Update'),
            content: TextField(
              // onChanged: (value) {
              //   debugPrint(
              //       '_addressTextConttroller.text${_addressTextConttroller.text}');
              // },
              controller: _addressTextConttroller,
              maxLines: 5,
              decoration: const InputDecoration(hintText: "Your Adress"),
            ),
            actions: [
              TextButton(
                onPressed: () {},
                child: const Text('Update'),
              ),
            ],
          );
        });
  }

  Widget _listTiles({
    required String title,
    String? subtitle,
    required IconData icon,
    required Function onPressed,
    required Color color,
  }) {
    return ListTile(
      title: TextWidget(
        text: title,
        color: color,
        textSize: 22,
        // isTile: true,
      ),
      subtitle: TextWidget(
        text: subtitle == null ? "" : subtitle,
        color: color,
        textSize: 18,
      ),
      leading: Icon(icon),
      trailing: const Icon(IconlyLight.arrowRight2),
      onTap: () {
        onPressed();
      },
    );
  }
}
