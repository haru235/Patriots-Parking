import 'package:flutter/material.dart';

// A screen that pops up from the bottom
Future tapDismissibleModalSheet({
  required BuildContext context,
  String? title,
  required List<Widget> children,
}) {
  return showModalBottomSheet(
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(16),
      ),
    ),
    context: context,
    builder: (context) {
      return GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () => Navigator.of(context).pop(),
        child: GestureDetector(
          onTap: () {},
          child: DraggableScrollableSheet(
            maxChildSize: 0.6,
            initialChildSize: 0.5,
            minChildSize: 0.4,
            builder: (context, scrollController) => Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(16),
                ),
              ),
              child: Column(
                children: [
                  title != null
                      ? Center(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              title,
                              style: const TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        )
                      : Container(),
                  Flexible(
                    child: ListView(
                      controller: scrollController,
                      children: children,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    },
  );
}
