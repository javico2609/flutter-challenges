import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/material.dart';
import 'package:playground_flutter/configs/ioc.dart';
import 'package:playground_flutter/models/baseball.model.dart';
import 'package:playground_flutter/pages/code_examples/pdf_and_csv/view_csv_data.dart';
import 'package:playground_flutter/services/sqlite_basebal_team.service.dart';
import 'package:playground_flutter/shared/widgets/crud_demo_list_item.widget.dart';
import 'package:csv/csv.dart';

class CsvGeneratorDemo extends StatelessWidget {
  final SqliteBaseballService _databaseService =
      Ioc.get<SqliteBaseballService>();

  CsvGeneratorDemo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CSV generate and load'),
        actions: <Widget>[
          InkWell(
            onTap: () => _generateCSVAndView(context),
            child: Align(
              alignment: Alignment.center,
              child: Text('CSV'),
            ),
          ),
          SizedBox(width: 10),
        ],
      ),
      body: StreamBuilder(
          stream: _databaseService.list(),
          builder: (_, AsyncSnapshot<List<BaseballModel>> snapshot) {
            if (!snapshot.hasData) {
              return Center(
                child: Text(
                  "No data found !!!",
                  style: TextStyle(
                    color: Colors.red,
                  ),
                ),
              );
            }

            return ListView(
              children: snapshot.data.map((item) {
                return CrudDemoListItem(
                  item: item,
                  onPressedDelete: (item) {},
                  onPressedEdit: (item) {},
                );
              }).toList(),
            );
          }),
    );
  }

  Future<void> _generateCSVAndView(context) async {
    List<BaseballModel> data = await _databaseService.list().first;
    List<List<String>> csvData = [
      // headers
      <String>['Name', 'Coach', 'players'],
      // data
      ...data.map((item) => [item.name, item.coach, item.players.toString()]),
    ];

    String csv = const ListToCsvConverter().convert(csvData);

    final String dir = (await getApplicationDocumentsDirectory()).path;
    final String path = '$dir/baseball_teams.csv';

    // create file
    final File file = File(path);
    // Save csv string using default configuration
    // , as field separator
    // " as text delimiter and
    // \r\n as eol.
    await file.writeAsString(csv);

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => LoadAndViewCsvPage(path: path),
      ),
    );
  }
}
