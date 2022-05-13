
// This class is very redundant, but it can allow us to add icons or stuff later as needed
class Emotion{
  String name;
  // Easy enough to not need named parameters imo
  Emotion(this.name);

  @override
  String toString() {
    return name;
  }
}