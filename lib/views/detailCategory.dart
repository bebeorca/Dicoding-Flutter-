import 'package:flutter/material.dart';
import 'package:proyek_akhir_dicoding/main.dart';
import 'package:proyek_akhir_dicoding/model/contributorList.dart';
import 'package:proyek_akhir_dicoding/model/contributorModel.dart';
import 'package:proyek_akhir_dicoding/views/contributorDetail.dart';
import 'package:skeletonizer/skeletonizer.dart';

class DetailCategory extends StatelessWidget {
  final ContributorModel contributorsModels;
  const DetailCategory({super.key, required this.contributorsModels});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        if (constraints.maxWidth <= 600) {
          return MobilePageView(
            contributorsModel: contributorsModels,
          );
        } else if (constraints.maxWidth <= 1200) {
          return GridPageView(
            gridCount: 4,
            contributorsModel: contributorsModels,
          );
        } else {
          return GridPageView(
            gridCount: 5,
            contributorsModel: contributorsModels,
          );
        }
      },
    );
  }
}

class MobilePageView extends StatefulWidget {
  final ContributorModel contributorsModel;
  const MobilePageView({super.key, required this.contributorsModel});

  @override
  State<MobilePageView> createState() => _MobilePageViewState();
}

class _MobilePageViewState extends State<MobilePageView> {
  bool _loading = true;

  @override
  void initState() {
    super.initState;
    _startLoading();
  }

  void _startLoading() {
    Future.delayed(const Duration(microseconds: 1500), () {
      if (mounted) {
        setState(() {
          _loading = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    List<ContributorList> contributors = [];

    contributors.addAll(contributorsList
        .where((element) => widget.contributorsModel.slug == element.slug));

    return Scaffold(
      appBar: AppBar(
        backgroundColor: setColor,
        title: Text(
          "GiGalaxy: ${widget.contributorsModel.jobDeskCategory}",
          style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
        ),
      ),
      body: contributors.isNotEmpty
          ? MobileUserAvailable(
              contributors: contributors,
              contributorsModel: widget.contributorsModel,
              enable: _loading)
          : const Center(
              child: Text(
                "No talent available.",
                style: TextStyle(fontSize: 24),
              ),
            ),
    );
  }
}

class GridPageView extends StatefulWidget {
  final ContributorModel contributorsModel;
  final int gridCount;
  const GridPageView(
      {super.key, required this.contributorsModel, required this.gridCount});

  @override
  State<GridPageView> createState() => _GridPageViewState();
}

class _GridPageViewState extends State<GridPageView> {
  bool _loading = true;
  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(milliseconds: 1500), () {
      setState(() {
        _loading = false;
      });
    });

    List<ContributorList> contributors = [];

    contributors.addAll(contributorsList
        .where((element) => widget.contributorsModel.slug == element.slug));

    return Scaffold(
      appBar: AppBar(
        backgroundColor: setColor,
        title: Text(
          "GiGalaxy: ${widget.contributorsModel.jobDeskCategory}",
          style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 24),
        ),
      ),
      body: contributors.isNotEmpty
          ? GridUserAvailable(
              contributorsModel: widget.contributorsModel,
              gridCount: widget.gridCount,
              contributors: contributors,
              enable: _loading)
          : const Center(
              child: Text(
                "No talent available.",
                style: TextStyle(fontSize: 24),
              ),
            ),
    );
  }
}

class MobileUserAvailable extends StatelessWidget {
  final ContributorModel contributorsModel;
  final List<ContributorList> contributors;
  final bool enable;
  const MobileUserAvailable(
      {super.key,
      required this.contributors,
      required this.contributorsModel,
      required this.enable});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          const SizedBox(height: 20),
          Expanded(
            child: Skeletonizer(
              enabled: enable,
              child: ListView.builder(
                itemBuilder: (context, index) {
                  final ContributorList contributor = contributors[index];

                  return InkWell(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return ContributorDetail(contributor: contributor);
                      }));
                    },
                    child: Card(
                      // color: const Color.fromARGB(255, 240, 240, 240),
                      margin: const EdgeInsets.all(12),
                      child: Row(
                        children: [
                          Expanded(
                              flex: 1,
                              child: ClipRRect(
                                borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(8),
                                    bottomLeft: Radius.circular(8)),
                                child: Image.network(
                                  contributor.profilePicture,
                                  fit: BoxFit.cover,
                                ),
                              )),
                          Expanded(
                            flex: 2,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    contributor.name,
                                    style: const TextStyle(
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  LayoutBuilder(
                                    builder: (context, constraints) {
                                      double iconSize =
                                          constraints.maxWidth <= 80
                                              ? 0.0
                                              : 12.0;
                                      double w = constraints.maxWidth <= 80
                                          ? 0.0
                                          : 5.0;

                                      return Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Icon(
                                            Icons.star,
                                            size: iconSize,
                                            color: setColor,
                                          ),
                                          SizedBox(
                                              width:
                                                  w), // Add some space between icon and text
                                          Expanded(
                                            child: Text(
                                              '${contributor.rating}/5',
                                            ),
                                          ),
                                        ],
                                      );
                                    },
                                  ),
                                  Text(
                                      "${contributor.projects} projects are completed.")
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
                itemCount: contributors.length,
              ),
            ),
          ),
          const SizedBox(height: 50),
        ],
      ),
    );
  }
}

class GridUserAvailable extends StatelessWidget {
  final ContributorModel contributorsModel;
  final List<ContributorList> contributors;
  final int gridCount;
  final bool enable;

  const GridUserAvailable(
      {super.key,
      required this.contributorsModel,
      required this.gridCount,
      required this.contributors,
      required this.enable});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: GridView.count(
        shrinkWrap: true,
        crossAxisCount: gridCount,
        children: List.generate(contributors.length, (index) {
          ContributorList contributor = contributors[index];
          return InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return ContributorDetail(contributor: contributor);
              }));
            },
            child: Skeletonizer(
              enabled: enable,
              effect: const ShimmerEffect(),
              child: Card(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Expanded(
                      child: Align(
                        alignment: Alignment.center,
                        child: Image.network(contributor.profilePicture,
                            fit: BoxFit.cover, width: double.infinity),
                      ),
                    ),
                    const Divider(
                        height: 2,
                        color: Color.fromARGB(255, 209, 209, 209),
                        thickness: 2.2),
                    Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: Text(
                        contributor.name,
                        style: const TextStyle(
                            fontSize: 16.0, fontWeight: FontWeight.bold),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Padding(
                        padding: const EdgeInsets.only(left: 8),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.star,
                              color: setColor,
                              size: 18,
                            ),
                            const SizedBox(
                              width: 2,
                            ),
                            Text(
                              "${contributor.rating}/5",
                              overflow: TextOverflow.ellipsis,
                            )
                          ],
                        )),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0, bottom: 8.0),
                      child: Text(
                        "${contributor.projects} projects are completed",
                        overflow: TextOverflow.ellipsis,
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
