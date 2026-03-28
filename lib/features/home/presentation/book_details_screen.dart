import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../core/theme/app_color.dart';
import '../../../core/theme/app_text_style.dart';
import '../../../core/widgets/custom_image_network.dart';
import '../../wishlist/cubit/wishlist_cubit.dart';
import '../cubit/book_details_cubit.dart';
import '../data/models/books_model.dart';

class BookDetailsScreen extends StatelessWidget {
  final int bookId;

  const BookDetailsScreen({super.key, required this.bookId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BookDetailsCubit()..getBookDetails(bookId),
      child: Builder(
        builder: (context) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              leading: GestureDetector(
                onTap: () => Navigator.pop(context),
                child: Container(
                  margin: EdgeInsets.all(8.r),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(Icons.arrow_back, color: Colors.black),
                ),
              ),
              actions: [
                BlocBuilder<BookDetailsCubit, BookDetailsState>(
                  builder: (context, state) {
                    final book = state.bookDetails;
                    final wishlistCubit = BlocProvider.of<WishlistCubit>(
                      context,
                      listen: false,
                    );
                    final isWishlisted = wishlistCubit.state.products.any(
                      (item) => item.id == book?.id,
                    );
                    return GestureDetector(
                      onTap: () {
                        if (book != null) {
                          final product = ProductModel(
                            id: book.id,
                            name: book.name,
                            description: book.description,
                            price: book.price,
                            discount: book.discount,
                            priceAfterDiscount: book.priceAfterDiscount,
                            stock: book.stock,
                            bestSeller: book.bestSeller,
                            image: book.image,
                            category: book.category,
                          );
                          if (isWishlisted) {
                            wishlistCubit.removeFromWishlist(product);
                          } else {
                            wishlistCubit.addToWishlist(product);
                          }
                          context.read<BookDetailsCubit>().toggleWishlist();
                        }
                      },
                      child: Container(
                        margin: EdgeInsets.all(8.r),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          isWishlisted ? Icons.bookmark : Icons.bookmark_border,
                          color: isWishlisted
                              ? AppColor.primaryColor
                              : Colors.black,
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
            body: BlocBuilder<BookDetailsCubit, BookDetailsState>(
              builder: (context, state) {
                if (state.isLoading) {
                  return Skeletonizer(
                    enabled: true,
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          SizedBox(height: 20.h),
                          Center(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(15.r),
                              child: Container(
                                width: 200.w,
                                height: 300.h,
                                color: Colors.grey.shade300,
                              ),
                            ),
                          ),
                          SizedBox(height: 30.h),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20.w),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  height: 30.h,
                                  color: Colors.grey.shade300,
                                ),
                                SizedBox(height: 10.h),
                                Container(
                                  height: 20.h,
                                  width: 100.w,
                                  color: Colors.grey.shade300,
                                ),
                                SizedBox(height: 20.h),
                                Container(
                                  height: 60.h,
                                  color: Colors.grey.shade300,
                                ),
                                SizedBox(height: 30.h),
                                Container(
                                  height: 50.h,
                                  color: Colors.grey.shade300,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }

                if (state.error != null) {
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          state.error ?? "Error loading book details",
                          style: AppTextStyle.text18Regular,
                        ),
                        SizedBox(height: 20.h),
                        ElevatedButton(
                          onPressed: () {
                            context.read<BookDetailsCubit>().getBookDetails(
                              bookId,
                            );
                          },
                          child: Text("Retry"),
                        ),
                      ],
                    ),
                  );
                }

                final book = state.bookDetails;

                return SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(height: 20.h),
                      Center(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(15.r),
                          child: CustomImageNetwork(
                            imageUrl: book?.image ?? "",
                            width: 200.w,
                            height: 300.h,
                          ),
                        ),
                      ),
                      SizedBox(height: 30.h),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              book?.name ?? "",
                              style: AppTextStyle.text30Regular.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(height: 10.h),
                            Center(
                              child: Text(
                                book?.author ?? book?.category ?? "",
                                style: AppTextStyle.text18Regular.copyWith(
                                  color: AppColor.primaryColor,
                                  fontSize: 16.sp,
                                ),
                              ),
                            ),
                            SizedBox(height: 20.h),
                            Text(
                              book?.description ?? "",
                              style: AppTextStyle.text15Regular.copyWith(
                                height: 1.6,
                                color: Colors.grey.shade700,
                              ),
                              textAlign: TextAlign.justify,
                            ),
                            SizedBox(height: 40.h),
                            Row(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Price",
                                      style: AppTextStyle.text15Regular
                                          .copyWith(
                                            color: Colors.grey.shade600,
                                          ),
                                    ),
                                    SizedBox(height: 5.h),
                                    Text(
                                      "₹${book?.price ?? "0"}",
                                      style: AppTextStyle.text30Regular
                                          .copyWith(
                                            fontWeight: FontWeight.bold,
                                          ),
                                    ),
                                  ],
                                ),
                                SizedBox(width: 20.w),
                                Expanded(
                                  child: SizedBox(
                                    height: 56.h,
                                    child: ElevatedButton(
                                      onPressed: () {
                                        ScaffoldMessenger.of(
                                          context,
                                        ).showSnackBar(
                                          SnackBar(
                                            content: Text(
                                              "${book?.name} added to cart",
                                            ),
                                            duration: Duration(seconds: 2),
                                          ),
                                        );
                                      },
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.black,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                            10.r,
                                          ),
                                        ),
                                      ),
                                      child: Text(
                                        "Add To Cart",
                                        style: AppTextStyle.text20Regular
                                            .copyWith(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w600,
                                            ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 30.h),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
