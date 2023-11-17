part of 'form_bloc.dart';

abstract class FormEvent {}

class SubmitFormEvent extends FormEvent {
  final Map<String, dynamic> formData;

  SubmitFormEvent(this.formData);
}
