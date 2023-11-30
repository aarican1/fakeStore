import 'package:fake_store/constants/empty_page/empty_constants.dart';
import 'package:fake_store/cubit/home_cubit/home_cubit.dart';
import 'package:fake_store/service/dio_manager.dart';
import 'package:fake_store/service/store_service.dart';
import 'package:fake_store/widget/empty_page/appbar_item.dart';
import 'package:fake_store/widget/empty_page/body_items.dart';
import 'package:fake_store/widget/empty_page/body_list_view.dart';
import 'package:fake_store/widget/empty_page/categories_list_view.dart';
import 'package:fake_store/widget/empty_page/dummy_search.dart';
import 'package:fake_store/widget/empty_page/selected_category_product_list.dart';

import 'package:fake_store/widget/empty_page/text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EmptyPage extends StatelessWidget {
  EmptyPage({super.key});
  final TextEditingController _searchController = TextEditingController();
  final FocusNode myFocusNode = FocusNode();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) =>
            HomeCubit(StoreService(dioManager: DioManager.instance)),
        child: Scaffold(
          appBar: AppBar(
            leadingWidth: MediaQuery.of(context).size.width * 0.1,
            actions: [notificationLoadingCenter()],
            leading:  SearchIcon(myFocusNode: myFocusNode,),
            title: Card(
              color: myCardColor,
              child: SearchTextFormField(
                  myFocusNode: myFocusNode,
                  searchController: _searchController),
            ),
          ),
          body: BlocSelector<HomeCubit, HomeState, bool>(selector: (state) {
            return state.hasFocusSearch ?? false;
          }, builder: (context, state) {
            return state
                ? const Column(
                    children: [Text('aaaaa'), DummySearch(), Placeholder()],
                  )
                : const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CategoriesListView(),
                      TitleText(text: ' Your choose category'),
                      SelectedListView(),
                      TitleText(text: 'Suggestions for you'),
                      BodyListView(),
                    ],
                  );
          }),
        ));
  }
}

