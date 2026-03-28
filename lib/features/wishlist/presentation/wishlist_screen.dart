import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bookia_store_app/features/wishlist/cubit/wishlist_cubit.dart';
import 'package:bookia_store_app/features/home/data/models/books_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// If you want to use Lottie, uncomment the next line and add lottie package to pubspec.yaml
// import 'package:lottie/lottie.dart';

class WishlistScreen extends StatelessWidget {
  final VoidCallback? onBackToHome;
  const WishlistScreen({super.key, this.onBackToHome});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WishlistCubit, WishlistState>(
      builder: (context, state) {
        final products = state.products;
        return Scaffold(
          appBar: AppBar(
            leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                if (onBackToHome != null) {
                  onBackToHome!();
                } else {
                  Navigator.of(context).maybePop();
                }
              },
            ),
            title: const Text(
              'Wishlist',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            centerTitle: true,
            elevation: 0,
            backgroundColor: Colors.transparent,
            foregroundColor: Colors.black,
          ),
          body: products.isEmpty
              ? Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.bookmark_border, size: 80, color: Colors.grey),
                      SizedBox(height: 16),
                      Text(
                        'No items in your wishlist',
                        style: TextStyle(fontSize: 18, color: Colors.grey),
                      ),
                    ],
                  ),
                )
              : Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12.0,
                    vertical: 16.0,
                  ),
                  child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 16,
                          mainAxisSpacing: 16,
                          childAspectRatio: 0.82,
                        ),
                    itemCount: products.length,
                    itemBuilder: (context, index) {
                      final book = products[index];
                      return WishlistBookCard(book: book);
                    },
                  ),
                ),
        );
      },
    );
  }
}

class WishlistBookCard extends StatelessWidget {
  final ProductModel book;
  const WishlistBookCard({required this.book, super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/bookDetailsScreen', arguments: book.id);
      },
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xFFF6F3EC),
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.04),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16),
                  ),
                  child: book.image != null && book.image!.isNotEmpty
                      ? Image.network(
                          book.image!,
                          height: 90,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        )
                      : Container(
                          height: 90,
                          width: double.infinity,
                          color: Colors.grey[300],
                        ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 12,
                    right: 12,
                    top: 12,
                    bottom: 4,
                  ),
                  child: Text(
                    book.name ?? '',
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 15,
                      fontFamily: 'DMSerifDisplay',
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 12,
                    right: 12,
                    bottom: 8,
                  ),
                  child: Text(
                    '₹${book.price ?? ''}',
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.black,
                      fontFamily: 'DMSerifDisplay',
                    ),
                  ),
                ),
                const Spacer(),
              ],
            ),
            Positioned(
              right: 8,
              bottom: 8,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.08),
                      blurRadius: 4,
                    ),
                  ],
                ),
                child: IconButton(
                  icon: const Icon(Icons.close_rounded, size: 22),
                  splashRadius: 22,
                  onPressed: () {
                    context.read<WishlistCubit>().removeFromWishlist(book);
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
