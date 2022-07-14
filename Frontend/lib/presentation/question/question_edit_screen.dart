import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../application/application.dart';
import '../../domain/domain.dart';
import '../../infrastructure/infrastructure.dart';
import '../presentation.dart';

class EditQuestionScreen extends StatelessWidget {
  Question question;
  EditQuestionScreen(this.question, {Key? key}) : super(key: key);

  // const EditQuestionScreen({Key? key}) : super(key: key);

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
    return BlocProvider(
      create: (BuildContext context) => QuestionFormBloc(
          questionRepository:
              QuestionRepositoryImpl(QuestionRemoteDataProvider())),
      child: Scaffold(
        drawer: const DrawerWidget(),
        appBar: AppBarWidgetsss(),
        body: BlocProvider<QuestionBloc>(
          create: (BuildContext context) => QuestionBloc(
              QuestionRepositoryImpl(QuestionRemoteDataProvider())),
          child: BlocConsumer<QuestionFormBloc, QuestionFormState>(
              listener: (context, state) => {
                    if (state.isQuestionSaveSuccess)
                      {
                        ScaffoldMessenger.of(context)
                          ..hideCurrentSnackBar()
                          ..showSnackBar(
                            const SnackBar(
                                backgroundColor: Colors.black,
                                content: Text(
                                  'Question updated Successfully',
                                  style: TextStyle(
                                      fontSize: 22, color: Colors.green),
                                )),
                          ),
                        context
                            .read<QuestionBloc>()
                            .add(LoadAllQuestionsEvent()),
                        context.go('/questions')
                      },
                    state.questionFailOrSuccess.fold(
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
                                    'Update a question',
                                    style: TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  Column(
                                    children: [
                                      Container(
                                        height: 90,
                                        margin: const EdgeInsets.only(top: 5),
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 0, vertical: 5),
                                        child: TextFormField(
                                          initialValue: question.title,
                                          autovalidateMode: AutovalidateMode
                                              .onUserInteraction,
                                          keyboardType: TextInputType.text,
                                          showCursor: true,
                                          style: ThemeFile.textTheme.headline2,
                                          decoration: InputDecoration(
                                            errorStyle: TextStyle(fontSize: 16),
                                            border: outlineInputBorder,
                                            focusedErrorBorder:
                                                outlineErrorBorder,
                                            errorBorder: outlineErrorBorder,
                                            focusedBorder: outlineInputBorder,
                                            hintText: "Title",
                                            hintStyle:
                                                ThemeFile.textTheme.headline4,
                                            labelText: "Question title",
                                            labelStyle:
                                                ThemeFile.textTheme.headline3,
                                          ),
                                          autocorrect: false,
                                          onChanged: (value) => context
                                              .read<QuestionFormBloc>()
                                              .add(TitleChanged(value)),
                                          validator: (_) => context
                                              .read<QuestionFormBloc>()
                                              .state
                                              .title
                                              .value
                                              .fold(
                                                (f) => f.maybeMap(
                                                  invalidTitle: (_) =>
                                                      'Invalid title',
                                                  orElse: () => null,
                                                ),
                                                (_) => null,
                                              ),
                                          textInputAction: TextInputAction.next,
                                        ),
                                      ),
                                      Container(
                                        height: 200,
                                        alignment: Alignment.topLeft,
                                        margin: const EdgeInsets.only(top: 5),
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 0, vertical: 5),
                                        child: TextFormField(
                                          initialValue: question.description,

                                          autovalidateMode: AutovalidateMode
                                              .onUserInteraction,
                                          textAlignVertical:
                                              TextAlignVertical.top,
                                          showCursor: true,
                                          style: ThemeFile.textTheme.headline2,
                                          minLines: 6,
                                          maxLines: 12,
                                          // any number you need (It works as the rows for the textarea)
                                          keyboardType: TextInputType.multiline,
                                          // maxLines: null,
                                          decoration: InputDecoration(
                                            alignLabelWithHint: true,
                                            errorStyle: TextStyle(fontSize: 16),
                                            border: outlineInputBorder,
                                            focusedErrorBorder:
                                                outlineErrorBorder,
                                            errorBorder: outlineErrorBorder,
                                            focusedBorder: outlineInputBorder,
                                            hintText: "Description",
                                            hintStyle:
                                                ThemeFile.textTheme.headline4,
                                            label: Text("Question Description"),
                                            labelStyle:
                                                ThemeFile.textTheme.headline3,
                                          ),
                                          autocorrect: false,
                                          onChanged: (value) => context
                                              .read<QuestionFormBloc>()
                                              .add(DescriptionChanged(value)),
                                          validator: (_) => context
                                              .read<QuestionFormBloc>()
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
                                    margin: const EdgeInsets.symmetric(
                                        vertical: 10),
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
                                        context.read<QuestionFormBloc>().add(
                                            UpdateQuestionPressed(question.id));
                                      },
                                      child: Text("Update",
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
        ),
      ),
    );
  }
}
