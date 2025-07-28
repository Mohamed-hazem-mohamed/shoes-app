import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project/home/cubit/cubit.dart';
import 'package:project/home/cubit/state.dart';
import '../details.dart';
import '../reusableWidget/cistomcard.dart';

class Firsttap extends StatelessWidget {
  const Firsttap({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        var cubit = HomeCubit.get(context);
        if (state is LoadingState) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state is ErrorState) {
          return const Center(child: Text("Failed to load products"));
        }

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: GridView.builder(
            itemCount: cubit.productList.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 12,
              mainAxisSpacing: 16,
              childAspectRatio: 0.75,
            ),
            itemBuilder: (context, index) {
              final product = cubit.productList[index];
              return customCard(
                context: context,
                imageUrl: product.thumbnail,
                productName: product.title,
                price: product.price,
                onAddPressed: () {
                  print('Added product ${product.id}');
                },
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ProductDetailsPage(product:product ,),
                    )
                ),
              );
            },
          ),
        );
      },
    );
  }
}
