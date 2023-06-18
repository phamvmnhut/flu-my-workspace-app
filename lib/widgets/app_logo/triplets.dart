import 'package:flutter/material.dart';
import './triplets_container.dart';
import 'dart:math' as math;

class TripletsLogo extends StatelessWidget {
  const TripletsLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const TripletsContainer(),
        const SizedBox(width: 2),
        Transform.rotate(
          angle: -math.pi,
          child: Transform.translate(
              offset: const Offset(0, 7), child: const TripletsContainer()),
        )
      ],
    );
  }
}
