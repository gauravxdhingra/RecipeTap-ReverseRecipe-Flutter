class RecipeModel {
  final String title;
  final String coverPhotoUrl;
  final String desc;
  final String time;
  final String servings;
  final yeild;
  final List ingredients;
  final List steps;
  final List nutritionalFacts;
  final List cooksNotes;

  RecipeModel({
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
}
