import 'package:flutter/material.dart';
import 'package:travel_korea_app/components/list_item.dart';

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
              child: Column(
                children: [
                  const Text(
                    '현재 체크인한 사람 0명',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  Row(
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
                ],
              ),
            );
          }
          return ListItem(data: widget.info[index - 1]);
        },
        itemCount: widget.info.length + 1,
      ),
    );
  }
}
