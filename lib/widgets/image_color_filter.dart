import 'package:flutter/material.dart';

class ImageWithColorFilter extends StatelessWidget {
  final ImageProvider image;
  final Widget child;

  const ImageWithColorFilter(
      {super.key, required this.image, required this.child});

  @override
  Widget build(BuildContext context) {
    return ColorFiltered(
      colorFilter: ColorFilter.mode(
        Colors.black.withOpacity(1), // Adjust the opacity for desired effect
        BlendMode.dstATop,
      ),
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: image,
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.black.withOpacity(1), // Dark black at the top
                  Colors.black.withOpacity(0.5), // Less black in the middle
                  Colors.black.withOpacity(1), // Dark black at the bottom
                ],
              ),
            ),
          ),
          child,
        ],
      ),
    );
  }
}
