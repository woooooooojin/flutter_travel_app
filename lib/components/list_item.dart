import 'package:flutter/material.dart';

class ListItem extends StatelessWidget {
  const ListItem({
    super.key,
    required this.data,
  });

  final dynamic data;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            data["name"] ?? "",
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          Tooltip(
            triggerMode: TooltipTriggerMode.tap,
            message: data["cost"] ?? "",
            child: const Icon(Icons.attach_money),
          ),
        ],
      ),
      subtitle: Text(
          "${data["description"] ?? ""}\n 위치 : ${data["address"] ?? ""}\n비용: ${data["cost"] ?? ""}"),
      trailing: SizedBox(
        width: 100,
        height: 100,
        child: Image.asset(
          "assets/images/placeholder.jpeg",
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
