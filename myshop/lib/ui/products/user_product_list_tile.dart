import 'package:flutter/material.dart';
import 'package:myshop/ui/products/products_manager.dart';
import 'package:provider/provider.dart';
import '../../models/product.dart';
import 'edit_product_screen.dart';

class UserProductListTile extends StatelessWidget {
  final Product product;

  const UserProductListTile(
    this.product, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(product.title),
      leading: CircleAvatar(
        backgroundImage: NetworkImage(product.imageUrl),
      ),
      trailing: SizedBox(
        width: 100,
        child: Row(
          children: <Widget>[
            buildEditButton(context),
            buildDeleteButton(context),
          ],
        ),
      ),
    );
  }

  Widget buildDeleteButton(BuildContext context) {
    return IconButton(
      // icon: const Icon(Icons.delete),
      // onPressed: () {
      //   print('Delete a product');
      // },
      // color: Theme.of(context).errorColor,
      icon: const Icon(Icons.delete),
      onPressed: () {
        context.read<ProductsManager>().deleteProduct(product.id!);
        ScaffoldMessenger.of(context)
          ..hideCurrentSnackBar()
          ..showSnackBar(
            const SnackBar(
              content: Text(
                'Product deleted',
                textAlign: TextAlign.center,
              ),
            ),
          );
      },
      color: Theme.of(context).errorColor,
    );
  }

  Widget buildEditButton(BuildContext context) {
    // return IconButton(
    //   icon: const Icon(Icons.edit),
    //   onPressed: () {
    //     print('Go to edit product screen');
    //   },
    //   color: Theme.of(context).primaryColor,
    // );
    // return Consumer<ProductsManager>(
    //   builder: (ctx, productsManager, child) {
    //     return ListView.builder(
    //       itemCount: productsManager.itemCount,
    //       itemBuilder: (ctx, i) => Column(
    //         children: [
    //           UserProductListTile(
    //             productsManager.items[i],
    //           ),
    //           const Divider(),
    //         ],
    //       ),
    //     );
    //   },
    // );
    return IconButton(
      icon: const Icon(Icons.edit),
      onPressed: () {
        Navigator.of(context).pushNamed(
          EditProductScreen.routeName,
          arguments: product.id,
        );
      },
      color: Theme.of(context).primaryColor,
    );
  }
}
