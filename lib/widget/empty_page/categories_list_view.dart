import 'package:fake_store/constants/empty_page/empty_constants.dart';
import 'package:fake_store/cubit/home_cubit/home_cubit.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoriesListView extends StatelessWidget {
  const CategoriesListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        
        return Expanded(
          flex: 2,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: state.categories?.length ?? 0,
            itemBuilder: (BuildContext context, int index) {
              final category = state.categories?[index];
              if (category == null) {
                return const Placeholder();
              }
              return SizedBox(
                width: MediaQuery.of(context).size.width * 0.28,
                child: ListTile(
                  contentPadding: myMenuListViewPadding,
                  title: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: state.indexColorList?[index] ?? false
                            ? Colors.orange.shade700
                            : Colors.transparent),
                    onPressed: () {
                      context.read<HomeCubit>().selectedCategory(category);
                      context
                          .read<HomeCubit>()
                          .chooseColorList(state.categories!.length, index);
                    },
                    child: Text(
                      textAlign: TextAlign.center,
                      category,
                      style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w900,
                          color: state.indexColorList?[index] ?? false
                              ? Colors.white
                              : Colors.orange.shade700),
                    ),
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
