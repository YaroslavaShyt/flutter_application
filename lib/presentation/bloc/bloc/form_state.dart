part of 'form_bloc.dart';

abstract class FormBlocState {}

class FormInitial extends FormBlocState {}

class FormLoading extends FormBlocState {}

class FormSuccess extends FormBlocState {}

class FormError extends FormBlocState {
  final String errorMessage;

  FormError(this.errorMessage);
}
