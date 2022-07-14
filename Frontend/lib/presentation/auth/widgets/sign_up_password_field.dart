import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../application/auth/sign_up_form/sign_up_form_bloc.dart';
import '../../core/theme.dart';

class PasswordWidget extends StatelessWidget {
  const PasswordWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var outlineInputBorder = OutlineInputBorder(
      gapPadding: 8,
      borderSide:
          const BorderSide(width: 1.2, color: Color.fromARGB(255, 9, 144, 153)),
      borderRadius: BorderRadius.circular(40),
    );
    var outlineErrorBorder = OutlineInputBorder(
      gapPadding: 8,
      borderSide: const BorderSide(width: 1.2, color: Colors.red),
      borderRadius: BorderRadius.circular(40),
    );
    return Container(
      height: 90,
      margin: const EdgeInsets.only(top: 5),
      padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 5),
      child: TextFormField(
        obscureText: true,
        showCursor: true,
        style: ThemeFile.textTheme.headline2,
        decoration: InputDecoration(
          errorStyle: const TextStyle(fontSize: 16),
          border: outlineInputBorder,
          focusedErrorBorder: outlineErrorBorder,
          errorBorder: outlineErrorBorder,
          focusedBorder: outlineInputBorder,
          prefixIcon: const Padding(
            padding: EdgeInsets.only(left: 15, right: 5),
            child: Icon(
              Icons.person_outline,
              color: Color.fromARGB(255, 0, 0, 0),
            ),
          ),
          hintText: "Enter password",
          hintStyle: ThemeFile.textTheme.headline4,
          labelText: "Password",
          labelStyle: ThemeFile.textTheme.headline3,
        ),
        autocorrect: false,
        onChanged: (value) =>
            context.read<UserBloc>().add(PasswordChanged(value)),
        validator: (_) =>
            context.read<UserBloc>().state.password.value.fold(
                  (f) => f.maybeMap(
                    shortPassword: (_) => 'short password',
                    orElse: () => null,
                  ),
                  (_) => null,
                ),
        textInputAction: TextInputAction.done,
      ),
    );
  }
}
