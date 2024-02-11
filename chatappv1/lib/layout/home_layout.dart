import 'package:chatappv1/shared/components/components/my_main_components.dart';
import 'package:chatappv1/shared/cubit/app_cubit/cubit.dart';
import 'package:chatappv1/shared/cubit/app_cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit()..getUserData(),
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = AppCubit.get(context);
          // return Scaffold(
          //     appBar: AppBar(
          //       actions: [
          //         TextButton(
          //             onPressed: () {
          //               cubit.signOut(context);
          //             },
          //             child: Text("Logout"))
          //       ],
          //     ),
          //     body: Column(
          //       children: [
          //        const SizedBox(
          //           height: 20,
          //         ),
          //         ConditionalBuilder(
          //           builder: (context) => SafeArea(
          //             child: Center(
          //               child: Column(
          //                 children: [
          //                   Text(userModel.email),
          //                 const  SizedBox(
          //                     height: 20,
          //                   ),
          //                   Text(userModel.name),
          //                  const SizedBox(
          //                     height: 20,
          //                   ),
          //                   Text(userModel.phone),
          //                 const  SizedBox(
          //                     height: 20,
          //                   ),
          //                 ],
          //               ),
          //             ),
          //           ),
          //           condition: (state is! GetUserLoadingState) &&(uId !='' && uId!=null),
          //           fallback: (BuildContext context) =>
          //              const CircularProgressIndicator(),
          //         ),
          //       ],
          //     ));
          return Scaffold(
              appBar: PreferredSize(
                preferredSize: Size.fromHeight(cubit.getScreenWidth(context)*.14),
                child: AppBar(
                  title: RichText(
                    text: TextSpan(children: [
                      TextSpan(text: 'Social', style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontSize: 18,
                     fontWeight: FontWeight.bold,
                        color: Colors.red
                      )),
                      TextSpan(text: 'App', style:Theme.of(context).textTheme.titleSmall?.copyWith(
                       fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: const Color.fromARGB(200, 43, 49, 162)
                      )),
                    ]
                    ),),
                  centerTitle: true,

                ),
              ),
              body: Stack(
                children: [
                  cubit.screens[cubit.bottomNavIndex],
                  customBottomNavbar1(context),
                ],
              ));
        },
      ),
    );
  }
}
