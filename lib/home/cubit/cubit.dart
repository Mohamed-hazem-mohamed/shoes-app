import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project/diohelper/diohelper.dart';
import 'package:project/home/cubit/state.dart';
import 'package:project/home/home.dart';

import '../model.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(InitState());

static HomeCubit get(context) => BlocProvider.of(context);

  List<ProductModel> productList = [];
  void getProducts() async {
    try {
      emit(LoadingState());
      Response response = await DioHelper.getData(url: 'products');
      List products = response.data['products'];

      productList = products.map((item) => ProductModel.fromJson(item)).toList();
      emit(SuccessState());
    } catch (e) {
      print('Error fetching products: $e');
      emit(ErrorState());
    }
  }
}
