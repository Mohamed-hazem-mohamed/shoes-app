import 'package:flutter/material.dart';
import 'home/model.dart';

class ProductDetailsPage extends StatefulWidget {
  final ProductModel product;
  const ProductDetailsPage({super.key, required this.product});

  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  int selectedSize = 0;
  final List<int> sizes = [36, 38, 40, 42];

  @override
  Widget build(BuildContext context) {
    final product = widget.product;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Back Arrow
              Align(
                alignment: Alignment.topLeft,
                child: Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_back),
                      onPressed: () => Navigator.pop(context),
                    ),
                    Spacer(),
                    IconButton(
                      icon: const Icon(Icons.shopping_bag_outlined),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ],
                ),
              ),

              // Product Image (Only one image now)
              Image.network(
                product.thumbnail,
                width: double.infinity,
                height: 250,
                fit: BoxFit.cover,
              ),

              const SizedBox(height: 8),
              const Text(
                "BEST SELLER",
                style: TextStyle(color: Colors.lightBlue),
              ),

              const SizedBox(height: 8),
              Text(
                product.title,
                style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),

               SizedBox(height: 8),
              Text(
                "\$${product.price}",
                style:  TextStyle(fontSize: 20, color: Colors.black),
              ),

               SizedBox(height: 8),
              Padding(
                padding:  EdgeInsets.symmetric(horizontal: 12.0),
                child: Text(product.description,style: TextStyle(
                  fontSize: 15,
                ),
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
              ),

               SizedBox(height: 12),
               Text("Size", style: TextStyle(fontWeight: FontWeight.w500,fontSize: 17)),

               SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(sizes.length, (index) {
                  final size = sizes[index];
                  final isSelected = index == selectedSize;
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedSize = index;
                      });
                    },
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 8),
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: isSelected ? Colors.blue : Colors.grey.shade200,
                      ),
                      child: Text(
                        "$size",
                        style: TextStyle(
                          color: isSelected ? Colors.white : Colors.black,
                        ),
                      ),
                    ),
                  );
                }),
              ),

              const Spacer(),

              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  children: [
                    Text(
                      "price : \$${product.price}",
                      style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    const Spacer(),
                    ElevatedButton(
                      onPressed: () {
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.lightBlue,
                        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                      ),
                      child: const Text("Add to cart",style: TextStyle(color: Colors.white),),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
