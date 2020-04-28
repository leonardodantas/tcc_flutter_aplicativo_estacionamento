import 'package:flutter/material.dart';

class DrawerTiler extends StatelessWidget {
  //criação da classe que contera os elementos do menu em formato de lista
  final IconData icon;
  final String text;
  final PageController pageController;
  final int page;

  DrawerTiler(this.icon, this.text, this.pageController, this.page);

  @override
  Widget build(BuildContext context) {
    //uso do componente material
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {
          Navigator.of(context).pop();
          pageController.jumpToPage(page);
        },
        //container onde ficara a linha
        child: Container(
          padding: EdgeInsets.only(left: 32, right: 16),
          height: 60.0,
          //a linha tera um icone, o sizeBox para dar um espaço e o text
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                text,
                style: TextStyle(
                    fontSize: 16.0,
                    color: pageController.page.round() == page
                        ? Theme.of(context).primaryColor
                        : Colors.grey[700]),
              ),
              Icon(icon,
                  size: 32.0,
                  color: pageController.page.round() == page
                      ? Theme.of(context).primaryColor
                      : Colors.grey[700]),
            ],
          ),
        ),
      ),
    );
  }
}
