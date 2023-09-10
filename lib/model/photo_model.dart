import 'package:flutter/material.dart';
import 'package:wedding_pitch/style/color.dart';

enum ImageSortType {
  full,
  left,
  right,
}

class PhotoModel {
  final double imageRate;
  final Color albumColor;
  final String imagePath;
  final ImageSortType imageSortType;

  const PhotoModel({
    required this.imageRate,
    required this.albumColor,
    required this.imagePath,
    required this.imageSortType,
  });
}

const imageRateTypeFull = 1.0;
const imageRateMostOver = 0.91;
const imageRateTypeHalfOver = 0.76;
const imageRateTypeQuarterOver = 0.55;

const List<PhotoModel> photoModels = [
  PhotoModel(
    imageRate: imageRateTypeFull,
    albumColor: WeddingColor.albumStudioColor,
    imagePath: "assets/images/albums/studio_title.png",
    imageSortType: ImageSortType.full,
  ),
  PhotoModel(
    imageRate: imageRateTypeFull,
    albumColor: WeddingColor.albumStudioColor,
    imagePath: "assets/images/albums/studio01.jpg",
    imageSortType: ImageSortType.full,
  ),
  PhotoModel(
    imageRate: imageRateTypeHalfOver,
    albumColor: WeddingColor.albumStudioColor,
    imagePath: "assets/images/albums/studio02.jpg",
    imageSortType: ImageSortType.left,
  ),
  PhotoModel(
    imageRate: imageRateTypeHalfOver,
    albumColor: WeddingColor.albumStudioColor,
    imagePath: "assets/images/albums/studio03.jpg",
    imageSortType: ImageSortType.right,
  ),
  PhotoModel(
    imageRate: imageRateTypeFull,
    albumColor: WeddingColor.albumStudioColor,
    imagePath: "assets/images/albums/studio04.jpg",
    imageSortType: ImageSortType.full,
  ),
  PhotoModel(
    imageRate: imageRateTypeQuarterOver,
    albumColor: WeddingColor.albumStudioColor,
    imagePath: "assets/images/albums/studio05.jpg",
    imageSortType: ImageSortType.right,
  ),
  PhotoModel(
    imageRate: imageRateTypeHalfOver,
    albumColor: WeddingColor.albumStudioColor,
    imagePath: "assets/images/albums/studio06.jpg",
    imageSortType: ImageSortType.left,
  ),
  PhotoModel(
    imageRate: imageRateTypeHalfOver,
    albumColor: WeddingColor.albumStudioColor,
    imagePath: "assets/images/albums/studio07.jpg",
    imageSortType: ImageSortType.right,
  ),
  PhotoModel(
    imageRate: imageRateTypeQuarterOver,
    albumColor: WeddingColor.albumStudioColor,
    imagePath: "assets/images/albums/studio08.jpg",
    imageSortType: ImageSortType.right,
  ),
  PhotoModel(
    imageRate: imageRateMostOver,
    albumColor: WeddingColor.albumStudioColor,
    imagePath: "assets/images/albums/studio09.jpg",
    imageSortType: ImageSortType.left,
  ),
  PhotoModel(
    imageRate: imageRateMostOver,
    albumColor: WeddingColor.albumStudioColor,
    imagePath: "assets/images/albums/studio10.jpg",
    imageSortType: ImageSortType.right,
  ),
  PhotoModel(
    imageRate: imageRateMostOver,
    albumColor: WeddingColor.albumStudioColor,
    imagePath: "assets/images/albums/studio11.jpg",
    imageSortType: ImageSortType.left,
  ),
  PhotoModel(
    imageRate: imageRateTypeFull,
    albumColor: WeddingColor.albumForestColor,
    imagePath: "assets/images/albums/forest_title.png",
    imageSortType: ImageSortType.full,
  ),
  PhotoModel(
    imageRate: imageRateTypeFull,
    albumColor: WeddingColor.albumForestColor,
    imagePath: "assets/images/albums/forest01.jpg",
    imageSortType: ImageSortType.full,
  ),
  PhotoModel(
    imageRate: imageRateTypeHalfOver,
    albumColor: WeddingColor.albumForestColor,
    imagePath: "assets/images/albums/forest02.jpg",
    imageSortType: ImageSortType.right,
  ),
  PhotoModel(
    imageRate: imageRateTypeHalfOver,
    albumColor: WeddingColor.albumForestColor,
    imagePath: "assets/images/albums/forest03.jpg",
    imageSortType: ImageSortType.left,
  ),
  PhotoModel(
    imageRate: imageRateTypeHalfOver,
    albumColor: WeddingColor.albumForestColor,
    imagePath: "assets/images/albums/forest04.jpg",
    imageSortType: ImageSortType.right,
  ),
  PhotoModel(
    imageRate: imageRateTypeHalfOver,
    albumColor: WeddingColor.albumForestColor,
    imagePath: "assets/images/albums/forest05.jpg",
    imageSortType: ImageSortType.left,
  ),
  PhotoModel(
    imageRate: imageRateTypeFull,
    albumColor: WeddingColor.albumForestColor,
    imagePath: "assets/images/albums/forest06.jpg",
    imageSortType: ImageSortType.full,
  ),
  PhotoModel(
    imageRate: imageRateTypeFull,
    albumColor: WeddingColor.albumSeaColor,
    imagePath: "assets/images/albums/sea_title.png",
    imageSortType: ImageSortType.full,
  ),
  PhotoModel(
    imageRate: imageRateTypeFull,
    albumColor: WeddingColor.albumSeaColor,
    imagePath: "assets/images/albums/sea01.jpg",
    imageSortType: ImageSortType.full,
  ),
  PhotoModel(
    imageRate: imageRateTypeHalfOver,
    albumColor: WeddingColor.albumSeaColor,
    imagePath: "assets/images/albums/sea02.jpg",
    imageSortType: ImageSortType.left,
  ),
  PhotoModel(
    imageRate: imageRateTypeFull,
    albumColor: WeddingColor.albumSeaColor,
    imagePath: "assets/images/albums/sea03.jpg",
    imageSortType: ImageSortType.full,
  ),
  PhotoModel(
    imageRate: imageRateMostOver,
    albumColor: WeddingColor.albumSeaColor,
    imagePath: "assets/images/albums/sea04.jpg",
    imageSortType: ImageSortType.right,
  ),
  PhotoModel(
    imageRate: imageRateMostOver,
    albumColor: WeddingColor.albumSeaColor,
    imagePath: "assets/images/albums/sea05.jpg",
    imageSortType: ImageSortType.left,
  ),
  PhotoModel(
    imageRate: imageRateTypeFull,
    albumColor: WeddingColor.albumSeaColor,
    imagePath: "assets/images/albums/sea06.jpg",
    imageSortType: ImageSortType.full,
  ),
  PhotoModel(
    imageRate: imageRateTypeHalfOver,
    albumColor: WeddingColor.albumSeaColor,
    imagePath: "assets/images/albums/sea07.jpg",
    imageSortType: ImageSortType.full,
  ),
  PhotoModel(
    imageRate: imageRateTypeFull,
    albumColor: WeddingColor.albumSeaColor,
    imagePath: "assets/images/albums/sea08.jpg",
    imageSortType: ImageSortType.full,
  ),
  PhotoModel(
    imageRate: imageRateMostOver,
    albumColor: WeddingColor.albumSeaColor,
    imagePath: "assets/images/albums/sea09.jpg",
    imageSortType: ImageSortType.right,
  ),
  PhotoModel(
    imageRate: imageRateTypeHalfOver,
    albumColor: WeddingColor.albumSeaColor,
    imagePath: "assets/images/albums/sea10.jpg",
    imageSortType: ImageSortType.right,
  ),
  PhotoModel(
    imageRate: imageRateTypeFull,
    albumColor: WeddingColor.albumSeaColor,
    imagePath: "assets/images/albums/sea11.jpg",
    imageSortType: ImageSortType.full,
  ),
  PhotoModel(
    imageRate: imageRateTypeHalfOver,
    albumColor: WeddingColor.albumSeaColor,
    imagePath: "assets/images/albums/sea12.jpg",
    imageSortType: ImageSortType.right,
  ),
  PhotoModel(
    imageRate: imageRateTypeFull,
    albumColor: WeddingColor.albumSeaColor,
    imagePath: "assets/images/albums/sea13.jpg",
    imageSortType: ImageSortType.full,
  ),
  PhotoModel(
    imageRate: imageRateMostOver,
    albumColor: WeddingColor.albumSeaColor,
    imagePath: "assets/images/albums/sea14.jpg",
    imageSortType: ImageSortType.left,
  ),
  PhotoModel(
    imageRate: imageRateTypeQuarterOver,
    albumColor: WeddingColor.albumSeaColor,
    imagePath: "assets/images/albums/sea15.jpg",
    imageSortType: ImageSortType.left,
  ),
  PhotoModel(
    imageRate: imageRateTypeHalfOver,
    albumColor: WeddingColor.albumSeaColor,
    imagePath: "assets/images/albums/sea16.jpg",
    imageSortType: ImageSortType.right,
  ),
  PhotoModel(
    imageRate: imageRateTypeFull,
    albumColor: WeddingColor.albumSeaColor,
    imagePath: "assets/images/albums/sea17.jpg",
    imageSortType: ImageSortType.full,
  ),
];
