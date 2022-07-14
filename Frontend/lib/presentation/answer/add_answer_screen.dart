import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:please/application/answer/answer_bloc.dart';
import 'package:please/domain/questions/question_model.dart';
import '../presentation.dart';

class AddAnswerScreen extends StatelessWidget {
  final String questionId;
  const AddAnswerScreen({Key? key, required this.questionId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var outlineInputBorder = OutlineInputBorder(
      gapPadding: 8,
      borderSide:
          const BorderSide(width: 1.2, color: Color.fromARGB(255, 9, 144, 153)),
      borderRadius: BorderRadius.circular(10),
    );
    var outlineErrorBorder = OutlineInputBorder(
      gapPadding: 8,
      borderSide: const BorderSide(width: 1.2, color: Colors.red),
      borderRadius: BorderRadius.circular(10),
    );
    return Scaffold(
      drawer: const DrawerWidget(),
      appBar: AppBarWidgetsss(),
      body: BlocConsumer<AnswerBloc, AnswerState>(
          listener: (context, state) => {
                if (state.isAnswerSaveSuccess)
                  {
                    state.answerFailOrSuccess.fold(
                        () {},
                        (question) => question.fold((l) => null, (r) {
                              context.go('/questions/${r.id}', extra: r);
                            })),

                    
                    ScaffoldMessenger.of(context)
                      ..hideCurrentSnackBar()
                      ..showSnackBar(
                        const SnackBar(
                            backgroundColor: Colors.black,
                            content: Text(
                              'Answer saved Successfully',
                              style:
                                  TextStyle(fontSize: 22, color: Colors.green),
                            )),
                      ),
                  },
                state.answerFailOrSuccess.fold(
                  () {},
                  (either) => either.fold(
                    (failure) {
                      String message;
                      message = failure.map(
                        cancelledByUser: (_) => 'Cancelled',
                        serverError: (_) => 'Server error',
                        accessDenied: (_) => 'Access denied',
                      );

                      ScaffoldMessenger.of(context)
                        ..hideCurrentSnackBar()
                        ..showSnackBar(
                          SnackBar(
                              backgroundColor: Colors.black,
                              content: Text(
                                message,
                                style: const TextStyle(
                                    fontSize: 22, color: Colors.red),
                              )),
                        );
                    },
                    (_) {},
                  ),
                )
              },
          builder: (context, state) {
            return Form(
              child: ListView(
                children: <Widget>[
                  Column(
                    children: [
                      const CommonDecor(),
                      Align(
                        alignment: Alignment.center,
                        child: Container(
                          width: 450,
                          height: 800,
                          child: Column(
                            children: [
                              const Text(
                                'Add an Answer',
                                style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 10),
                              Column(
                                children: [
                                  Container(
                                    height: 200,
                                    alignment: Alignment.topLeft,
                                    margin: const EdgeInsets.only(top: 5),
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 0, vertical: 5),
                                    child: TextFormField(
                                      autovalidateMode:
                                          AutovalidateMode.onUserInteraction,
                                      textAlignVertical: TextAlignVertical.top,
                                      showCursor: true,
                                      style: ThemeFile.textTheme.headline2,
                                      minLines: 6,
                                      maxLines: 12,
                                      // any number you need (It works as the rows for the textarea)
                                      keyboardType: TextInputType.multiline,
                                      // maxLines: null,
                                      decoration: InputDecoration(
                                        alignLabelWithHint: true,
                                        errorStyle:
                                            const TextStyle(fontSize: 16),
                                        border: outlineInputBorder,
                                        focusedErrorBorder: outlineErrorBorder,
                                        errorBorder: outlineErrorBorder,
                                        focusedBorder: outlineInputBorder,
                                        hintText: "Description",
                                        hintStyle:
                                            ThemeFile.textTheme.headline4,
                                        label: const Text("Answer Description"),
                                        labelStyle:
                                            ThemeFile.textTheme.headline3,
                                      ),
                                      autocorrect: false,
                                      onChanged: (value) => context
                                          .read<AnswerBloc>()
                                          .add(AnswerDescriptionChanged(value)),
                                      validator: (_) => context
                                          .read<AnswerBloc>()
                                          .state
                                          .description
                                          .value
                                          .fold(
                                            (f) => f.maybeMap(
                                              invalidDescription: (_) =>
                                                  'Invalid description',
                                              orElse: () => null,
                                            ),
                                            (_) => null,
                                          ),
                                      textInputAction: TextInputAction.next,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Container(
                                alignment: Alignment.center,
                                margin:
                                    const EdgeInsets.symmetric(vertical: 10),
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 11, horizontal: 65),
                                      primary: const Color.fromARGB(
                                          255, 56, 231, 243), // background
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10))
                                      // foreground
                                      ),
                                  onPressed: () {
                                    context
                                        .read<AnswerBloc>()
                                        .add(PostNewAnswerPressed(questionId));
                                  },
                                  child: Text("Submit",
                                      style: ThemeFile.textTheme.headline1),
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            );
          }),
    );
  }
}
