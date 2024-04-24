import 'package:flutter/material.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  String title;
  Widget? leading;
  List<Widget>? actions;

  CustomAppBar({Key? key, required this.title, this.leading, this.actions})
      : preferredSize = const Size(double.infinity, 90),
        super(key: key);

  @override
  final Size preferredSize; // default is 56.0

  @override
  _CustomAppBarState createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          width: double.infinity,
          height: 70,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primary,
            border: const Border.symmetric(
              horizontal: BorderSide.none,
            ),
          ),
          child: AppBar(
            title: Text(
              widget.title,
              style: TextStyle(color: Theme.of(context).colorScheme.onPrimary),
            ),
            leading: widget.leading,
            backgroundColor: Theme.of(context).colorScheme.primary,
            actions: widget.actions,
          ),
        ),
        Container(
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primary,
            border: BorderDirectional(
              top: BorderSide(
                color: Theme.of(context).colorScheme.primary,
                width: 0,
              ),
              bottom: const BorderSide(
                color: Colors.white,
                width: 0,
              ),
            ),
          ),
          child: Container(
            width: double.infinity,
            height: 20,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(
                top: Radius.elliptical(150, 30),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
