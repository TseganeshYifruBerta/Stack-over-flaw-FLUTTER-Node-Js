import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../application/application.dart';
import '../presentation.dart';

class QuestionScreen extends StatelessWidget {
  const QuestionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: const DrawerWidget(),
        appBar:AppBarComponent(),
        body: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'All Questions',
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

                          // context
                          //     .read<QuestionBloc>()
                          //     .add(LoadAllQuestionsEvent());

                          // context
                          //     .read<SignInFormBloc>()
                          //     .add(const SignInWithEmailAndPasswordPressed());
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
                  BlocBuilder<QuestionBloc, QuestionState>(
                    // buildWhen: (p, c) => c is! UpdateSuccessful,
                    builder: (_, QuestionState state) {
                      if (state is QuestionLoading) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }

                      // if (state is TodosLoadingFailed) {
                      //   return Center(
                      //     child: Text(state.msg),
                      //   );
                      // }

                      if (state is QuestionLoaded) {
                        return ListView.builder(
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          itemCount: state.questions.length,
                          itemBuilder: (_, int i) {
                            return Card(
                              color: Color.fromARGB(255, 225, 225, 224),
                              child: ListTile(
                                  onTap: () {
                                    context.go(
                                        '/questions/${state.questions[i].id}',
                                        extra: state.questions[i]);
                                  },
                                  title: Text(
                                    state.questions[i].title,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.w500),
                                  ),
                                  subtitle: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        height: 8,
                                      ),
                                      Text('Asked by: ' +
                                          state.questions[i].authorName),
                                      SizedBox(
                                        height: 8,
                                      ),
                                      Text('Asked on: ' +
                                          state.questions[i].dateTime
                                              .toString()),
                                    ],
                                  )),
                            );
                          },
                        );
                      }

                      return const Text("should never happen");
                    },
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
