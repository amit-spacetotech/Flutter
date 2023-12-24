import 'package:flutter/material.dart';
import '../constants.dart';
import 'form.dart';
import '../widgets/image_color_filter.dart';

class FeebbackThankyou2 extends StatelessWidget {
  const FeebbackThankyou2({super.key});
  static const routeName = '/feedback-thankyou2';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ImageWithColorFilter(
        image: const AssetImage(
          AppConstants.car,
        ),
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.55),
            // backgroundBlendMode: BlendMode.color,
          ),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                flex: 2,
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Row(
                    children: [
                      Expanded(child: Container()),
                      const Expanded(
                        flex: 10,
                        child: Align(
                          alignment: Alignment.bottomCenter,
                          child: SizedBox(
                            // width: 504,
                            child: Text(
                              'Thank you \nfor your feedback',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 55,
                                fontStyle: FontStyle.italic,
                                fontFamily: 'Didot',
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(child: Container())
                    ],
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
                height: MediaQuery.sizeOf(context).width > 800 ? 30 : 24,
              )
            ],
          ),
        ),
      ),
    );
  }
}
