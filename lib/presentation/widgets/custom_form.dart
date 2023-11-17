import 'package:flutter/material.dart';
import 'package:flutter_application/presentation/bloc/bloc/form_bloc.dart';
import 'package:flutter_application/presentation/widgets/form_row.dart';
import 'package:flutter_application/presentation/widgets/send_button.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomForm extends StatefulWidget {
  const CustomForm({Key? key}) : super(key: key);

  @override
  State<CustomForm> createState() => _CustomFormState();
}

class _CustomFormState extends State<CustomForm> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController messageController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool isButtonEnabled = false;

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    messageController.dispose();
    super.dispose();
  }

  void updateButtonState() {
    setState(() {
      isButtonEnabled = _formKey.currentState?.validate() ?? false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<FormBloc, FormBlocState>(
      listener: (context, state) {
        if (state is FormSuccess) {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return const AlertDialog(
                  title: Text('Server response'),
                  content: Text('Data was delivered.'),
                );
              });
        } else if (state is FormError) {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: const Text('Server response'),
                  content:
                      Text('Data was not delivered: ${state.errorMessage}'),
                );
              });
        }
      },
      child: Form(
        key: _formKey,
        onChanged: updateButtonState,
        child: Column(
          children: [
            FormRow(
              labelText: 'Name',
              controller: nameController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Name is required';
                }
                return null;
              },
            ),
            const SizedBox(
              height: 40,
            ),
            FormRow(
              labelText: 'Email',
              controller: emailController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Email is required';
                } else if (!RegExp(
                        r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$')
                    .hasMatch(value)) {
                  return 'Enter a valid email address';
                }
                return null;
              },
            ),
            const SizedBox(
              height: 40,
            ),
            FormRow(
              labelText: 'Message',
              controller: messageController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Message is required';
                }
                return null;
              },
            ),
            const SizedBox(
              height: 50,
            ),
            BlocBuilder<FormBloc, FormBlocState>(
              builder: (context, state) {
                if (state is FormLoading) {
                  return const Text("Please wait...");
                } else {
                  return SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 50,
                    child: SendButton(
                      onPressed: isButtonEnabled
                          ? () {
                              final formData = {
                                'name': nameController.text,
                                'email': emailController.text,
                                'message': messageController.text,
                              };

                              context
                                  .read<FormBloc>()
                                  .add(SubmitFormEvent(formData));
                            }
                          : null,
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
