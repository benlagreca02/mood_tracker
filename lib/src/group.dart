



class Group<T>{

  final String name;
  // final something color;?
  // doesn't really need to be generic but ill keep it like this
  // in case I need it in the future
  final Set<T> members;

  Group({required this.name, required this.members});

}