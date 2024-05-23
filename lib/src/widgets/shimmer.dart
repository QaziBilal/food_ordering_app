import 'package:flutter/material.dart';
import 'package:food_ordering_app/src/helper/sizedbox_extension.dart';

class NewsListShimmer extends StatefulWidget {
  int crossAxisCount;
  bool list;
  NewsListShimmer({this.crossAxisCount = 2, this.list = false, super.key});

  @override
  _NewsListShimmerState createState() => _NewsListShimmerState();
}

class _NewsListShimmerState extends State<NewsListShimmer>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double sw = MediaQuery.sizeOf(context).width;
    return widget.list == false
        ? gridviewShimmer(widget.crossAxisCount)
        : horizontalListShimmer(sw);
  }

  Widget listViewShimmer() {
    return ListTile(
      contentPadding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      leading: Container(
        width: 100.0,
        height: 100.0,
        color: Colors.grey[300],
        child: AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            return Opacity(
              opacity: 0.2 + (_controller.value * 0.6),
              child: Container(
                color: Colors.white,
              ),
            );
          },
        ),
      ),
      title: Container(
        height: 20.0,
        width: MediaQuery.of(context).size.width * 0.6,
        color: Colors.grey[300],
        child: AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            return Opacity(
              opacity: 0.2 + (_controller.value * 0.6),
              child: Container(
                color: Colors.white,
              ),
            );
          },
        ),
      ),
      subtitle: Container(
        height: 16.0,
        width: MediaQuery.of(context).size.width * 0.4,
        color: Colors.grey[300],
        child: AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            return Opacity(
              opacity: 0.2 + (_controller.value * 0.6),
              child: Container(
                color: Colors.white,
              ),
            );
          },
        ),
      ),
    );
  }

  Widget horizontalListShimmer(sw) {
    return SizedBox(
      height: sw * 0.3,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 4,
        padding: EdgeInsets.only(left: 10, right: 10),
        itemBuilder: (context, indx) {
          return Column(
            children: [
              Container(
                margin: EdgeInsets.only(left: 10, right: 10),
                width: sw * 0.1,
                height: sw * 0.1,
                decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(10)),
                child: AnimatedBuilder(
                  animation: _controller,
                  builder: (context, child) {
                    return Opacity(
                      opacity: 0.2 + (_controller.value * 0.6),
                      child: Container(
                        color: Colors.white,
                      ),
                    );
                  },
                ),
              ),
              20.height,
              Container(
                width: sw * 0.1,
                height: 15,
                decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(3)),
                child: AnimatedBuilder(
                  animation: _controller,
                  builder: (context, child) {
                    return Opacity(
                      opacity: 0.2 + (_controller.value * 0.6),
                      child: Container(
                        color: Colors.white,
                      ),
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget gridviewShimmer(int crossaxiscont) {
    return GridView.builder(
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        itemCount: 4,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio: crossaxiscont == 3 ? 0.6 : 0.9,
          crossAxisCount: crossaxiscont,
          crossAxisSpacing: crossaxiscont == 3 ? 10 : 20,
          mainAxisSpacing: crossaxiscont == 3 ? 10 : 20,
        ),
        padding: EdgeInsets.only(left: 20, right: 20),
        itemBuilder: (context, index) {
          return crossaxiscont == 2
              ? Container(
                  width: 100.0,
                  height: 100.0,
                  decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(20)),
                  child: AnimatedBuilder(
                    animation: _controller,
                    builder: (context, child) {
                      return Opacity(
                        opacity: 0.2 + (_controller.value * 0.6),
                        child: Container(
                          color: Colors.white,
                        ),
                      );
                    },
                  ),
                )
              : Column(
                  children: [
                    Container(
                      width: 100.0,
                      height: 100.0,
                      decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(20)),
                      child: AnimatedBuilder(
                        animation: _controller,
                        builder: (context, child) {
                          return Opacity(
                            opacity: 0.2 + (_controller.value * 0.6),
                            child: Container(
                              color: Colors.white,
                            ),
                          );
                        },
                      ),
                    ),
                    10.height,
                    Container(
                      width: 90,
                      height: 30,
                      decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(3)),
                      child: AnimatedBuilder(
                        animation: _controller,
                        builder: (context, child) {
                          return Opacity(
                            opacity: 0.2 + (_controller.value * 0.6),
                            child: Container(
                              color: Colors.white,
                            ),
                          );
                        },
                      ),
                    ),
                    5.height,
                    Container(
                      width: 70,
                      height: 30,
                      decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(3)),
                      child: AnimatedBuilder(
                        animation: _controller,
                        builder: (context, child) {
                          return Opacity(
                            opacity: 0.2 + (_controller.value * 0.6),
                            child: Container(
                              color: Colors.white,
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                );
        });
  }
}
