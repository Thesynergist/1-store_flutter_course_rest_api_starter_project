import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store_api_flutter_course/models/users_models.dart';
import 'package:store_api_flutter_course/services/api_handler.dart';
import 'package:store_api_flutter_course/widget/users_widget.dart';

class UsersScreen extends StatelessWidget {
  const UsersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Users")),
      body: FutureBuilder<List<UsersModel>>(
        //You need the type in for suggestions
        future: APIHandler.getAllUsers(),
        builder: ((context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            Center(
              child: Text("An error has occures ${snapshot.hasError}"),
            );
          } else if (snapshot.data == null) {
            const Center(
              child: Text("No products have been added yet"),
            );
          }
          return ListView.builder(
            itemCount: snapshot.data!.length, //TODO: Research snapshot.data
            itemBuilder: (context, index) {
              return ChangeNotifierProvider.value(
            value: snapshot.data![index],
            child: const UsersWidget(),
          );
          });
        }),
      ),
    );
  }
}
