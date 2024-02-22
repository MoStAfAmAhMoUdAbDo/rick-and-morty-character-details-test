import 'package:bloc_test/constants/my_colors.dart';
import 'package:bloc_test/data/models/characters.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../constants/strings.dart';
import '../screens/character_details.dart';


class CharacterWidgetDesign extends StatelessWidget {
  final CharactersModel character;

  const CharacterWidgetDesign({super.key, required this.character});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
      padding: const EdgeInsetsDirectional.all(4),
      decoration: BoxDecoration(
        color: MyColors.myhite,
        borderRadius: BorderRadius.circular(10),
      ),
      child: InkWell(
        onTap: (){
          //Navigator.of(context).pushNamed(characterDetailsScreen ,arguments: character);
          Navigator.of(context).push(MaterialPageRoute(builder: (_)=>CharacterDetailsScreen(charactersModel: character,)));
        },
        child: GridTile(
          footer: Hero(
            tag: character.id!,
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              color: Colors.black54,
              alignment: Alignment.bottomCenter,
              child: Text(character.name! ,style: TextStyle(
                height: 1.3,
                fontSize: 16.sp,
                color: MyColors.myhite,
                fontWeight: FontWeight.bold,
              ),
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                textAlign: TextAlign.center,
              ),
            ),
          ),
          child: Container(
            child: character.image!.isNotEmpty
                ? // Load a Lottie file from a remote url
                FadeInImage.assetNetwork(
                  width: double.infinity,
                    height:double.infinity,
                    fit: BoxFit.cover,
                    placeholder: "images/giphy.gif",
                    image: character.image!
                )
                : Image.asset(
                    "images/images (1).jpg",
                    fit: BoxFit.cover,
                  ),
          ),
        ),
      ),
    );
  }
}
