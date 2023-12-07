import 'package:characters_project/constansts/colors.dart';
import 'package:characters_project/data_layer/models.dart';
import 'package:flutter/material.dart';

class CharactersDetailsScreen extends StatelessWidget {
  final Results character;
  const CharactersDetailsScreen({required this.character});
  Widget buidSliverAppBar() {
    return SliverAppBar(
      expandedHeight: 600,
      pinned: true,
      stretch: true,
      backgroundColor: MyColors.mygrey,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        title: Text(character.name!,
            style: TextStyle(
              color: MyColors.mywhite,
            ) //,textAlign:TextAlign.start,
            // ),
            ),
        background: Hero(
          tag: character.id!,
          child: Image.network(
            character.image!,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  buildItemInfo(String title, String value) {
    return RichText(
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        text: TextSpan(children: [
          TextSpan(
              text: title,
              style: TextStyle(
                  color: MyColors.mywhite,
                  fontWeight: FontWeight.bold,
                  fontSize: 18)),
          TextSpan(
              text: value,
              style: TextStyle(
                  color: MyColors.mywhite,
                  fontWeight: FontWeight.bold,
                  fontSize: 18))
        ]));
  }

  buildDivier(double endindent) {
    return Divider(
      height: 30,
      color: MyColors.myyello,
      thickness: 2,
      endIndent: endindent,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.mygrey,
      body: CustomScrollView(
        slivers: [
          buidSliverAppBar(),
          SliverList(
              delegate: SliverChildListDelegate(
            [
              Container(
                margin: EdgeInsets.fromLTRB(14, 14, 14, 0),
                padding: EdgeInsets.all(8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    buildItemInfo(
                      'Gender : ',
                      '${character.gender}',
                    ),
                    buildDivier(315),
                    buildItemInfo(
                      'Status : ',
                      '${character.status}',
                    ),
                    buildDivier(280),
                    buildItemInfo(
                      'Speices : ',
                      '${character.species}',
                    ),
                    buildDivier(300),
                    buildItemInfo(
                      'Episode : ',
                      '${character.episode?.join(' / ')}',
                    ),
                    buildDivier(100),
                    buildItemInfo(
                      'created : ',
                      '${character.created}',
                    ),
                    buildDivier(150),
                    buildItemInfo(
                      'LocationName : ',
                      '${character.location!.name}',
                    ),
                    buildDivier(100),
                    SizedBox(height: 20)
                  ],
                ),
              ),
              SizedBox(height: 500),
            ],
          ))
        ],
      ),
    );
  }
}
