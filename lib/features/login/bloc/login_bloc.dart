import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial()) {
    on<LoginButtonPressed>(_onLoginButtonPressed);
  }

  Future<void> _onLoginButtonPressed(
      LoginButtonPressed event, Emitter<LoginState> emit) async {
    emit(LoginLoading());

    try {
      final response = await http.post(
        Uri.parse('https://api.accounts.vikncodes.com/api/v1/users/login'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, dynamic>{
          'username': event.username,
          'password': event.password,
          'is_mobile': true,
        }),
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = json.decode(response.body);
        final String? accessToken = responseData['data']['access'];
        final int? userId = responseData['data']['user_id'];

        if (accessToken != null && userId != null) {
          SharedPreferences prefs = await SharedPreferences.getInstance();
          await prefs.setString('token', accessToken);
          await prefs.setInt('userId', userId);

          emit(LoginSuccess());
        } else {
          emit(LoginFailure(error: 'Invalid response from server'));
        }
      } else {
        final Map<String, dynamic> responseData = json.decode(response.body);
        final String errorMessage =
            responseData['message'] ?? 'An error occurred';
        emit(LoginFailure(error: errorMessage));
      }
    } catch (error) {
      emit(LoginFailure(error: error.toString()));
    }
  }
}
