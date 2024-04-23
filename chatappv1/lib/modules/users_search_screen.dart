import 'package:chatappv1/shared/components/components/my_main_components.dart';
import 'package:chatappv1/shared/cubit/app_cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../shared/cubit/app_cubit/cubit.dart';

class UsersScreen extends StatelessWidget {
  const UsersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (BuildContext context, state) {},
      builder: (BuildContext context, state) {
        var cubit = AppCubit.get(context);
        return Scaffold(
            body: Column(
          children: [
            SizedBox(height: MediaQuery.of(context).size.width * .02),
            Padding(
              padding: EdgeInsets.all(MediaQuery.of(context).size.width * .02),
              child: defaultFormField(
                  controller: cubit.searchController,
                  type: TextInputType.text,
                  onSubmit: (v) {
                    return v;
                  },
                  onChange: (v) async {
                    // cubit.usersCards=[];
                    await cubit.searching(v);
                    return v;
                  },
                  onTap: () {},
                  validate: (v) {
                    return v;
                  },
                  label: 'search',
                  prefix: Icons.search,
                  context: context),
            ),
            SizedBox(height: MediaQuery.of(context).size.width * .02),
            // Expanded(
            //     child: StreamBuilder<QuerySnapshot>(
            //   stream:
            //       FirebaseFirestore.instance.collection('users').snapshots(),
            //   builder: (context, snapshots) {
            //     var cubit = AppCubit.get(context);
            //     return (snapshots.connectionState == ConnectionState.waiting)
            //         ? const Center(child: CircularProgressIndicator())
            //         : ListView.builder(
            //             itemBuilder: (context, index) {
            //               var data = snapshots.data!.docs[index].data()
            //                   as Map<String, dynamic>;
            //               print(data['name'].toString());
            //               if (data['name']
            //                   .toString()
            //                   .startsWith(cubit.searchedName)) {
            //                 print(data['name'].toString());
            //                 return UserCard(
            //                     userName: data['userName'],
            //                     name: data['name'],
            //                     imgUrl:
            //                         'https://img.freepik.com/free-vector/businessman-character-avatar-isolated_24877-60111.jpg?w=1380&t=st=1707930112~exp=1707930712~hmac=a6544b60d155ba42c129c50cd72b9bc6c2482441901c38c634187b97787df575');
            //               }
            //             },
            //             itemCount: snapshots.data!.docs.length,
            //           );
            //   },
            // )),
            if (state is NameSearchingState)
              Expanded(
                  child: ListView(
                children: (cubit.usersCards).toSet().toList(),
              )),
            if (state is NameSearchingLoadingState)
              const Center(child: CircularProgressIndicator())
          ],
        ));
      },
    );
  }
}
