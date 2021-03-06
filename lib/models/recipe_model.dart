import 'package:cloud_firestore/cloud_firestore.dart';

class RecipeModel {
  final String title;
  final List coverPhotoUrl;
  final String desc;
  final String time;
  final String servings;
  final String recipeUrl;
  final yeild;
  final List ingredients;
  final List steps;
  final List nutritionalFacts;
  final List cooksNotes;
  final bool oldWebsite;

  RecipeModel({
    this.oldWebsite,
    this.recipeUrl,
    this.title,
    this.coverPhotoUrl,
    this.desc,
    this.time,
    this.servings,
    this.yeild,
    this.ingredients,
    this.steps,
    this.nutritionalFacts,
    this.cooksNotes,
  });

  factory RecipeModel.fromDocument(DocumentSnapshot doc) {
    return RecipeModel(
      title: doc['title'],
      desc: doc['desc'],
      coverPhotoUrl: doc['coverImageUrl'],
      recipeUrl: doc['recipeUrl'],
      // timestamp: doc['timestamp'],
    );
  }
}
