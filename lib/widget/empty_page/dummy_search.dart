import 'package:fake_store/constants/empty_page/empty_constants.dart';
import 'package:fake_store/cubit/home_cubit/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DummySearch extends StatelessWidget {
  const DummySearch({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {
        state.searchList;
      },
      builder: (context, state) {
        return BlocBuilder<HomeCubit, HomeState>(builder: (context, state) {
          if (state.searchList != null) {
            if (state.searchList!.isNotEmpty) {
              return Expanded(
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: state.searchList!.length,
                  itemBuilder: (BuildContext context, int index) {
                    return  SizedBox(
                      width: MediaQuery.of(context).size.width * 0.4,
                      height: MediaQuery.of(context).size.height*0.5 ,
                      child: ListTile(
                        title: Image.network(state.searchList![index]!.image!),
                        subtitle: Text(
                          state.searchList![index]!.title!,
                          style: myTitleStyle,
                        ),
                      ),
                    );
                  },
                ),
              );
            } else {
              return const SizedBox.shrink();
            }
          } else {
            return const SizedBox.shrink();
          }
        });
      },
    );
  }
}
