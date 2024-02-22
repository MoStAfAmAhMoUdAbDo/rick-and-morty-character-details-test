import 'package:bloc_test/business_logic/characters_cubit.dart';
import 'package:bloc_test/constants/my_colors.dart';
import 'package:bloc_test/data/models/characters.dart';
import 'package:bloc_test/data/models/charater_result.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_offline/flutter_offline.dart';

import '../widgets/character_widget.dart';

class CharacterScreen extends StatefulWidget {
  const CharacterScreen({super.key});

  @override
  State<CharacterScreen> createState() => _CharacterScreenState();
}

class _CharacterScreenState extends State<CharacterScreen> {
  late CharactersResult charactersResult;

  List<CharactersModel> searchedList = [];
  final TextEditingController searchController = TextEditingController();
  bool isSearch = false;

  @override
  void initState() {
    super.initState();
    getData();
  }

  void getData() async {
    await BlocProvider.of<CharactersCubit>(context).getAllCharacters();
  }

  List<Widget> appBarAction() {
    if (isSearch) {
      return [
        IconButton(
          onPressed: () {
            searchController.clear();
            setState(() {});
            Navigator.of(context).pop();
          },
          icon: const Icon(
            Icons.clear,
            color: MyColors.myGrey,
          ),
        ),
      ];
    } else {
      return [
        IconButton(
          onPressed: () {
            startSearch();
          },
          icon: const Icon(
            Icons.search,
            color: MyColors.myGrey,
          ),
        )
      ];
    }
  }

  startSearch() {
    ModalRoute.of(context)!
        .addLocalHistoryEntry(LocalHistoryEntry(onRemove: stopSearch));
    isSearch = true;
    setState(() {});
  }

  stopSearch() {
    searchController.clear();
    isSearch = false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: MyColors.myGrey),
        backgroundColor: MyColors.myYellow,
        title: isSearch
            ? buildTextForm()
            : Text(
                "Characters",
                style: TextStyle(
                  color: MyColors.myGrey,
                  fontSize: 24.sp,
                ),
              ),
        actions: appBarAction(),
      ),
      body: OfflineBuilder(
        connectivityBuilder: (
          BuildContext context,
          ConnectivityResult connectivity,
          Widget child,
        ) {
          final bool connected = connectivity != ConnectivityResult.none;
          if(connected){

           return buildBlocWidget();
          }
          else {
            return noInternetWidget();
          }
        },
        child:const Center(
          child: CircularProgressIndicator(
            color: MyColors.myYellow,
          ),
        ),
      ),

    );
  }
  Widget noInternetWidget(){
    return Center(
      child: Container(
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 20.h,
            ),
            Text("Can't connect ... check internet",style: TextStyle(
              fontSize: 22.sp,
              color: MyColors.myGrey,
            ),),
            Image.asset("images/internet.jpg" ,fit: BoxFit.cover,),
          ],
        ),
      ),
    );
  }

  Widget buildBlocWidget() {
    return BlocBuilder<CharactersCubit, CharactersState>(
        builder: (context, state) {
      //print("data");
      if (state is CharactersLoaded) {
        charactersResult = state.charactersResult;
        return buildLoadedList();
      } else {
        return const Center(
          child: CircularProgressIndicator(
            color: MyColors.myYellow,
          ),
        );
      }
    });
  }

  Widget buildLoadedList() {
    return SingleChildScrollView(
      child: Container(
        color: MyColors.myGrey,
        child: Column(
          children: [
            buildCharacterList(),
          ],
        ),
      ),
    );
  }

  Widget buildCharacterList() {
    return GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 2 / 3,
          crossAxisSpacing: 1,
          mainAxisSpacing: 1,
        ),
        itemCount: searchController.text.isNotEmpty
            ? searchedList.length
            : charactersResult.characters!.length,
        shrinkWrap: true,
        physics: const ClampingScrollPhysics(),
        itemBuilder: (context, index) {
          return CharacterWidgetDesign(
            character: searchController.text.isNotEmpty
                ? searchedList[index]
                : charactersResult.characters![index],
          );
        });
  }

  Widget buildTextForm() {
    return TextFormField(
      controller: searchController,
      cursorColor: MyColors.myGrey,
      decoration: InputDecoration(
        hintText: "Find a character ...",
        border: InputBorder.none,
        hintStyle: TextStyle(
          color: MyColors.myGrey,
          fontSize: 14.sp,
        ),
      ),
      onChanged: (character) {
        addSearchedForSearchedList(character);
      },
    );
  }

  void addSearchedForSearchedList(String searchedCharacter) {
    searchedList = charactersResult.characters!
        .where((characterSearch) =>
            characterSearch.name!.toLowerCase().startsWith(searchedCharacter))
        .toList();
    setState(() {});
  }
}
