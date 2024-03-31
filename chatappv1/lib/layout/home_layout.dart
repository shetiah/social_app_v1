import 'package:chatappv1/modules/post_screen.dart';
import 'package:chatappv1/shared/components/components/my_main_components.dart';
import 'package:chatappv1/shared/components/constants/const.dart';
import 'package:chatappv1/shared/cubit/app_cubit/cubit.dart';
import 'package:chatappv1/shared/cubit/app_cubit/states.dart';
import 'package:flutter/cupertino.dart';
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
          return Scaffold(
              appBar: PreferredSize(
                preferredSize:
                    Size.fromHeight(cubit.getScreenWidth(context) * .14),
                child: AppBar(
                  title: RichText(
                    text: TextSpan(children: [
                      TextSpan(
                          text: 'Social',
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium
                              ?.copyWith(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.red)),
                      TextSpan(
                          text: 'App',
                          style:
                              Theme.of(context).textTheme.titleSmall?.copyWith(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                    color: defaultColor,
                                  )),
                    ]),
                  ),
                  centerTitle: true,
                  actions: [
                    InkWell(
                      onTap: (){
                        cubit.signOut(context);
                      },
                      child: Padding(
                        padding: EdgeInsets.only(
                            right: cubit.getScreenWidth(context) * .01),
                        child: Container(
                          // clipBehavior: Clip.antiAliasWithSaveLayer,
                          //   height: 40,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: defaultColor.withOpacity(0.8),
                          ),

                          child: Padding(
                            padding:  EdgeInsets.all(cubit.getScreenWidth(context)*.02),
                            child: const Text('SIGN OUT',
                                style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white
                                    // fontSize: 15
                                    )),
                          ),
                        ),
                      ),
                    )
                  ],
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
