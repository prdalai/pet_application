import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class CommunityImagesSection extends StatelessWidget {
  final List<String> netImagesList = [
    'https://cdn.pixabay.com/photo/2016/12/13/05/15/puppy-1903313_1280.jpg',
    'https://cdn.pixabay.com/photo/2016/11/22/23/13/dog-1851107_1280.jpg',
    'https://pixabay.com/photos/dog-pet-animal-domestic-dog-canine-7858450',
    'https://cdn.pixabay.com/photo/2019/08/19/07/45/corgi-4415649_1280.jpg',
    'https://cdn.pixabay.com/photo/2016/11/21/14/47/kitten-1845789_1280.jpg',
    'https://cdn.pixabay.com/photo/2016/11/23/18/06/dog-1854119_1280.jpg',
    'https://cdn.pixabay.com/photo/2016/11/22/23/13/dog-1851107_1280.jpg',
    'https://cdn.pixabay.com/photo/2020/11/24/17/54/dog-5773397_1280.jpg',
    'https://cdn.pixabay.com/photo/2019/09/21/18/58/dog-4494554_1280.jpg',
    'https://cdn.pixabay.com/photo/2020/08/12/09/42/dog-5482171_1280.jpg'

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
