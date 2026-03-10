import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../cubit/home_cubit.dart';
import '../../data/models/books_model.dart';
import 'book_item.dart';

class BooksGridView extends StatelessWidget {
  const BooksGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        if (state.isBestSellerLoading) {
          return Skeletonizer.sliver(
            enabled: true,
            child: SliverGrid.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 11.w,
                mainAxisSpacing: 11.h,
                childAspectRatio: .55,
              ),
              itemBuilder: (context, index) => BookItem(
                book: ProductModel(
                  name: "test",
                  price: "222",
                  image: "",
                ),
              ),
              itemCount: 10,
            ),
          );
        } else if (state.bestSellers.isNotEmpty) {
          return SliverGrid.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 11.w,
              mainAxisSpacing: 11.h,
              childAspectRatio: .55,
            ),
            itemBuilder: (context, index) =>
                BookItem(book: state.bestSellers[index]),
            itemCount: state.bestSellers.length,
          );
        } else if (state.bestSellerError != null) {
          return const SliverToBoxAdapter(
            child: Center(child: Text("Error")),
          );
        }
        return const SliverToBoxAdapter(child: SizedBox());
      },
    );
  }
}
