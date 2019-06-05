import 'package:flutter/material.dart';
import 'package:playground_flutter/models/baseball.model.dart';

class CrudDemoListItem extends StatelessWidget {
  final BaseballModel item;
  final Function(BaseballModel) onPressedDelete;
  final Function(BaseballModel) onPressedEdit;

  const CrudDemoListItem({
    Key key,
    this.item,
    this.onPressedDelete,
    this.onPressedEdit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(item.name),
      subtitle: Text(item.coach),
      trailing: Container(
        width: 100,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.delete),
              onPressed: () => onPressedDelete(item),
            ),
            IconButton(
              icon: Icon(Icons.edit),
              onPressed: () => onPressedEdit(item),
            ),
          ],
        ),
      ),
    );
  }
}
