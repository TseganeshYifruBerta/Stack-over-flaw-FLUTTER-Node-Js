import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../application/auth/sign_up_form/sign_up_form_bloc.dart';
import '../../core/theme.dart';

class EmailForm extends StatelessWidget {
  const EmailForm({
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
        keyboardType: TextInputType.emailAddress,
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
              Icons.email_outlined,
              color: Color.fromARGB(255, 0, 0, 0),
            ),
          ),
          hintText: "Enter email",
          hintStyle: ThemeFile.textTheme.headline4,
          labelText: "Email",
          labelStyle: ThemeFile.textTheme.headline3,
        ),
        autocorrect: false,
        onChanged: (value) =>
            context.read<UserBloc>().add(EmailChanged(value)),
        validator: (_) =>
            context.read<UserBloc>().state.emailAddress.value.fold(
                  (f) => f.maybeMap(
                    invalidEmail: (_) => 'Invalid Email',
                    orElse: () => null,
                  ),
                  (_) => null,
                ),
        textInputAction: TextInputAction.next,
      ),
    );
  }
}
