import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:values_generator/core/di/di.dart';
import 'package:values_generator/core/ui_constrains/app_colors.dart';
import 'package:values_generator/core/ui_constrains/dimensions.dart';
import 'package:values_generator/features/favorites/bloc/favorites_bloc.dart';
import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:values_generator/core/ui_constrains/themes/app_theme.dart';
import 'package:easy_localization/easy_localization.dart';

class Favorites extends StatefulWidget {
  const Favorites({Key? key}) : super(key: key);

  @override
  _FavoritesState createState() => _FavoritesState();
}

class _FavoritesState extends State<Favorites> {
  late FavoritesBloc favoritesBloc;

  @override
  void initState() {
    super.initState();
    favoritesBloc = getIt.get<FavoritesBloc>();
  }

  @override
  void dispose() {
    super.dispose();
    favoritesBloc.close();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: BlocBuilder<FavoritesBloc, FavoritesState>(
            bloc: favoritesBloc,
            builder: (context, state) {
              if (state is FavoritesInitial) {
                return const CircularProgressIndicator(
                  color: AppColors.primary,
                );
              } else if (state is SuccessFulData) {
                return _buildFavoritesPage(state.favorites);
              } else {
                return Container();
              }
            }),
      ),
    );
  }

  Widget _buildFavoritesPage(List<String> favorites) {
    if(favorites.length==0)
      return Container(
        padding: EdgeInsets.all(Dimensions.MAIN_PADDING),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("empty favorites".tr(),
              textAlign: TextAlign.center,
              style: context.bodyText1Style(),
            ),

            Icon(Icons.favorite_border,color: AppColors.primary,size: Dimensions.ICON_SIZE,)
          ],
        ),
      );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "your favorite values".tr(),
          style: context.bodyText1Style(),
        ),
        Container(
          height: Dimensions.LIST_VIEW_BUILDER_HIGHT,
          child: ListView.builder(
              shrinkWrap: false,
              padding: const EdgeInsets.all(Dimensions.MAIN_PADDING),
              itemCount: favorites.length,
              itemBuilder: (BuildContext context, int index) {
                return Column(children: [
                  ExpansionTileCard(
                    elevation: 0,
                    expandedTextColor: AppColors.primary,
                    baseColor: AppColors.primary,
                    title: Text(
                      favorites[index].length>10 ?favorites[index].substring(0,9):
                      favorites[index],
                    ),
                    children: <Widget>[
                      Text(
                        favorites[index],
                        style: context.mainScreenTextStyle(),
                        textAlign: TextAlign.center,
                      ),
                      Divider(
                        height: 5,
                      )
                    ],
                  ),
                  const Padding(padding: EdgeInsets.all(10))
                ]);
              }),
        ),
      ],
    );
  }
}
