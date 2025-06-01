import 'package:flutter/material.dart';
import 'package:imat_app/model/imat/product.dart';

class ImatCategoryHandler extends ChangeNotifier {
  late ICategory currentCategories;

  bool favourites = false;
  void toggleFavorite() {
    favourites = !favourites;
  }

  MainCategories start = MainCategories("Kategorier");

  MainCategories frukt = MainCategories("Frukt");
  MainCategories drick = MainCategories("Drickor");
  MainCategories meat = MainCategories("Kött & Fisk");

  MainCategories skafferi = MainCategories("Skafferi");
  MainCategories kolhydrater = MainCategories("Kolhydrater");

  MainCategories bread = MainCategories("Bröd");

  MainCategories greens = MainCategories("Grönsaker");
  MainCategories root = MainCategories("Rotfrukter");

  SubCategories POD = SubCategories(ProductCategory.POD);
  SubCategories BRE = SubCategories(ProductCategory.BREAD);
  SubCategories BER = SubCategories(ProductCategory.BERRY);
  SubCategories CIT = SubCategories(ProductCategory.CITRUS_FRUIT);
  SubCategories HOT = SubCategories(ProductCategory.HOT_DRINKS);
  SubCategories COL = SubCategories(ProductCategory.COLD_DRINKS);
  SubCategories EXO = SubCategories(ProductCategory.EXOTIC_FRUIT);
  SubCategories FIS = SubCategories(ProductCategory.FISH);
  SubCategories VEG = SubCategories(ProductCategory.VEGETABLE_FRUIT);
  SubCategories CAB = SubCategories(ProductCategory.CABBAGE);
  SubCategories MEA = SubCategories(ProductCategory.MEAT);
  SubCategories DAI = SubCategories(ProductCategory.DAIRIES);
  SubCategories MEL = SubCategories(ProductCategory.MELONS);
  SubCategories FLO = SubCategories(ProductCategory.FLOUR_SUGAR_SALT);
  SubCategories NUT = SubCategories(ProductCategory.NUTS_AND_SEEDS);
  SubCategories PAS = SubCategories(ProductCategory.PASTA);
  SubCategories POT = SubCategories(ProductCategory.POTATO_RICE);
  SubCategories ROO = SubCategories(ProductCategory.ROOT_VEGETABLE);
  SubCategories FRU = SubCategories(ProductCategory.FRUIT);
  SubCategories SWE = SubCategories(ProductCategory.SWEET);
  SubCategories HER = SubCategories(ProductCategory.HERB);
  //SubCategories UND = SubCategories(ProductCategory.UNDEFINED);

  ImatCategoryHandler() {
    currentCategories = start;

    //Första kategorierna i hierarkin
    start.parent = start;
    start.start = true;
    start.addCategories([frukt, meat, skafferi, BRE, greens, drick]);

    BRE.name = "Bröd";

    // Ändrar titeln till kategorin.
    // Kategorierna i Frukt
    frukt.addCategories([CIT, EXO, MEL, FRU]);
    EXO.name = "Exotiska frukter";
    CIT.name = "Citrusfrukter";
    MEL.name = "Meloner";
    FRU.name = "Frukter";

    // osv :)
    meat.addCategories([MEA, FIS]);
    FIS.name = "Fisk";
    MEA.name = "Kött";

    skafferi.addCategories([kolhydrater, DAI, FLO, SWE, NUT]);
    kolhydrater.addCategories([PAS, POT]);
    DAI.name = "Mejeri";
    FLO.name = "Bakning";
    SWE.name = "Sött";
    NUT.name = "Nötter & Frön";
    PAS.name = "Pasta";
    POT.name = "Potatis & Ris";
    //bread.addCategories([bread]);
    greens.addCategories([root, BER, CAB, POD, HER]);
    root.addCategories([VEG, ROO]);
    BER.name = "Bär";
    CAB.name = "Kål";
    POD.name = "Baljväxter";
    HER.name = "Örter";
    VEG.name = "Grönsaksfrukter";
    ROO.name = "Rotfrukter";

    drick.addCategories([HOT, COL]);
    HOT.name = "Varm dricka";
    COL.name = "Kall dricka";
  }
  void changeCategory(ICategory cat) {
    currentCategories = cat;

    notifyListeners();
  }
}

abstract interface class ICategory {
  List<ICategory> getCategories();
  List<ProductCategory> getProductCategories();
  void setParent(ICategory parent);
  ICategory getParent();
  String getName();
  bool getStart();
  String getImageName();
  List<ICategory> getParents();
}

class MainCategories extends ICategory {
  bool start = false;
  String name;
  late ICategory parent;
  List<ICategory> categories = [];

  ProductCategory? productCategory;

  MainCategories(this.name);

  void addCategory(ICategory category) {
    category.setParent(this);
    categories.add(category);
  }

  void addCategories(List<ICategory> category) {
    for (ICategory cat in category) {
      cat.setParent(this);
      categories.add(cat);
    }
  }

  @override
  List<ICategory> getCategories() {
    return categories;
  }

  @override
  void setParent(ICategory parent) {
    this.parent = parent;
  }

  @override
  ICategory getParent() {
    return parent;
  }

  @override
  String getName() {
    return name;
  }

  @override
  List<ProductCategory> getProductCategories() {
    List<ProductCategory> cats = [];
    for (ICategory cat in categories) {
      cats += cat.getProductCategories();
    }
    if (productCategory != null) {
      cats.add(productCategory!);
    }
    return cats;
  }

  @override
  bool getStart() {
    return start;
  }

  @override
  String getImageName() {
    throw UnimplementedError();
  }

  @override
  List<ICategory> getParents() {
    if (start) {
      return [];
    }
    return parent.getParents() + [parent];
  }
}

class SubCategories extends ICategory {
  bool start = false;
  late String name;
  late ICategory parent;
  List<ICategory> categories = [];

  ProductCategory productCategory;

  SubCategories(this.productCategory) {
    name = productCategory.name;
  }

  void addCategory(ICategory category) {
    category.setParent(this);
    categories.add(category);
  }

  @override
  List<ICategory> getCategories() {
    return categories;
  }

  @override
  void setParent(ICategory parent) {
    this.parent = parent;
  }

  @override
  ICategory getParent() {
    return parent;
  }

  @override
  String getName() {
    return name;
  }

  @override
  List<ProductCategory> getProductCategories() {
    List<ProductCategory> cats = [];
    for (ICategory cat in categories) {
      cats += cat.getProductCategories();
    }
    cats.add(productCategory);
    return cats;
  }

  @override
  bool getStart() {
    return start;
  }

  @override
  String getImageName() {
    return "";
  }

  @override
  List<ICategory> getParents() {
    if (start) {
      return [];
    }
    return parent.getParents() + [parent];
  }
}
