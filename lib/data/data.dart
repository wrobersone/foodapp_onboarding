class SliderModel {
  String imagePath;
  String title;
  String desc;

  SliderModel({this.imagePath, this.title, this.desc});

  void setImageAssetPath(String getImagePath) {
    imagePath = getImagePath;
  }

  void setTitle(String getTitle) {
    title = getTitle;
  }

  void setDesc(String getDesc) {
    desc = getDesc;
  }

  String getImageAssetPath() {
    return imagePath;
  }

  String getTitle() {
    return title;
  }

  String getDesc() {
    return desc;
  }
}

List<SliderModel> getSlides() {
  List<SliderModel> slides = new List<SliderModel>();
  SliderModel sliderModel = new SliderModel();

  //1
  sliderModel.setImageAssetPath("assets/pic1.jpeg");
  sliderModel.setTitle("Search");
  sliderModel.setDesc("Discover restaurants offer the best food near you.");
  slides.add(sliderModel);

  sliderModel = new SliderModel();

  //2
  sliderModel.setImageAssetPath("assets/pic2.jpeg");
  sliderModel.setTitle("Order");
  sliderModel.setDesc("Discover restaurants offer the best food near you.");
  slides.add(sliderModel);

  sliderModel = new SliderModel();

  //3
  sliderModel.setImageAssetPath("assets/pic3.jpeg");
  sliderModel.setTitle("Eat");
  sliderModel.setDesc("Discover restaurants offer the best food near you.");
  slides.add(sliderModel);

  sliderModel = new SliderModel();

  return slides;
}
