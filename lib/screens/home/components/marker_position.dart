import 'package:flutter/material.dart';

class MarkerPosition extends StatelessWidget {
  const MarkerPosition({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.center,
      children: [
        Container(
          height: 30.0,
          width: 30.0,
          decoration: BoxDecoration(
              color: const Color(0xffFF6900).withOpacity(0.43),
              shape: BoxShape.circle),
        ),
        Container(
          height: 10.0,
          width: 10.0,
          decoration: const BoxDecoration(
            color: Color(0xffFF6900),
            shape: BoxShape.circle,
          ),
        ),
      ],
    );
  }
}
