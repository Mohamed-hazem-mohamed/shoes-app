import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../reusableWidget/cistomcard.dart';
import '../reusableWidget/textformfield.dart';
import 'firsttap.dart';
import 'cubit/cubit.dart';
import 'cubit/state.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit()..getProducts(),
      child: BlocConsumer<HomeCubit, HomeState>(
        listener: (context, state) {
        },
        builder: (context, state) {
          final TextEditingController searchController = TextEditingController();
          return DefaultTabController(
            length: 3,
            child: Scaffold(
              body: SafeArea(
                child: Column(
                  children: [
                    // Header
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
                      child: Row(
                        children: [
                          Container(
                            width: 44,
                            height: 44,
                            decoration: BoxDecoration(
                              color: Colors.black12,
                              borderRadius: BorderRadius.circular(40),
                            ),
                            child: const Icon(Icons.dashboard),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: const [
                                Text("Store location", style: TextStyle(fontSize: 14)),
                                Text("Mondolibug, Sylhet",
                                    style: TextStyle(fontSize: 12, color: Colors.grey)),
                              ],
                            ),
                          ),
                          Container(
                            width: 44,
                            height: 44,
                            decoration: BoxDecoration(
                              color: Colors.black12,
                              borderRadius: BorderRadius.circular(40),
                            ),
                            child: const Icon(Icons.shopping_bag_outlined),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 30),

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: customTextFormField(
                        label: 'Search',
                        controller: searchController,
                        prefixIcon: Icons.search,
                      ),
                    ),

                    const SizedBox(height: 20),

                    // Tab Bar
                    TabBar(
                      indicatorColor: Colors.blue,
                      labelColor: Colors.blue,
                      unselectedLabelColor: Colors.grey,
                      tabs: [
                        Tab(
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.lightBlueAccent,
                              borderRadius: BorderRadius.circular(15),
                            ),
                            width: 60,
                            height: 40,
                            child: const Center(
                              child: Text(
                                'Adidas',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Tab(
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.black12,
                              borderRadius: BorderRadius.circular(15),
                            ),
                            width: 60,
                            height: 40,
                            child: const Center(
                              child: Text(
                                'Nike',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Tab(
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.black12,
                              borderRadius: BorderRadius.circular(15),
                            ),
                            width: 60,
                            height: 40,
                            child: const Center(
                              child: Text(
                                'Puma',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 20),

                    Expanded(
                      child: TabBarView(
                        children: [
                          Firsttap(),
                          Center(child: Text("data")),
                          Center(child: Text("data")),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
