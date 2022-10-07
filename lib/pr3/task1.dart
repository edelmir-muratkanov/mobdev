class Room {
  double height;
  double length;
  double width;

  Room(this.height, this.length, this.width);

  double volume() {
    return double.parse((height * length * width).toStringAsFixed(2));
  }
}

void main() {
  var room = Room(2.2, 3.4, 2);
  print('Volume: ${room.volume()}');
}