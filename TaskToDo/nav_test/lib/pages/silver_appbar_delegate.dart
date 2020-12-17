import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SilverAppbarDelegate extends SliverPersistentHeaderDelegate {
  final TabBar _tabBar;

  SilverAppbarDelegate(this._tabBar);

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return new Container(
      child: _tabBar,
    );
  }

  @override
  double get maxExtent => _tabBar.preferredSize.height;

  @override
  double get minExtent => _tabBar.preferredSize.height;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}