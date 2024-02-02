import 'package:flutter/material.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({
    super.key,
    required this.city,
    required this.info,
    required this.isCheckedIn,
    required this.onCheckInChanged,
  });
  final String city;
  final List<dynamic> info;
  final bool isCheckedIn;
  final Function(bool) onCheckInChanged;

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  bool isCheckedIn = false;
  @override
  void initState() {
    super.initState();
    isCheckedIn = widget.isCheckedIn;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.city,
        ),
      ),
      body: ListView.builder(
        itemBuilder: (_, index) {
          if (index == 0) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Switch(
                    value: isCheckedIn,
                    onChanged: (bool value) {
                      setState(() {
                        isCheckedIn = value;
                      });
                      widget.onCheckInChanged(
                        value,
                      );
                    },
                  ),
                  const Text(
                    '체크인',
                    style: TextStyle(
                      fontSize: 24,
                    ),
                  ),
                ],
              ),
            );
          }
          return ListTile(
            title: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.info[index - 1]["name"] ?? "",
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Tooltip(
                  triggerMode: TooltipTriggerMode.tap,
                  message: widget.info[index - 1]["cost"] ?? "",
                  child: const Icon(Icons.attach_money),
                ),
              ],
            ),
            subtitle: Text(
                "${widget.info[index - 1]["description"] ?? ""}\n 위치 : ${widget.info[index - 1]["address"] ?? ""}\n비용: ${widget.info[index - 1]["cost"] ?? ""}"),
            trailing: SizedBox(
              width: 100,
              height: 100,
              child: Image.asset(
                "assets/images/placeholder.jpeg",
                fit: BoxFit.cover,
              ),
            ),
          );
        },
        itemCount: widget.info.length + 1,
      ),
    );
  }
}
