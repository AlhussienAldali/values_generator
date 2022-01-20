import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:values_generator/core/di/di.dart';
import 'package:values_generator/core/ui_constrains/app_colors.dart';
import 'package:values_generator/core/ui_constrains/dimensions.dart';
import 'package:values_generator/features/add_value/bloc/add_value_bloc.dart';
import 'package:values_generator/features/add_value/widgets/add_value_button.dart';
import 'package:values_generator/features/add_value/widgets/value_text_field.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:values_generator/core/ui_constrains/themes/app_theme.dart';

class AddValue extends StatefulWidget {
  const AddValue({Key? key}) : super(key: key);

  @override
  _AddValueState createState() => _AddValueState();
}

class _AddValueState extends State<AddValue> {
  late TextEditingController textEditingController;
  late AddValueBloc addValueBloc;

  @override
  void initState() {
    super.initState();
    textEditingController = TextEditingController();
    addValueBloc = getIt.get();
  }

  @override
  void dispose() {
    super.dispose();
    textEditingController.dispose();
    addValueBloc.close();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      padding: const EdgeInsets.all(Dimensions.MAIN_PADDING),
      child: Center(
        child: BlocBuilder<AddValueBloc, AddValueState>(
          bloc: addValueBloc,
          builder: (context, state) {
            if (state is AddValueInitial) {
              return _buildAddingValuePage();
            } else {
              if (state is LoadingState) {
                return const CircularProgressIndicator(
                  color: AppColors.primary,
                );
              } else {
                if (state is NewValueAddedSuccessfully)
                  return _buildSuccessPage();
                else {
                  return Container();
                }
              }
            }
          },
        ),
      ),
    ));
  }

  Column _buildAddingValuePage() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "add value text".tr(),
          style: context.bodyText1Style(),
        ),
        _simplePadding(),
        ValueTextField(
          textEditingController: textEditingController,
        ),
        _simplePadding(),
        AddValueButton(
          text: "save".tr(),
          onPressed: () {
            addValueBloc.add(SaveValue(valueText: textEditingController.text));
            textEditingController.clear();
          },
        )
      ],
    );
  }

  Padding _simplePadding() {
    return const Padding(padding: EdgeInsets.all(Dimensions.SIMPLE_PADING));
  }

  Widget _buildSuccessPage() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "new value".tr(),
          style: context.bodyText1Style(),
          textAlign: TextAlign.center,
        ),
        _simplePadding(),
        AddValueButton(
          text: "add another one".tr(),
          onPressed: () {
            addValueBloc.add(ReAddValue());
            textEditingController.clear();
          },
        )
      ],
    );
  }
}
