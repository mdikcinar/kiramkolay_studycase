import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';

import '../model/item.dart';

part 'home_viewmodel.g.dart';

class HomeViewModel = _HomeViewModelBase with _$HomeViewModel;

abstract class _HomeViewModelBase with Store {
  late BuildContext context;

  List<Item> itemList = [
    Item(
      img:
          'https://images.unsplash.com/photo-1584622781564-1d987f7333c1?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8aG9tZSUyMGludGVyaW9yfGVufDB8fDB8fA%3D%3D&w=1000&q=80',
      address: 'Bostanlı Mah. Karşıyaka, İzmir',
      description: 'Site İçinde Dubleks Daire',
      price: '15.000 TL',
      firstPrice: '30.000 TL',
      areaM2: '280',
      areaType: '3+1 | 2 Banyo',
    ),
    Item(
      img:
          'https://media.istockphoto.com/photos/beautiful-living-room-interior-with-hardwood-floors-and-and-view-of-picture-id1208205959?k=20&m=1208205959&s=612x612&w=0&h=bd4L_M7u2hPksL11njclcxgMWezFgSnKW1gBs9K-Xn0=',
      address: 'Bostanlı Mah. Karşıyaka, İzmir',
      description: 'Site İçinde Dubleks Daire',
      price: '5.000 TL',
      firstPrice: '15.000 TL',
      areaM2: '150',
      areaType: '2+1 | 1 Banyo',
    ),
    Item(
      img: 'https://s30965.pcdn.co/blogs/the-study/wp-content/uploads/190403_TLenz_BATorrey_HomeNY9069-scaled.jpg',
      address: 'Bostanlı Mah. Karşıyaka, İzmir',
      description: 'Site İçinde Dubleks Daire',
      price: '500 TL',
      firstPrice: '3.000 TL',
      areaM2: '80',
      areaType: '1+1 | 1 Banyo',
    ),
  ];
}
