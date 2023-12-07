import 'package:characters_project/constansts/colors.dart';
import 'package:characters_project/constansts/strings.dart';
import 'package:characters_project/data_layer/models.dart';
import 'package:flutter/material.dart';

class CharacterItem extends StatelessWidget {
  final Results characters;
  CharacterItem(this.characters);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
      decoration: BoxDecoration(
        color: MyColors.mywhite,
        borderRadius: BorderRadius.circular(8),
      ),
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(context, charcter_details, arguments: characters);
        },
        child: GridTile(
          child: Hero(
            tag: characters.id!,
            child: Container(
              height: double.infinity,
              width: double.infinity,
              color: MyColors.mygrey,
              child: characters.image!.isNotEmpty
                  ? FadeInImage.assetNetwork(
                      placeholder: 'assets/images/picture.gif',
                      image: characters.image!,
                      fit: BoxFit.cover,
                    )
                  : Image.asset('assets/images/img.png'),
            ),
          ),
          footer: Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            color: Colors.black54,
            alignment: Alignment.bottomCenter,
            child: Text(
              '${characters.name}',
              style: TextStyle(
                  height: 1.3,
                  fontSize: 16,
                  color: MyColors.mywhite,
                  fontWeight: FontWeight.bold),
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
