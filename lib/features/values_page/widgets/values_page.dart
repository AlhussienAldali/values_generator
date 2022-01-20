import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:values_generator/core/di/di.dart';
import 'package:values_generator/core/ui_constrains/app_colors.dart';
import 'package:values_generator/core/ui_constrains/dimensions.dart';
import 'package:values_generator/core/ui_constrains/themes/app_theme.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:values_generator/features/values_page/bloc/values_bloc.dart';


class ValuesPage extends StatefulWidget {
  const ValuesPage({Key? key}) : super(key: key);

  @override
  _ValuesPageState createState() => _ValuesPageState();
}

class _ValuesPageState extends State<ValuesPage> {
  late ValuesBloc valuesBloc;

  @override
  void initState() {
    super.initState();
    valuesBloc = getIt.get();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("main screen title".tr()),
          backgroundColor: AppColors.primary,
          // actions: const [Favorite()],
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlocBuilder<ValuesBloc, ValuesState>(
              bloc: valuesBloc,
              builder: (context, state) {
                if (state is RepeatedState) {
                  return AnimatedSwitcher(
                    duration: const Duration(seconds: 3),
                    transitionBuilder: (Widget child, Animation<double> animation) {
                      return ScaleTransition(scale: animation, child: child);
                    },
                    child: _valueDisplay(

                        value: state.selectedValue,
                        isFavorite: state.isFavorite),
                  );
                } else {
                  return const Center(
                      child: CircularProgressIndicator(
                    color: AppColors.primary,
                  ));
                }
              },
            ),
          ],
        ));
  }

  Widget _valueDisplay({required String value, required bool isFavorite}) {
    return Column(
      key: Key(value),
      children: [
        Container(
          padding: const EdgeInsets.all(Dimensions.MAIN_PADDING),
          // color: AppColors.white,
          child: Center(
            child: Text(
              value,
              textAlign: TextAlign.center,
              style: context.mainScreenTextStyle(),
            ),
          ),
        ),
        IconButton(
            onPressed: () {
              valuesBloc.add(UpdateFavorites(index :valuesBloc.currentIndex));
            },
            icon: Icon(isFavorite ? Icons.favorite : Icons.favorite_border,
            color: AppColors.primary,
              size: Dimensions.ICON_SIZE,
            ))
      ],
    );
  }
}
