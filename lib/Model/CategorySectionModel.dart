class CategoryModel{

  var _id;
  String _imgurl;
  var _description;

  CategoryModel(this._id, this._imgurl, this._description);

   get description => _description;

  String get imgurl => _imgurl;

  get id => _id;
}