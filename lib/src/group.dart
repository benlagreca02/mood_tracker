


// The only purpose for this class is maknig the UI cleaner
// internally in a log entry, the group doesn't matter
class Group<T>{

  final String name;
  // final something color;?
  // doesn't really need to be generic but ill keep it like this
  // in case I need it in the future

  // might make this private in the future, but it looks too slick to change imo
  final Set<T> members;

  Group({required this.name, required this.members});

}