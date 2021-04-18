import 'package:flutter/material.dart';

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
                CardWidget(
                  icon: Icons.people,
                  title: 'Page',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
