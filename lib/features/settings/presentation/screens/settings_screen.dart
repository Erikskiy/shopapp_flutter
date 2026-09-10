import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shopapp/core/constants/app_sizes.dart';
import 'package:shopapp/features/settings/presentation/widgets/settings_appbar.dart';
import 'package:shopapp/features/settings/presentation/widgets/settings_switch.dart';

class SettingsScreen extends StatefulWidget{
  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool isDarkTheme = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: settingsAppbar(
        "Settings",
        (){
          context.pop();
        },
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsetsGeometry.all(AppSizes.paddingScreen),
          child: Column(
            children: [

              SettingsSwitch(
                iconData: Icons.dark_mode,
                name: "Dark Theme",
                value: isDarkTheme,
                onChanged: (value) {
                  setState(() {
                    isDarkTheme = value;
                  });
                },
              ),

            ],
          ),
        ),
      ),
    );
  }
}