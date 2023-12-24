import 'package:flutter/material.dart';
import '../constants.dart';
import 'form.dart';
import '../widgets/image_color_filter.dart';

class ThankYou extends StatelessWidget {
  const ThankYou({super.key});
  static const routeName = '/thankyou';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ImageWithColorFilter(
        image: const AssetImage(AppConstants.man),
        child: SafeArea(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment
            //     .spaceBetween, // Align text at the center and bottom
            children: [
              // Container(), // Empty container to push text to the center
              const Expanded(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: SizedBox(
                    width: 504,
                    child: Text(
                      'Thank You',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 64,
                        fontStyle: FontStyle.italic,
                        fontFamily: 'Didot',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: InkWell(
                    onTap: () {
                      Navigator.pushReplacementNamed(context, FeedBackForm.routeName);
                    },
                    child: const Row(
                      // crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'For',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontFamily: 'Didot',
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          'Chauffeur',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontFamily: 'Didot',
                            fontWeight: FontWeight.w700,
                            height: 0,
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Icon(
                          Icons.arrow_forward,
                          color: Colors.white,
                        )
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.sizeOf(context).width > 800 ? 40 : 24,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
