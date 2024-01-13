import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:store_api_flutter_course/models/prodcuts_model.dart';
import 'package:store_api_flutter_course/services/api_handler.dart';

import '../widget/feeds_widget.dart';

class FeedsScreen extends StatefulWidget {
  const FeedsScreen({Key? key}) : super(key: key);

  @override
  State<FeedsScreen> createState() => _FeedsScreenState();
}

class _FeedsScreenState extends State<FeedsScreen> {
  List<ProductsModel> productsList = [];

   @override
  void didChangeDependencies() async { //TODO: what is didChangeDependencies -it is called immediatley after init state when there is a context to go from
    getProducts();
    super.didChangeDependencies();
  }

  Future<void> getProducts () async {
    productsList = await APIHandler.getAllProducts();
    setState(() {
      
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // elevation: 4,
        title: const Text('All Products'),
      ),
      body: productsList.isEmpty ? const Center(child: CircularProgressIndicator(),) : GridView.builder(
          // shrinkWrap: true,
          // physics: const NeverScrollableScrollPhysics(),
          itemCount: productsList.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 0.0,
              mainAxisSpacing: 0.0,
              childAspectRatio: 0.6),
          itemBuilder: (ctx, index) {
            return FeedsWidget(imageUrl: productsList[index].images![0], title: productsList[index].title.toString(),);
          }),
    );
  }
}
