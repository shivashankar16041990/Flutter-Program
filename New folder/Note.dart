

class Note
{
  late int _id;
  late String _title;
  late String _description;
  late String _date;
  late int _prioprity;

  Note(this._title,this._date,this._prioprity,[String description=" " ]){

    this._description=description;
  }
  Note.withID(this._id,this._title,this._date,this._prioprity,[String description=" " ]){

    this._description=description;
  }
  int get id =>_id;
  String get title=>_title;
  String get description=>_description;
  String get date=>_date;
  int get prioprity=>_prioprity;


  set title(String newTitle){
    if(newTitle.length<=255) {
      this._title = newTitle;
    }
  }

  set description(String newDescription){
    if(newDescription.length<=255) {
      this._description = newDescription;
    }
  }

  set date(String newDate){
    if(newDate.length<=255) {
      this._date = newDate;
    }
  }
  set prioprity (int newPrioprity){
    if(newPrioprity==0 || newPrioprity==1) {
      this._prioprity = newPrioprity;
    }
  }

  Map<String ,dynamic> toMap() {
    Map<String, dynamic> mymap = Map();
    if (id != null) {
      mymap['id'] = _id;
    }
    mymap['_description'] = _description;
    mymap['date'] = _date;
    mymap['prioprity'] = _prioprity;
    mymap['title'] = _title;
    return mymap;
  }

  Note.fromMaptobject(Map<String ,dynamic> mymap)
  {
    this._id=mymap['id'];
    this. _description =mymap['_description'] ;
    this._date = mymap['date'] ;
    this. _prioprity = mymap['prioprity'] ;
    this. _title = mymap['title']  ;



  }








}