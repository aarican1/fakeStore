import 'package:fake_store/constants/empty_page/empty_constants.dart';
import 'package:fake_store/cubit/home_cubit/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchIcon extends StatelessWidget {
  const SearchIcon({
    super.key,
    required this.myFocusNode,
  });
  final FocusNode myFocusNode;
  @override
  Widget build(BuildContext context) {
    return BlocSelector<HomeCubit, HomeState, bool>(
      selector: (state) {
        return state.hasFocusSearch ?? false;
      },
      builder: (context, state) {
        return AnimatedCrossFade(
          crossFadeState:
              state ? CrossFadeState.showSecond : CrossFadeState.showFirst,
          secondChild: IconButton(
            onPressed: () {
              if (state) {
                context.read<HomeCubit>().searchHasFocus(false);
                FocusScope.of(context).unfocus();
              }
            },
            icon: const Icon(
              Icons.arrow_back_ios_new_outlined,
              color: Colors.white,
            ),
          ),
          firstChild: IconButton(
            onPressed: () {
              if (state == false) {
                context.read<HomeCubit>().searchHasFocus(true);
               // FocusScope.of(context).requestFocus();
              } FocusScope.of(context).requestFocus(myFocusNode);
            },
            icon: const Icon(
              Icons.search,
              color: Colors.white,
            ),
          ),
          duration: myAnimatedCrossFadeDuration,
        );
      },
    );
  }
}

Widget notificationLoadingCenter() {
  return BlocSelector<HomeCubit, HomeState, bool>(selector: (state) {
    return state.isLoading ?? false;
  }, builder: (context, state) {
    return AnimatedCrossFade(
        firstChild: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.notifications,
              color: Colors.white,
            )),
        secondChild: const Center(
          child: CircularProgressIndicator(
            color: Colors.white,
          ),
        ),
        crossFadeState:
            state ? CrossFadeState.showSecond : CrossFadeState.showFirst,
        duration: myAnimatedCrossFadeDuration);
  });
}
