import "package:flutter/material.dart";

class TopRoundedContainer extends StatelessWidget {
  final Widget child;
  const TopRoundedContainer({super.key, required this.child});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.elliptical(50, 50),
        ),
        color: Colors.amber,
      ),
      child: child,
    );
  }
}
