import 'package:get/get.dart';

import '../../constants/consts.dart';
import '../../constants/lists.dart';
import '../../utils/widgets/app_logo_widget.dart';
import '../../utils/widgets/bg_widget.dart';
import '../../utils/widgets/custom_button.dart';
import '../../utils/widgets/custom_textfields.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return bgWidget(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Center(
          child: Column(
            children: [
              (context.screenHeight * 0.1).heightBox,
              appLogoWidget(),
              10.heightBox,
              "Join the $appname"
                  .text
                  .white
                  .bold
                  .fontFamily(bold)
                  .size(20)
                  .make(),
              20.heightBox,
              Column(
                children: [
                  customTextField(title: name, hint: nameHint),
                  customTextField(title: email, hint: emailHint),
                  customTextField(title: password, hint: passwordHint),
                  customTextField(
                      title: confirmPassword, hint: confirmPasswordHint),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {},
                      child: forgetPassword.text.make(),
                    ),
                  ),
                  5.heightBox,
                  Row(
                    children: [
                      Checkbox(
                        checkColor: redColor,
                        value: false,
                        onChanged: (value) {},
                      ),
                      10.widthBox,
                      Expanded(
                        child: RichText(
                          text: const TextSpan(
                            children: [
                              TextSpan(
                                  text: "I agree to the ",
                                  style: TextStyle(
                                      color: fontGrey, fontFamily: bold)),
                              TextSpan(
                                  text: privacyPolicy,
                                  style: TextStyle(
                                      color: redColor, fontFamily: bold)),
                              TextSpan(
                                  text: " & ",
                                  style: TextStyle(
                                      color: fontGrey, fontFamily: bold)),
                              TextSpan(
                                  text: termsAndCondition,
                                  style: TextStyle(
                                      color: redColor, fontFamily: bold)),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                  10.heightBox,
                  customButton(
                    onPressed: () {},
                    title: signUp,
                    color: redColor,
                    textColor: whiteColor,
                  ).box.width(context.screenWidth - 50).make(),
                  10.heightBox,
                  RichText(
                    text: const TextSpan(children: [
                      TextSpan(
                          text: alreadyHaveAnAccount,
                          style: TextStyle(color: fontGrey, fontFamily: bold)),
                      TextSpan(
                          text: logIn,
                          style: TextStyle(color: redColor, fontFamily: bold)),
                    ]),
                  ).onTap(() {
                    Get.back();
                  }),
                ],
              )
                  .box
                  .white
                  .rounded
                  .padding(const EdgeInsets.all(10))
                  .width(context.screenWidth - 70)
                  .shadowSm
                  .make(),
            ],
          ),
        ),
      ),
    );
  }
}
