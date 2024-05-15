import 'package:cuoiki/models/onboard_details.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../component/app_elevated_button.dart';
import '../../resources/app_color.dart';

class OnboardDetailsPage extends StatelessWidget {
  const OnboardDetailsPage({
    super.key,
    required this.item,
    required this.onNextPressed,
    required this.nextButtonText,
    required this.buildDot,
  });
  final Onboards item;
  final VoidCallback onNextPressed;
  final String nextButtonText;
  final Function(int, BuildContext) buildDot;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: Image.asset(
            item.imgUrl!,
            fit: BoxFit.cover,
            height: double.infinity,
            // width: double.infinity,
          ),
        ),
        Positioned(
          bottom: 0.0,
          left: 0,
          right: 0,
          child: Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height / 2.2,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.8),
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(50), topRight: Radius.circular(50)),
            ),
            child: Column(
              children: [
                const SizedBox(height: 43.0),
                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      3,
                      (index) => buildDot(index, context),
                    )),
                const SizedBox(height: 20.0),
                Expanded(
                  child: Column(
                    children: [
                      Text(
                        item.title!,
                        style: GoogleFonts.fredoka(
                          fontSize: 30.0,
                          textStyle: const TextStyle(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 15.0,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Text(
                          item.desc!,
                          textAlign: TextAlign.center,
                          style: GoogleFonts.fredoka(
                            fontSize: 20.0,
                            textStyle: const TextStyle(color: AppColor.grey),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 30.0,
                ),
                AppElevatedButton(
                  height: 45,
                  width: 250,
                  text: nextButtonText,
                  textColor: AppColor.textButton,
                  color: AppColor.green,
                  borderColor: AppColor.green,
                  onPressed: onNextPressed,
                ),
                const SizedBox(
                  height: 30.0,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
