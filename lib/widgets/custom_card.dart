import 'package:charts_flutter/flutter.dart' as charts;
import 'package:demo_todo_app/models/todo.dart';
import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  Color cor;
  String title, estimativa;
  List<Todo> data;

  CustomCard(
      {@required this.cor,
      @required this.title,
      @required this.estimativa,
      @required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: cor, borderRadius: BorderRadius.all(Radius.circular(30))),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Container(
                height: 120,
                child: charts.PieChart(
                  series(data),
                  animate: true,
                  defaultRenderer: charts.ArcRendererConfig(
                    arcWidth: 6,
                    startAngle: 1 / 5 * 3.14,
                  ),
                ),
              ),
              Container(
                  alignment: Alignment.center,
                  child: Text(
                    '${((data[1].limit * 100) / data[1].limitFn).round()}%',
                    style: TextStyle(color: Colors.white),
                  ))
            ],
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 18.0),
            child: RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.w900),
                  text: title,
                  children: [
                    TextSpan(
                        text: '\n$estimativa',
                        style: TextStyle(fontWeight: FontWeight.normal))
                  ]),
            ),
          ),
        ],
      ),
    );
  }

  series(List<Todo> data) {
    return [
      charts.Series(
          domainFn: (Todo toDo, _) => toDo.domainFn,
          measureFn: (Todo toDo, _) => toDo.limit,
          id: 'tarefas',
          data: data),
    ];
  }
}
