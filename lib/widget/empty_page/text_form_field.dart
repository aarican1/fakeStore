import 'package:fake_store/cubit/home_cubit/home_cubit.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchTextFormField extends StatelessWidget {
  const SearchTextFormField({
    super.key,
    required FocusNode myFocusNode,
    required TextEditingController searchController,
  })  : _myFocusNode = myFocusNode,
        _searchController = searchController;

  final FocusNode _myFocusNode;
  final TextEditingController _searchController;

  @override
  Widget build(BuildContext context) {
    return BlocSelector<HomeCubit, HomeState, bool>(
      selector: (state) {
        return state.hasFocusSearch ?? false;
      },
      builder: (context, state) {
        return TextFormField(
          focusNode: _myFocusNode,
          maxLines: 1,
          onFieldSubmitted: (value) {
            context.read<HomeCubit>().searchProductTitle(value);
            context.read<HomeCubit>().searchHasFocus(true);
          },
          onTap: () {
            if (state) {
              FocusScope.of(context).unfocus();
            }
            context.read<HomeCubit>().searchHasFocus(!state);

         
          },
          decoration: const InputDecoration(
            labelText: 'Search brand, product or category',
          ),
          controller: _searchController,
          style: const TextStyle(color: Colors.white),
        );
      },
    );
  }
}
