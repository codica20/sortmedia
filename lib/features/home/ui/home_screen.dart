import 'package:flutter/material.dart';

import '../../navigation/ui/nav_bar.dart';

import '../../analyze/ui/analyze_button.dart';
import '../../log/ui/logs_view_widget.dart';
import '../../settings/ui/settings_widget.dart';
import '../../transfer/ui/transfer_button.dart';
import 'sm_scaffold.dart' show defaultPadding;

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context)
        .size
        .height;
    final ColorScheme colorScheme = Theme.of(context)
        .colorScheme;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: colorScheme.inversePrimary,
        title: Text(title),
      ),
      body: Column(
        mainAxisAlignment: .spaceBetween,
        children: [
          Expanded(
            //  SizedBox(
            //    height: (screenHeight * 1 / 3),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  defaultPadding(SettingsWidget()),
                  defaultPadding(
                    Row(
                      mainAxisAlignment: .spaceBetween,
                      children: [
                        AnalyzeButton(),
                        TransferButton(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          SizedBox(
            height: screenHeight / 4,
            child: Container(
              decoration: BoxDecoration(
                borderRadius:
                    BorderRadiusGeometry.directional(
                      topStart: Radius.circular(10),
                      topEnd: Radius.circular(10),
                    ),
                color: colorScheme.secondaryContainer,
              ),
              child: LogsViewWidget(),
            ),
          ),
        ],
      ),
      bottomNavigationBar: NavBar(),
    );
  }
}
