import 'package:flutter/material.dart';
import 'package:animations/animations.dart';

class FreezeAnimation extends StatefulWidget {
  const FreezeAnimation({super.key});

  @override
  State<FreezeAnimation> createState() => _FreezeAnimationState();
}

class _FreezeAnimationState extends State<FreezeAnimation> {
  @override
  Widget build(BuildContext context) {
    return OpenContainer(
      closedColor: Colors.transparent,
      openColor: Colors.transparent,
      closedBuilder: (context, action) {
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: Colors.white.withOpacity(0.7),
          ),
          child: const Center(
            child: Icon(
              Icons.snowing,
              size: 50,
              color: Colors.blue,
            ),
          ),
        );
      },
      openBuilder: (context, action) {
        return Container();
      },
    );
  }
}