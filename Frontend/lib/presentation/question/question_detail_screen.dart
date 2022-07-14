import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:please/application/answer/answer_bloc.dart';
import 'package:please/application/application.dart';
import 'package:please/domain/questions/question_model.dart';
import 'package:please/infrastructure/infrastructure.dart';

import '../presentation.dart';

class QuestionDetailScreen extends StatefulWidget {
  Question question;
  QuestionDetailScreen(this.question, {Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return RecipeDetailState();
  }
}

class RecipeDetailState extends State<QuestionDetailScreen> {
  double servings = 1;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<QuestionFormBloc>(
      create: (BuildContext context) => QuestionFormBloc(
          questionRepository:
              QuestionRepositoryImpl(QuestionRemoteDataProvider())),
      child: Scaffold(
        drawer: const DrawerWidget(),
        appBar: AppBarComponent(),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: [
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Question',
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.w400),
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(
                                vertical: 6, horizontal: 20),
                            primary: Colors.amber, // background
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5))
                            // foreground
                            ),
                        onPressed: () {
                          context.go('/questions/add');
                        },
                        child: const Text("Ask question",
                            style:
                                TextStyle(color: Colors.black, fontSize: 20)),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: const Color.fromARGB(255, 234, 239, 234),
                      border: const Border(
                        top: BorderSide(
                            color: Color.fromARGB(255, 82, 42, 42),
                            width: 1,
                            style: BorderStyle.solid),
                        left: BorderSide(
                            color: Color.fromARGB(255, 82, 42, 42),
                            width: 1,
                            style: BorderStyle.solid),
                        right: BorderSide(
                            color: Color.fromARGB(255, 82, 42, 42),
                            width: 1,
                            style: BorderStyle.solid),
                        bottom: BorderSide(
                            color: Color.fromARGB(255, 82, 42, 42),
                            width: 1,
                            style: BorderStyle.solid),
                      ),
                    ),
                    child: Column(
                      children: [
                        ListTile(
                            onTap: () {},
                            title: Text(
                              widget.question.title,
                              style: const TextStyle(
                                  fontWeight: FontWeight.w700,
                                  color: Color.fromARGB(255, 5, 151, 255)),
                            ),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(
                                  height: 8,
                                ),
                                Text(widget.question.description),
                                const SizedBox(
                                  height: 8,
                                ),
                                Text('Asked by: ${widget.question.authorName}'),
                                const SizedBox(
                                  height: 8,
                                ),
                                Text('Asked on: ${widget.question.dateTime}'),
                              ],
                            )),
                        BlocBuilder<AuthenticationBloc, AuthenticationState>(
                          builder: (context, state) {
                            if (state is Authenticated &&
                                state.id == widget.question.authorId) {
                              return Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  IconButton(
                                      onPressed: () {
                                        context.go(
                                            '/questions/edit/${widget.question.id}',
                                            extra: widget.question);
                                      },
                                      icon: Icon(Icons.edit)),
                                  BlocListener<QuestionFormBloc,
                                      QuestionFormState>(
                                    listener: (context, state) {
                                      if (state.isQuestionDeleteSuccess) {
                                        ScaffoldMessenger.of(context)
                                          ..hideCurrentSnackBar()
                                          ..showSnackBar(
                                            const SnackBar(
                                                backgroundColor: Colors.black,
                                                content: Text(
                                                  'Question deleted Successfully',
                                                  style: TextStyle(
                                                      fontSize: 22,
                                                      color: Colors.green),
                                                )),
                                          );
                                        context.go('/questions');
                                      }
                                    },
                                    child: IconButton(
                                        onPressed: () {
                                          context.read<QuestionFormBloc>().add(
                                              DeleteQuestionPressed(
                                                  widget.question.id));
                                        },
                                        icon: Icon(Icons.delete)),
                                  )
                                ],
                              );
                            } else {
                              return Row();
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: const Color.fromARGB(255, 234, 239, 234),
                      border: const Border(
                        top: BorderSide(
                            color: Color.fromARGB(255, 82, 42, 42),
                            width: 1,
                            style: BorderStyle.solid),
                        left: BorderSide(
                            color: Color.fromARGB(255, 82, 42, 42),
                            width: 1,
                            style: BorderStyle.solid),
                        right: BorderSide(
                            color: Color.fromARGB(255, 82, 42, 42),
                            width: 1,
                            style: BorderStyle.solid),
                        bottom: BorderSide(
                            color: Color.fromARGB(255, 82, 42, 42),
                            width: 1,
                            style: BorderStyle.solid),
                      ),
                    ),
                    child: Column(
                      children: [
                        ListView.builder(
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          itemCount: widget.question.answer.length,
                          itemBuilder: (_, int i) {
                            return Column(
                              children: [
                                Card(
                                  color: Color.fromARGB(255, 225, 225, 224),
                                  child: ListTile(
                                      onTap: () {
                                        // context.go(
                                        //     '/questions/${state.questions[i].id}',
                                        //     extra: state.questions[i]);
                                      },
                                      title: Text(
                                        widget.question.answer[i].getDscription,
                                        style: const TextStyle(
                                            fontWeight: FontWeight.w500),
                                      ),
                                      subtitle: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const SizedBox(
                                            height: 8,
                                          ),
                                          Text(
                                              'Answered by: ${widget.question.answer[i].authorName}'),
                                          const SizedBox(
                                            height: 8,
                                          ),
                                          Text(
                                              'Answered on: ${widget.question.answer[i].dateTime}'),
                                        ],
                                      )),
                                ),
                                BlocBuilder<AuthenticationBloc,
                                    AuthenticationState>(
                                  builder: (context, state) {
                                    if (state is Authenticated &&
                                        state.id ==
                                            widget
                                                .question.answer[i].authorId) {
                                      return Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          IconButton(
                                              onPressed: () {
                                                context.go(
                                                    '/answers/edit/${widget.question.answer[i].id}',
                                                    extra: widget
                                                        .question.answer[i]);
                                              },
                                              icon: const Icon(Icons.edit)),
                                          BlocListener<AnswerBloc, AnswerState>(
                                            listener: (context, state) {
                                              if (state.isAnswerDeleteSuccess) {
                                                ScaffoldMessenger.of(context)
                                                  ..hideCurrentSnackBar()
                                                  ..showSnackBar(
                                                    const SnackBar(
                                                        backgroundColor:
                                                            Colors.black,
                                                        content: Text(
                                                          'Answer deleted Successfully',
                                                          style: TextStyle(
                                                              fontSize: 22,
                                                              color:
                                                                  Colors.green),
                                                        )),
                                                  );

                                                state.answerFailOrSuccess.fold(
                                                    () {},
                                                    (question) => question.fold(
                                                            (l) => null, (r) {
                                                          print(r.answer);
                                                          context.go(
                                                              '/questions/${r.id}',
                                                              extra: r);
                                                        }));
                                              }
                                            },
                                            child: IconButton(
                                                onPressed: () {
                                                  context
                                                      .read<AnswerBloc>()
                                                      .add(
                                                        DeleteAnswerPressed(
                                                            questionId: widget
                                                                .question.id,
                                                            answerId: widget
                                                                .question
                                                                .answer[i]
                                                                .id),
                                                      );
                                                },
                                                icon: const Icon(Icons.delete)),
                                          )
                                        ],
                                      );
                                    } else {
                                      return Row();
                                    }
                                  },
                                ),
                              ],
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            context.go('/answers/add/${widget.question.id}',
                extra: widget.question.id);
          },
          label: const Text('Answer'),
          icon: const Icon(Icons.add),
          backgroundColor: Colors.pink,
        ),
      ),
    );
  }
}
