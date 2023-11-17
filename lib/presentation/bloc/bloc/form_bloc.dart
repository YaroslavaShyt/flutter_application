import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_application/data/datasource.dart';

part 'form_event.dart';
part 'form_state.dart';

class FormBloc extends Bloc<FormEvent, FormBlocState> {
  final ApiService apiService = ApiService();

  FormBloc() : super(FormInitial()) {
    on<SubmitFormEvent>(_onSubmitForm);
  }

  void _onSubmitForm(SubmitFormEvent event, Emitter<FormBlocState> emit) async {
    emit(FormLoading());

    try {
      var data = await apiService.sendFormData(event.formData);
      if (data["success"]) {
        emit(FormSuccess());
      } else {}
    } catch (error) {
      emit(FormError(error.toString()));
    }
  }
}
