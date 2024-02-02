import 'package:flutter/material.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({
    super.key,
    required this.city,
    required this.info,
  });
  final String city;
  final List<dynamic> info;

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.city,
        ),
      ),
      body: ListView.builder(
        itemBuilder: (_, index) => ListTile(
          title: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.info[index]["name"] ?? "",
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Tooltip(
                triggerMode: TooltipTriggerMode.tap,
                message: widget.info[index]["cost"] ?? "",
                child: const Icon(Icons.attach_money),
              ),
            ],
          ),
          subtitle: Text(
              "${widget.info[index]["description"] ?? ""}\n 위치 : ${widget.info[index]["address"] ?? ""}\n비용: ${widget.info[index]["cost"] ?? ""}"),
          trailing: SizedBox(
            width: 100,
            height: 100,
            child: Image.asset(
              "assets/images/placeholder.jpeg",
              fit: BoxFit.cover,
            ),
          ),
        ),
        itemCount: widget.info.length,
      ),
    );
  }
}
