// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:jaka_user/model/user.dart';
// import 'package:jaka_user/pages/entrypoint.dart';

// class SignInPage extends StatefulWidget {
//   const SignInPage({super.key});

//   @override
//   State<SignInPage> createState() => _SignInPageState();
// }

// class _SignInPageState extends State<SignInPage> {
//   late TextEditingController _emailController;
//   late TextEditingController _passwordController;

//   @override
//   void initState() {
//     super.initState();
//     _emailController = TextEditingController();
//     _passwordController = TextEditingController();
//   }

//   @override
//   void dispose() {
//     _emailController.dispose();
//     _passwordController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Sign In'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(20.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: [
//             TextField(
//               controller: _emailController,
//               decoration: const InputDecoration(
//                 labelText: 'Email',
//                 border: OutlineInputBorder(),
//               ),
//             ),
//             const SizedBox(height: 20),
//             TextField(
//               controller: _passwordController,
//               decoration: const InputDecoration(
//                 labelText: 'Password',
//                 border: OutlineInputBorder(),
//               ),
//               obscureText: true,
//             ),
//             const SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: () async {
//                 String email = _emailController.text;
//                 String password = _passwordController.text;

//                 Login login = Login(
//                   email: email,
//                   password: password,
//                   type: 'user',
//                 );

//                 Map<String, dynamic> response = await login.signIn();

//                 if (response.containsKey('token') &&
//                     response.containsKey('user')) {
//                   Get.offAll(() => const EntryPoint());
//                 } else {
//                   Get.snackbar('Login Failed', 'Incorrect email or password');
//                 }
//               },
//               child: const Text('Sign In'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:jaka_user/common/appstyle.dart';
import 'package:jaka_user/constants/constants.dart';
import 'package:jaka_user/model/user.dart';
import 'package:jaka_user/pages/entrypoint.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  late TextEditingController _emailController;
  late TextEditingController _passwordController;
  bool _obscureText = true;
  bool isLoading = false;

  bool isAllInputFilled() {
    return _emailController.text.isNotEmpty &&
        _passwordController.text.isNotEmpty;
  }

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: MediaQuery.of(context).size.height,
          ),
          child: Stack(
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.28,
                    color: AppColors.primary,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Image.asset('assets/bg_auth.png'),
                      ],
                    ),
                  ),
                ],
              ),
              Positioned(
                top: MediaQuery.of(context).size.height * 0.25,
                left: 10,
                right: 10,
                child: Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 18.h, vertical: 18.h),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: const BorderRadius.all(
                      Radius.circular(12),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.8),
                        spreadRadius: 2,
                        blurRadius: 10,
                        offset: const Offset(3, 3),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            'Sign in',
                            style:
                                appstyle(29, AppColors.black, FontWeight.bold),
                          ),
                          SizedBox(
                            width: 10.h,
                          ),
                          Text(
                            'with',
                            style:
                                appstyle(28, AppColors.black, FontWeight.w400),
                          ),
                        ],
                      ),
                      Text(
                        'Email Address',
                        style: appstyle(28, AppColors.black, FontWeight.w400),
                      ),
                      SizedBox(
                        height: 25.h,
                      ),
                      Form(
                        child: Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                color: AppColors.white,
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(12),
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.3),
                                    spreadRadius: 2,
                                    blurRadius: 3,
                                    offset: const Offset(2, 1),
                                  ),
                                ],
                              ),
                              child: TextField(
                                controller: _emailController,
                                decoration: InputDecoration(
                                  hintText: 'Email Adress',
                                  hintStyle: appstyle(
                                      15, AppColors.greytext, FontWeight.w400),
                                  border: InputBorder.none,
                                  contentPadding:
                                      EdgeInsets.symmetric(horizontal: 15.h),
                                ),
                                cursorColor: AppColors.black,
                              ),
                            ),
                            SizedBox(
                              height: 12.h,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                color: AppColors.white,
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(12),
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.3),
                                    spreadRadius: 2,
                                    blurRadius: 3,
                                    offset: const Offset(2, 1),
                                  ),
                                ],
                              ),
                              child: Stack(
                                alignment: Alignment.centerRight,
                                children: [
                                  TextField(
                                    controller: _passwordController,
                                    obscureText: _obscureText,
                                    decoration: InputDecoration(
                                      hintText: 'Password',
                                      hintStyle: appstyle(15,
                                          AppColors.greytext, FontWeight.w400),
                                      border: InputBorder.none,
                                      contentPadding: EdgeInsets.only(
                                          left: 15.h, right: 50.h),
                                    ),
                                    cursorColor: AppColors.black,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(right: 5.h),
                                    child: IconButton(
                                      onPressed: () {
                                        setState(() {
                                          _obscureText = !_obscureText;
                                        });
                                      },
                                      icon: Icon(
                                        _obscureText
                                            ? Icons.visibility
                                            : Icons.visibility_off,
                                        color: AppColors.grey,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 25.h,
                      ),
                      GestureDetector(
                        onTap: isLoading
                            ? null
                            : () async {
                                setState(() {
                                  isLoading = true;
                                });

                                String email = _emailController.text;
                                String password = _passwordController.text;
                                if (isAllInputFilled()) {
                                  Login login = Login(
                                    email: email,
                                    password: password,
                                    type: 'user',
                                  );
                                  Map<String, dynamic> response =
                                      await login.signIn();

                                  if (response.containsKey('token') &&
                                      response.containsKey('user')) {
                                    Get.offAll(() => const EntryPoint());
                                  } else {
                                    Get.snackbar(
                                      'Login Failed',
                                      'Incorrect email or password',
                                      titleText: Text(
                                        'Login Failed',
                                        style: appstyle(17, AppColors.black,
                                            FontWeight.bold),
                                      ),
                                      messageText: Text(
                                        'Incorrect email or password',
                                        style: appstyle(13, AppColors.greytext,
                                            FontWeight.normal),
                                      ),
                                      duration:
                                          const Duration(milliseconds: 1600),
                                      backgroundColor: Colors.grey.shade200,
                                      icon: const Icon(
                                        Icons.cancel,
                                        color: Colors.red,
                                      ),
                                      // shouldIconPulse: false,
                                    );
                                  }
                                } else {
                                  Get.snackbar(
                                    'Warning',
                                    'Please fill in all fields',
                                    titleText: Text(
                                      'Warning',
                                      style: appstyle(
                                          17, AppColors.black, FontWeight.bold),
                                    ),
                                    messageText: Text(
                                      'Please fill in all fields',
                                      style: appstyle(13, AppColors.greytext,
                                          FontWeight.normal),
                                    ),
                                    duration:
                                        const Duration(milliseconds: 1600),
                                    backgroundColor: Colors.white,
                                    icon: const Icon(
                                      Icons.warning,
                                      color: Colors.yellow,
                                    ),
                                  );
                                }
                                setState(() {
                                  isLoading = false;
                                });
                              },
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 5.h),
                          width: double.infinity,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: isLoading
                                ? AppColors.secondary
                                : AppColors.primary,
                            borderRadius: const BorderRadius.all(
                              Radius.circular(12),
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.3),
                                spreadRadius: 2,
                                blurRadius: 3,
                                offset: const Offset(2, 1),
                              ),
                            ],
                          ),
                          child: isLoading
                              ? const CircularProgressIndicator(
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                    Colors.white,
                                  ),
                                )
                              : Text(
                                  'Login',
                                  style: appstyle(
                                      18, AppColors.white, FontWeight.bold),
                                ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                bottom: 20.h,
                left: 0,
                right: 0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Didn't have an account ?",
                      style: appstyle(13, AppColors.black, FontWeight.w400),
                    ),
                    SizedBox(
                      width: 5.h,
                    ),
                    Text(
                      "Sign up",
                      style: appstyle(13, AppColors.black, FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
