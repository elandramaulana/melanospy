import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class ListCard extends StatefulWidget {
  final VoidCallback onPressed;
  final String image;
  final String title;
  final String subtitle;
  final String tanggal;

  const ListCard({
    super.key,
    required this.onPressed,
    required this.image,
    required this.title,
    required this.subtitle,
    required this.tanggal,
  });

  @override
  _ListCardState createState() => _ListCardState();
}

class _ListCardState extends State<ListCard> {
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
              10.0), // Sesuaikan dengan radius yang Anda inginkan
        ),
        color: HexColor('2476AE'),
        child: SizedBox(
          height: 115.0,
          child: ListTile(
            onTap: widget.onPressed,
            title: Container(
              margin: const EdgeInsets.only(left: 130),
              child: Text(
                widget.title,
                style: const TextStyle(color: Colors.white),
              ),
            ),
            subtitle: Container(
                margin: const EdgeInsets.only(left: 130),
                child: Text(widget.subtitle,
                    style: const TextStyle(color: Colors.white, fontSize: 12))),
          ),
        ),
      ),
      Container(
        padding: EdgeInsets.fromLTRB(10, 11, 0, 0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10.0),
          child: Image.network(
            widget.image,
            width: 130,
            height: 100,
            repeat: ImageRepeat.noRepeat,
          ),
        ),
      ),
      Container(
        margin: const EdgeInsets.fromLTRB(145, 70, 0, 0),
        child: ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white.withOpacity(0.4)),
            onPressed: () {},
            icon: const Icon(
              Icons.calendar_today,
              size: 20,
            ),
            label: Text(widget.tanggal, style: const TextStyle(fontSize: 9))),
      ),
     
    ]);
  }
}
