import 'dart:ui';

import 'package:demo_todo_app/models/todo.dart';
import 'package:demo_todo_app/utils/constants.dart';
import 'package:demo_todo_app/utils/screen_size.dart';
import 'package:demo_todo_app/widgets/custom_card.dart';
import 'package:demo_todo_app/widgets/todo_list_item.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        backgroundColor: Color.fromRGBO(255, 248, 234, 1),
        drawer: Drawer(child: Text('Fenix Innovations')),
        body: SingleChildScrollView(
          physics: NeverScrollableScrollPhysics(),
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                      height: heightScreen(context) / 3.1,
                      decoration: BoxDecoration(
                          color: bg_color,
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(30),
                              bottomRight: Radius.circular(30)))),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                            top: heightScreen(context) / 20,
                            left: widthScreen(context) / 20),
                        child: IconButton(
                          icon: Icon(Icons.menu, size: 30),
                          onPressed: () {
                            _scaffoldKey.currentState.openDrawer();
                          },
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            top: heightScreen(context) / 20,
                            right: widthScreen(context) / 20),
                        child: IconButton(
                          icon: Icon(Icons.search, size: 30),
                          onPressed: () {},
                        ),
                      ),
                    ],
                  ),
                  Container(
                      margin: EdgeInsets.only(
                          top: heightScreen(context) / 6,
                          left: widthScreen(context) / 6),
                      child: CircleAvatar(
                        radius: 40,
                        child: Icon(
                          Icons.person,
                          size: 60,
                        ),
                      )),
                  Container(
                    margin: EdgeInsets.only(
                        top: heightScreen(context) / 6.4,
                        left: widthScreen(context) / 7),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: 100,
                          width: 100,
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(100)),
                              border: Border.all(
                                  color: Colors.redAccent[100], width: 6)),
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 30),
                          child: RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w900,
                                    fontSize: 20),
                                text: 'Igor Sambo',
                                children: [
                                  TextSpan(
                                      text: '\nMobile Developer',
                                      style: TextStyle(
                                          fontWeight: FontWeight.normal))
                                ]),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
              SingleChildScrollView(
                physics: AlwaysScrollableScrollPhysics(),
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.all(20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Minhas Tarefas',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w700)),
                          CircleAvatar(
                            backgroundColor: verde,
                            child: Icon(Icons.calendar_today),
                          )
                        ],
                      ),
                    ),
                    TodoListItem(
                        cor: vermelho,
                        icon: Icons.alarm,
                        title: Text('To Do'),
                        subtitle: Text('5 Tarefas por fazer. 1 iniciada')),
                    TodoListItem(
                        cor: amarelo,
                        icon: Icons.watch_later_outlined,
                        title: Text('To Do'),
                        subtitle: Text('5 Tarefas por fazer. 1 iniciada')),
                    TodoListItem(
                        cor: azul,
                        icon: Icons.done,
                        title: Text('To Do'),
                        subtitle: Text('5 Tarefas por fazer. 1 iniciada')),
                    Container(
                      alignment: Alignment.bottomLeft,
                      margin: EdgeInsets.only(left: 20, top: 20),
                      child: Text('Projectos em Progresso',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w700)),
                    ),
                    Container(
                      height: heightScreen(context) / 3,
                      margin: EdgeInsets.only(left: 10, right: 10),
                      child: GridView.count(
                        crossAxisCount: 2,
                        childAspectRatio: 0.8,
                        crossAxisSpacing: 40,
                        children: [
                          CustomCard(
                              cor: verde,
                              title: 'Meetup hoje',
                              estimativa: 'Faltam 9 horas',
                              data: <Todo>[
                                Todo('Por fazer', 24, 10),
                                Todo('Feito', 24, 4),
                                Todo('Em progresso', 24, 10)
                              ]),
                          CustomCard(
                              cor: vermelho,
                              title: 'Apresentação',
                              estimativa: 'A decorrer',
                              data: <Todo>[
                                Todo('Por fazer', 24, 10),
                                Todo('Feito', 24, 4),
                                Todo('Em progresso', 24, 10)
                              ]),
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
