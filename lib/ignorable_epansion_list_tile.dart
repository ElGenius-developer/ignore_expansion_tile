library ignore_expansion_tile;

import 'package:flutter/material.dart';

class IgnoreExpansionTile extends StatefulWidget {
  final Widget title;
  final Widget leading;
  final Widget trailing;
  final List<Widget> children;
  final void Function()? onTap;
  final bool isExpandable;
  final ShapeBorder? shape;
  final EdgeInsetsGeometry? contentPadding;

  const IgnoreExpansionTile({
    super.key,
    required this.title,
    this.leading = const SizedBox(),
    this.trailing = const SizedBox(),
    this.isExpandable = false,
    this.contentPadding,
    this.onTap,
    required this.children,
    required this.shape,
  });

  @override
  State<IgnoreExpansionTile> createState() => IgnoreExpansionTileState();
}

class IgnoreExpansionTileState extends State<IgnoreExpansionTile> {
  bool _isExpanded = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        ListTile(
          shape: widget.shape,
          contentPadding: EdgeInsets.zero,
          minLeadingWidth: 0,
          title: widget.title,
          leading: widget.leading,
          trailing: widget.trailing,
          onTap: () {
            if (widget.isExpandable) {
              if (widget.onTap != null) {
                widget.onTap!();
              }
              setState(() {
                _isExpanded = !_isExpanded;
              });
            }
          },
        ),
        Visibility(
          visible: _isExpanded,
          child: Column(
            children: widget.children,
          ),
        ),
      ],
    );
  }
}
