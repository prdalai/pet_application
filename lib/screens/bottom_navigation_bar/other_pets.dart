import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class CommunityImagesSection extends StatelessWidget {
  final List<String> netImagesList = [
    'https://cdn.pixabay.com/photo/2016/12/13/05/15/puppy-1903313_1280.jpg',
    'https://cdn.pixabay.com/photo/2016/11/22/23/13/dog-1851107_1280.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Community Images'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: MasonryGridView.count(
        crossAxisCount: 2,
        mainAxisSpacing: 4,
        crossAxisSpacing: 4,
        itemCount: netImagesList.length,
        itemBuilder: (context, index) {
          return Container(
            decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.all(Radius.circular(15)),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(15)),
              child: Image(
                image: NetworkImage(netImagesList[index]),
                fit: BoxFit.cover,
              ),
            ),
          );
        },
      ),
    );
  }
}
