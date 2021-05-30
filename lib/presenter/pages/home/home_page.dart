import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'widgets/card_widget.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: Text('Home'),
          ),
          SliverPadding(
            padding: EdgeInsets.all(16),
            sliver: SliverGrid.count(
              mainAxisSpacing: 16,
              crossAxisSpacing: 16,
              crossAxisCount: 2,
              children: [
                GestureDetector(
                  onTap: () => Modular.to.pushNamed('/covid/cases'),
                  child: CardWidget(
                    icon: Icons.show_chart,
                    title: 'COVID 19',
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
