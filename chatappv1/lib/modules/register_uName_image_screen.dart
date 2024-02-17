import 'package:cached_network_image/cached_network_image.dart';
import 'package:chatappv1/shared/components/components/my_main_components.dart';
import 'package:flutter/material.dart';

import '../layout/home_layout.dart';

class RegisterNmImgScreen extends StatelessWidget {
  const RegisterNmImgScreen(this.cubit, {super.key});

  final cubit ;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              alignment: Alignment.bottomRight,
              children: [
                CircleAvatar(
                  backgroundImage: CachedNetworkImageProvider((cubit.userImg ==
                          'none')
                      ? 'https://img.freepik.com/free-vector/sharing-content-social-media-with-man-smartphone_23-2148518566.jpg?size=626&ext=jpg&ga=GA1.1.1374943836.1707644974&semt=ais'
                      : cubit.userImg),
                  radius: cubit.getScreenWidth(context) * .2,
                ),
                IconButton.filled(
                    onPressed: () async {
                      await cubit.getProfileImage();
                    },
                    icon: const Icon(Icons.edit)),
              ],
            ),
            SizedBox(
              height: cubit.getScreenWidth(context) * .03,
            ),
            const Text(
              'Please enter a username for your new account',
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
            ),
            SizedBox(
              height: cubit.getScreenWidth(context) * .03,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: cubit.getScreenWidth(context) * .1),
              child: Form(
                key: cubit.formRegisterKey2,
                child: TextFormField(
                  validator: (String? v) {
                    if (v!.isEmpty) {
                      return 'this field can\'t be empty';
                    }
                    // bool ask =   cubit.isUserNameTaken(v);
                    if (cubit.result) {
                      return 'this username is taken !';
                    }
                    return null;
                  },
                  controller: cubit.Controller,
                  decoration: const InputDecoration(
                    prefixIconColor: Colors.blue,
                    suffixIconColor: Colors.black,
                    labelText: 'username',
                    labelStyle: TextStyle(
                        color: Colors.blue,
                        fontSize: 18,
                        fontWeight: FontWeight.w500),
                    prefixIcon: Icon(
                      Icons.account_circle_sharp,
                    ),
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: cubit.getScreenWidth(context) * .04,
            ),
            Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: cubit.getScreenWidth(context) * .2),
                child: defaultButton(
                    function: () async {
                     cubit.result= await cubit.isUserNameTaken( cubit.Controller.text);
                      cubit.formRegisterKey2.currentState!.validate();
                      if (cubit.formRegisterKey2.currentState!.validate()) {
                        cubit.userName = cubit.Controller.t2ext;
                        cubit.userRegisterUserName();
                        navigateAndFinish(context, const HomeScreen());
                      }
                    },
                    text: 'Submit')),
          ],
        ),
      ),
    ));
  }
}
