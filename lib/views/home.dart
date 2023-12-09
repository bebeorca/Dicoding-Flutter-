import 'package:flutter/material.dart';
import 'package:proyek_akhir_dicoding/main.dart';
import 'package:proyek_akhir_dicoding/model/contributorModel.dart';
import 'package:proyek_akhir_dicoding/views/detailCategory.dart';
import 'package:skeletonizer/skeletonizer.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: setColor,
        title: const Text(
          'GiGalaxy: Freelancer Centre',
          style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
        ),
      ),
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          if (constraints.maxWidth <= 600) {
            return const Home();
          } else if (constraints.maxWidth <= 1200) {
            return const HomeWithGrid(
              gridCount: 4,
            );
          } else {
            return const HomeWithGrid(
              gridCount: 5,
            );
          }
        },
      ),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
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
    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        _loading = false;
      });
    });

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 20),
            Expanded(
              child: Skeletonizer(
                enabled: _loading,
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    final ContributorModel contributorModels =
                        contributorModelList[index];

                    return InkWell(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return DetailCategory(
                              contributorsModels: contributorModels);
                        }));
                      },
                      child: Card(
                        // color: const Color.fromARGB(255, 240, 240, 240),
                        margin: const EdgeInsets.all(12),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Row(
                            children: [
                              Expanded(
                                  flex: 1,
                                  child: Image.network(
                                    contributorModels.thumbnail,
                                    fit: BoxFit.cover,
                                  )),
                              Expanded(
                                flex: 2,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(
                                        contributorModels.jobDeskCategory,
                                        style: const TextStyle(
                                            fontSize: 15.0,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                          "${contributorModels.numberOfTalent} Contributors")
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                  itemCount: contributorModelList.length,
                ),
              ),
            ),
            const SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}

class HomeWithGrid extends StatefulWidget {
  final int gridCount;
  const HomeWithGrid({super.key, required this.gridCount});

  @override
  State<HomeWithGrid> createState() => _HomeWithGridState();
}

class _HomeWithGridState extends State<HomeWithGrid> {
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
    
    return Skeletonizer(
      effect: const ShimmerEffect(),
      enabled: _loading,
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: GridView.count(
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          crossAxisCount: widget.gridCount,
          children: contributorModelList.map((contributor) {
            return InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return DetailCategory(
                    contributorsModels: contributor,
                  );
                }));
              },
              child: Card(
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Expanded(
                      child: Align(
                        alignment: Alignment.center,
                        child: Image.network(
                          contributor.thumbnail,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    const Divider(
                        height: 2,
                        color: Color.fromARGB(255, 209, 209, 209),
                        thickness: 2.2),
                    Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: Text(
                        contributor.jobDeskCategory,
                        style: const TextStyle(
                            fontSize: 16.0, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0, bottom: 8.0),
                      child: Text("${contributor.numberOfTalent} talents"),
                    )
                  ],
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
