import 'package:checkify/model/item_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:web_scraper/web_scraper.dart';

class ItemsList extends ChangeNotifier {
  static List<ItemModel> itemModel = [];

  void addItem(ItemModel item) {
    //itemModel.isAvailable = false;
    itemModel.add(item);
    notifyListeners();
  }

  List<ItemModel> get items => itemModel;

  void fetchData(int index) async {
    final webScraper = WebScraper(items[index].url1);
    if (await webScraper.loadWebPage(items[index].url2)) {
      ///GameStop
      if (items[index].url1 == "https://www.gamestop.de") {
        print("GameStop");
        List<Map<String, dynamic>> elements = webScraper.getElement(
            'div.mainBody > div.mainContainer > div > div > div.prodDet > div.mainInfo > div.addCartBar >'
            ' div.prodRightBlock > div.buySection > div.bigBuyButtons > table > tbody > tr > td > a.megaButton.cartAddRadio ',
            ['style']);
        if (elements[0]['attributes'].toString() == '{style: display:none;}') {
          itemModel[index].isAvailable = false;
          itemModel[index].title = "GameStop PS5, Not Available!";
          notifyListeners();
        } else {
          itemModel[index].isAvailable = true;
          itemModel[index].title = "GameStop PS5, Available!";
          notifyListeners();
        }

        /// MediaMarkt
      } else if (items[index].url1 == "https://www.mediamarkt.de") {
        print("MediaMarkt");
        List<Map<String, dynamic>> elements = webScraper.getElement(
            'div.indexstyled__StyledAppWrapper-sc-1hu9cx8-0.klAfyt > div.ProductDetailPagestyled__StyledPdpWrapper-sc-5s3nfq-1.hjoxyt > div.Grid__StyledGrid-fs0zc2-0.cQIsoQ.ProductDetailPagestyled__StyledPdpGrid-sc-5s3nfq-2.eJUJGv >'
            'div.Row__StyledRow-x4c83j-0.eaomqX.ProductDetailPagestyled__StyledPdpRow-sc-5s3nfq-0.bxwHHr > '
            'div.Cellstyled__StyledCell-sc-1wk5bje-0.ibdyBk.ProductDetailPagestyled__StyledPdpDetailCell-sc-5s3nfq-4.gLozy > '
            'div.Cardstyled__StyledCardWrapper-sc-1b4w28x-6.bwRnrw > '
            'div.Cardstyled__StyledCard-sc-1b4w28x-1.hSFggG > '
            'div.Row__StyledRow-x4c83j-0.cDKCes > '
            'div.Cellstyled__StyledCell-sc-1wk5bje-0.eJonzE > '
            'span.Typostyled__StyledInfoTypo-sc-1jga2g7-0.gYdSqK',
            ['title']);
        //print(elements[0]['title']);
        try {
          if (elements[0]['title'] ==
              'Dieser Artikel ist aktuell nicht verfügbar.') {
            itemModel[index].isAvailable = false;
            itemModel[index].title = "MediaMarkt PS5, Not Available!";
            notifyListeners();
          }
        } catch (e) {
          itemModel[index].isAvailable = true;
          itemModel[index].title = "MediaMarkt PS5, Available!";
          notifyListeners();
        }
      }

      ///Saturn
      else if (items[index].url1 == "https://www.saturn.de") {
        print("Saturn");
        List<Map<String, dynamic>> elements = webScraper.getElement(
            'div.indexstyled__StyledAppWrapper-sc-1hu9cx8-0.cPLDhA > '
            'div.ProductDetailPagestyled__StyledPdpWrapper-sc-5s3nfq-1.hjoxyt >'
            'div.Grid__StyledGrid-fs0zc2-0.cQIsoQ.ProductDetailPagestyled__StyledPdpGrid-sc-5s3nfq-2.eJUJGv > '
            'div.Row__StyledRow-x4c83j-0.eaomqX.ProductDetailPagestyled__StyledPdpRow-sc-5s3nfq-0.bxwHHr > '
            'div.Cellstyled__StyledCell-sc-1wk5bje-0.ibdyBk.ProductDetailPagestyled__StyledPdpDetailCell-sc-5s3nfq-4.gLozy > '
            'div.Cardstyled__StyledCardWrapper-sc-1b4w28x-6.bwRnrw > '
            'div.Cardstyled__StyledCard-sc-1b4w28x-1.cWuSJZ > '
            'div.Row__StyledRow-x4c83j-0.cDKCes > '
            'div.Cellstyled__StyledCell-sc-1wk5bje-0.eJonzE > '
            'span.Typostyled__StyledInfoTypo-sc-1jga2g7-0.gYdSqK',
            ['items']);
        print(elements[0]['title']);
        try {
          if (elements[0]['title'] ==
              'Dieser Artikel ist aktuell nicht verfügbar.') {
            itemModel[index].isAvailable = false;
            itemModel[index].title = "Saturn PS5, Not Available!";
            notifyListeners();
          }
        } catch (e) {
          itemModel[index].isAvailable = true;
          itemModel[index].title = "Saturn PS5, Available!";
          notifyListeners();
        }
      }
    }
  }

  Future<List<ItemModel>> fetchAllData(int i) async {
    final webScraper = WebScraper(items[i].url1);
    if (await webScraper.loadWebPage(items[i].url2)) {
      ///GameStop
      if (items[i].url1 == "https://www.gamestop.de") {
        print("GameStop");
        List<Map<String, dynamic>> elements = webScraper.getElement(
            'div.mainBody > div.mainContainer > div > div > div.prodDet > div.mainInfo > div.addCartBar >'
            ' div.prodRightBlock > div.buySection > div.bigBuyButtons > table > tbody > tr > td > a.megaButton.cartAddRadio ',
            ['style']);
        if (elements[0]['attributes'].toString() == '{style: display:none;}') {
          itemModel[i].isAvailable = false;
          itemModel[i].title = "GameStop PS5, Not Available!";
          print(elements[0]['attributes']);
          notifyListeners();
          return itemModel;
        } else {
          itemModel[i].isAvailable = true;
          itemModel[i].title = "GameStop PS5, Available!";
          notifyListeners();
          return itemModel;
        }

        /// MediaMarkt
      } else if (items[i].url1 == "https://www.mediamarkt.de") {
        print("MediaMarkt");
        List<Map<String, dynamic>> elements = webScraper.getElement(
            'div.indexstyled__StyledAppWrapper-sc-1hu9cx8-0.klAfyt > div.ProductDetailPagestyled__StyledPdpWrapper-sc-5s3nfq-1.hjoxyt > div.Grid__StyledGrid-fs0zc2-0.cQIsoQ.ProductDetailPagestyled__StyledPdpGrid-sc-5s3nfq-2.eJUJGv >'
            'div.Row__StyledRow-x4c83j-0.eaomqX.ProductDetailPagestyled__StyledPdpRow-sc-5s3nfq-0.bxwHHr > '
            'div.Cellstyled__StyledCell-sc-1wk5bje-0.ibdyBk.ProductDetailPagestyled__StyledPdpDetailCell-sc-5s3nfq-4.gLozy > '
            'div.Cardstyled__StyledCardWrapper-sc-1b4w28x-6.bwRnrw > '
            'div.Cardstyled__StyledCard-sc-1b4w28x-1.hSFggG > '
            'div.Row__StyledRow-x4c83j-0.cDKCes > '
            'div.Cellstyled__StyledCell-sc-1wk5bje-0.eJonzE > '
            'span.Typostyled__StyledInfoTypo-sc-1jga2g7-0.gYdSqK',
            ['title']);
        print(elements[0]['title']);
        try {
          if (elements[0]['title'] ==
              'Dieser Artikel ist aktuell nicht verfügbar.') {
            itemModel[i].isAvailable = false;
            itemModel[i].title = "MediaMarkt PS5, Not Available!";
            notifyListeners();
            return itemModel;
          }
        } catch (e) {
          itemModel[i].isAvailable = true;
          itemModel[i].title = "MediaMarkt PS5, Available!";
          notifyListeners();
          return itemModel;
        }
      }

      ///Saturn
      else if (items[i].url1 == "https://www.saturn.de") {
        print("Saturn");
        List<Map<String, dynamic>> elements = webScraper.getElement(
            'div.indexstyled__StyledAppWrapper-sc-1hu9cx8-0.cPLDhA > '
            'div.ProductDetailPagestyled__StyledPdpWrapper-sc-5s3nfq-1.hjoxyt >'
            'div.Grid__StyledGrid-fs0zc2-0.cQIsoQ.ProductDetailPagestyled__StyledPdpGrid-sc-5s3nfq-2.eJUJGv > '
            'div.Row__StyledRow-x4c83j-0.eaomqX.ProductDetailPagestyled__StyledPdpRow-sc-5s3nfq-0.bxwHHr > '
            'div.Cellstyled__StyledCell-sc-1wk5bje-0.ibdyBk.ProductDetailPagestyled__StyledPdpDetailCell-sc-5s3nfq-4.gLozy > '
            'div.Cardstyled__StyledCardWrapper-sc-1b4w28x-6.bwRnrw > '
            'div.Cardstyled__StyledCard-sc-1b4w28x-1.cWuSJZ > '
            'div.Row__StyledRow-x4c83j-0.cDKCes > '
            'div.Cellstyled__StyledCell-sc-1wk5bje-0.eJonzE > '
            'span.Typostyled__StyledInfoTypo-sc-1jga2g7-0.gYdSqK',
            ['items']);
        print(elements[0]['title']);
        try {
          if (elements[0]['title'] ==
              'Dieser Artikel ist aktuell nicht verfügbar.') {
            itemModel[i].isAvailable = false;
            itemModel[i].title = "Saturn PS5, Not Available!";
            notifyListeners();
            return itemModel;
          }
        } catch (e) {
          itemModel[i].isAvailable = true;
          itemModel[i].title = "Saturn PS5, Available!";
          notifyListeners();
          return itemModel;
        }
      }
    }
  }

  void checkAllItems() {
    for (int i = 0; i < items.length; i++) {
      fetchData(i);
    }
  }
}
