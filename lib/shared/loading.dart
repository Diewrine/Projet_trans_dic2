import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.indigo[200],
      child: Center(
        child: SpinKitFadingCircle(
          color: Colors.indigo,
          size: 50.0,
        ),
      ),
    );
  }
}

class Loading2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white10,
      child: Center(
        child: SpinKitFadingCircle(
          color: Colors.indigo,
          size: 50.0,
        ),
      ),
    );
  }
}
