import 'package:flutter/material.dart';
import 'package:playground_flutter/models/stackoverflow.model.dart';
import 'package:playground_flutter/pages/code_examples/redux/preview_question.dart';

class QuestionItem extends StatelessWidget {
  final StackOverflowModel model;
  final Function(StackOverflowModel) onDelete;
  final Function(StackOverflowModel) onView;

  const QuestionItem({Key key, this.model, this.onDelete, this.onView})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onView(model),
      child: Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: Container(
          height: 230,
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Color(0xffeff2f3),
                offset: Offset(2.0, 10.0),
                blurRadius: 10.0,
              ),
            ],
          ),
          child: Column(
            children: <Widget>[
              ListTile(
                contentPadding: EdgeInsets.all(0),
                leading: model.owner.profileImage != null
                    ? FadeInImage.assetNetwork(
                        placeholder: 'assets/images/myAvatar.png',
                        image: model.owner.profileImage,
                      )
                    : CircleAvatar(
                        backgroundImage:
                            ExactAssetImage("assets/images/myAvatar.png"),
                      ),
                title: Text(model.owner.displayName),
                subtitle: Text("4 hours ago"),
                trailing: IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () => onDelete(model),
                ),
              ),
              SizedBox(height: 5),
              Text(
                model.title,
                textAlign: TextAlign.left,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20),
              Container(
                height: 40,
                width: MediaQuery.of(context).size.width,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: model.tags.map((t) {
                    return Padding(
                      padding: EdgeInsets.only(right: 20),
                      child: Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Color(0xffeff3f6),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Text(t),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
              Spacer(),
              Divider(
                color: Colors.grey.withOpacity(0.5),
                height: 5,
              ),
              SizedBox(height: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: <Widget>[
                      Text(
                        "${model.score}",
                        style: TextStyle(
                          fontSize: 22,
                        ),
                      ),
                      SizedBox(width: 5),
                      Text("votes"),
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: <Widget>[
                      Text(
                        "${model.answerCount}",
                        style: TextStyle(
                          fontSize: 22,
                        ),
                      ),
                      SizedBox(width: 5),
                      Text("answers"),
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: <Widget>[
                      Text(
                        "${model.viewCount}",
                        style: TextStyle(
                          fontSize: 22,
                        ),
                      ),
                      SizedBox(width: 5),
                      Text("views"),
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
