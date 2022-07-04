import 'package:firebase_auth_example/app/data/common_widgets/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      color: white,
      child: Center(
        child: SpinKitThreeBounce(
          color: blue,
          size: 50,
        ),
      ),
    );
  }
}
