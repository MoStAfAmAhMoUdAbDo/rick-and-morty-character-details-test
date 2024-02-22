import 'package:bloc_test/constants/my_colors.dart';
import 'package:bloc_test/data/models/characters.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CharacterDetailsScreen extends StatelessWidget {
  final CharactersModel charactersModel;

  CharacterDetailsScreen({super.key, required this.charactersModel});

  Widget characterInf(String title,String value){
    return RichText(
      overflow: TextOverflow.ellipsis,
        maxLines: 1,
        text:TextSpan(
          children: [
            TextSpan(
              text: title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20.sp,
                color: MyColors.myhite,
              ),
            ),
            TextSpan(
              text: value,
              style: TextStyle(
                fontSize: 15.sp,
                color: MyColors.myhite,
              ),
            ),
          ],
        ),
    );
  }

  Widget buildDivider(double endIndent){
    return Divider(
      height: 30,
      thickness: 2,
      color: MyColors.myYellow,
      endIndent:endIndent ,
    );
  }

  Widget buildAppBar() {
    return SliverAppBar(
      expandedHeight: 500.h,
      stretch: true,
      pinned: true,
      backgroundColor: Colors.white,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        title: Text(
          charactersModel.name!,
          style: const TextStyle(
            color: MyColors.myGrey,
            fontWeight: FontWeight.bold
          ),
        ),
        background: Hero(
          tag: charactersModel.id!,
          child: Image.network(
            charactersModel.image!,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
  String getEpisode(){
    String result ="";
    for(int i =0 ;i<charactersModel.episode!.length;i++){
      List<String> temp=charactersModel.episode![i].split("episode/");
      result += "/ ${temp[1]}";
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.myGrey,
      body: CustomScrollView(
        shrinkWrap: true,
        slivers: [
          buildAppBar(),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Container(
                  margin:const EdgeInsetsDirectional.fromSTEB(14, 14, 14, 0),
                  padding: const EdgeInsets.all(11),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      characterInf("status : ", charactersModel.status!),
                      buildDivider(260.w),
                      characterInf("species : ", charactersModel.species!),
                      buildDivider(245.w),
                      characterInf("gender : ", charactersModel.gender!),
                      buildDivider(250.w),
                      characterInf("episode : ", getEpisode()),
                      buildDivider(246.w),
                    ],
                  ),
                ),
                SizedBox(height: 400.h,),

              ],
            ),
          ),
        ],
      ),
    );
  }
}
