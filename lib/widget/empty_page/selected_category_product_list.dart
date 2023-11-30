import 'package:fake_store/constants/empty_page/empty_constants.dart';
import 'package:fake_store/cubit/home_cubit/home_cubit.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SelectedListView extends StatelessWidget {
  const SelectedListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(builder: (context, state) {
      return Expanded(
        flex: 10,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemBuilder: (BuildContext context, int index) {
            if (state.selectedCategoryList == null|| state.selectedCategoryList!.isEmpty) {
              return const Placeholder(
                color: Colors.yellow,
              );
            }
             final productIndex = state.selectedCategoryList?[index];

            if (productIndex == null) {
              return const Placeholder(
                color: Colors.yellow,
              );
            }

            return SizedBox(
              width: MediaQuery.of(context).size.width * 0.5,
              height: MediaQuery.of(context).size.height * 0.3,
              child: Card(
                color: myCardColor,
                child: ListTile(
                  contentPadding: myMenuListViewPadding,
                  title: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    child: Image.network(
                      height: MediaQuery.of(context).size.height * 0.19,
                      width: MediaQuery.of(context).size.width * 0.3,
                      productIndex.image ?? "https://picsum.photos/200/300//",
                    ),
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        maxLines: 2,
                        productIndex.title!,
                        style: myTitleStyle,
                      ),
                      Padding(
                        padding: myPadding,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('${productIndex.price!} \$',
                                style: myPriceStyle),
                            Text(
                              productIndex.category!,
                              style: mySubtitleStyle,
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
          },
          itemCount: state.selectedCategoryList?.length ?? 0,
        ),
      );
    });
  }
}
