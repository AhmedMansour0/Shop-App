import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/layout/news_app/cubit/cubit.dart';
import 'package:untitled/layout/news_app/cubit/states.dart';
import 'package:untitled/modules/news_app/search/search_screen.dart';
import 'package:untitled/shared/network/remote/dio_helper.dart';

import '../../shared/components/components.dart';
import '../../shared/components/cubit/cubit.dart';

class NewsLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit,NewsStates>(
        listener: (context, state){},
        builder: (context, state){
          var cubit = NewsCubit.get(context);
          return Scaffold(
            body: cubit.screens[cubit.currentIndex],
            appBar: AppBar(
              title: Text(
                  'News App'
              ),
              actions: [
                IconButton(
                  onPressed: ()
                  {
                    navigateTo(context,SearchScreen());
                  },
                  icon: (Icon(Icons.search))
              ),
                IconButton(
                    onPressed: (){
                      AppCubit.get(context).changeAppMode();
                    },
                    icon: (Icon(Icons.brightness_4_outlined))
                ),
              ],
            ),
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: cubit.currentIndex,
              onTap: (index){
                cubit.changeBottomNavBar(index);
              },
              items: cubit.bottomItems,
            ),
          );
        },

    );
  }
}
