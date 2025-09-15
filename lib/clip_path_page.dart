import 'package:flutter/material.dart';

class ClipPathPage extends StatelessWidget {
  const ClipPathPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ClipPath(clipper: WaveClipper(), child: sizedBox(context)),
    );
  }

  SizedBox sizedBox(BuildContext context) {
    return SizedBox(
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 400,
        color: Colors.red,
        child: clipName(),
      ),
    );
  }

  Center clipName() {
    return Center(
      child: Text(
        'Clip Path',
        style: TextStyle(
          color: Colors.white,
          fontSize: 24,
          fontWeight: FontWeight.w900,
        ),
      ),
    );
  }
}

class TriangleClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.moveTo(size.width / 2, 0); // Top center
    path.lineTo(size.width, size.height); // Bottom right
    path.lineTo(100, size.height); // Bottom left
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

class WaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();

    double w = size.width;
    double h = size.height;

    path.lineTo(0, 0);
    path.lineTo(0, h);
    path.quadraticBezierTo(w * 0.5, h - 100, w, h);
    path.lineTo(w, h);
    path.lineTo(w, 0);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
