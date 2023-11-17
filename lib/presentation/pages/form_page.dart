import 'package:flutter/material.dart';
import 'package:flutter_application/core/colors.dart';
import 'package:flutter_application/presentation/bloc/bloc/form_bloc.dart';
import 'package:flutter_application/presentation/widgets/custom_appbar.dart';
import 'package:flutter_application/presentation/widgets/custom_form.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FormPage extends StatelessWidget {
  const FormPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: BlocProvider(
        create: (context) => FormBloc(),
        child: Container(
            margin: EdgeInsets.only(
                left: MediaQuery.of(context).size.width - 380,
                right: MediaQuery.of(context).size.width - 380,
                top: 30),
            child: const CustomForm()),
      ),
      backgroundColor: whiteColor,
    );
  }
}
