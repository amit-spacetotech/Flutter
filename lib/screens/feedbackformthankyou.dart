import 'package:flutter/material.dart';

import '../constants.dart';

import '../widgets/image_color_filter.dart';

class FeebbackThankyou extends StatelessWidget {
  const FeebbackThankyou({super.key});
  static const routeName = '/feedback-thankyou';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ImageWithColorFilter(
        image: const AssetImage(
          AppConstants.man,
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Spacer(),
              // Container(
              //     width: MediaQuery.sizeOf(context).width > 800 ? 100 : 70, // Adjust the size as needed
              //     height: MediaQuery.sizeOf(context).width > 800 ? 100 : 70, // Adjust the size as needed
              //     decoration: const BoxDecoration(shape: BoxShape.circle, color: Colors.white),
              //     child:
              Icon(
                Icons.check_circle_rounded,
                color: Colors.white,
                size: MediaQuery.sizeOf(context).width > 800 ? 130 : 80,
                // Adjust the size of the checkmark
              ),
              // ),
              const SizedBox(
                height: 27,
              ),
              SizedBox(
                width: 504,
                child: Text(
                  'Thank You!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: MediaQuery.sizeOf(context).width > 800 ? 80 : 55,
                    fontStyle: FontStyle.italic,
                    fontFamily: 'Didot',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              // const SizedBox(
              //   height: 70,
              // ),
              const Spacer(),
              ElevatedButton.icon(
                style: ButtonStyle(
                    elevation: MaterialStateProperty.all(0),
                    backgroundColor: MaterialStateColor.resolveWith((states) {
                      return Colors.transparent;
                    })),
                onPressed: () {
                  Navigator.pushReplacementNamed(context, '/');
                },
                icon: const Icon(
                  Icons.sync,
                  size: 35,
                ),
                label: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                  child: Text(
                    'Restart',
                    style: TextStyle(
                      // decoration: TextDecoration.underline,
                      color: Colors.white,
                      fontSize: 28,
                      // fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.sizeOf(context).width > 800 ? 30 : 10,
              )
            ],
          ),
        ),
      ),
    );
  }
}
