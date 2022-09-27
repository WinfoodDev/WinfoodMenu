import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'global_baseurl_nuvem.dart';
import 'model/loja_model.dart';
import 'model/produtos_model.dart';

class AppImages {
  static final logo = Image.asset(
    'assets/images/logo/logo.png',
    height: 150,
  );

  static final lojista = Image.asset(
    'assets/images/logo/logo_lojista.jpg',
    height: 150,
  );

  static final instagram = Image.asset(
    'assets/images/logo/instagram-logo.png',
    height: 40,
  );

  static final google = Image.asset(
    'assets/images/logo/google-logo.png',
    height: 40,
  );

  static final apple = Image.asset(
    'assets/images/logo/apple-icon.png',
    height: 40,
  );

  Widget imageProductCarrinho(final cart, final context, index) {
    return Image.network(
      GlobalBaseURLNuvem.baseURLNuvem + cart.itens[index].produto!.imagem!,
      fit: BoxFit.cover,
      width: MediaQuery.of(context).size.width * 0.25,
      errorBuilder: (context, error, stackTrace) {
        return Image.asset(
          'images/bg_orange_1.jpg',
          fit: BoxFit.cover,
          width: MediaQuery.of(context).size.width * 0.25,
        );
      },
    );
  }

  Widget imageProduct(final p, final context) {
    return Image.network(
      GlobalBaseURLNuvem.baseURLNuvem + p!.imagem.toString(),
      errorBuilder: (context, error, stackTrace) {
        return Image.asset(
          'images/bg_orange_3.jpg',
          fit: BoxFit.cover,
          width: MediaQuery.of(context).size.width * 0.25,
        );
      },
      fit: BoxFit.cover,
      width: MediaQuery.of(context).size.width * 0.25,
    );
  }

  Widget newImageProduct(ProdutosModel p, BuildContext context) {
    return CachedNetworkImage(
      imageUrl: GlobalBaseURLNuvem.baseURLNuvem + p.imagem.toString(),
      fit: BoxFit.cover,
      height: 200,
      placeholder: (context, url) => Image.asset(
        'images/bg_orange_3.jpg',
        fit: BoxFit.fill,
        height: 70,
      ),
      errorWidget: (context, error, stackTrace) => Image.asset(
        'images/bg_orange_3.jpg',
        fit: BoxFit.fill,
        height: 1200,
      ),
    );
  }

  // Widget newImageProductMenuLoja(ProdMenuLoja p, BuildContext context) {
  //   return CachedNetworkImage(
  //     imageUrl: /*'http://mobileapp.pediaki.com.br/api/'*/ GlobalBaseURLNuvem
  //             .baseURLNuvem +
  //         p.img.toString(),
  //     fit: BoxFit.cover,
  //     height: 200,
  //     placeholder: (context, url) => Image.asset(
  //       'images/bg_orange_1.jpg',
  //       fit: BoxFit.cover,
  //       height: 70,
  //     ),
  //     errorWidget: (context, error, stackTrace) => Image.asset(
  //       'images/bg_orange_1.jpg',
  //       fit: BoxFit.cover,
  //       height: 200,
  //     ),
  //   );
  // }

  Widget newImageProductLocalLoja(ProdutosModel p, BuildContext context) {
    return CachedNetworkImage(
      imageUrl: /*'http://mobileapp.pediaki.com.br/api/'*/ GlobalBaseURLNuvem
              .baseURLNuvem +
          p.imagem.toString(),
      fit: BoxFit.cover,
      height: 200,
      placeholder: (context, url) => Image.asset(
        'images/bg_orange_1.jpg',
        fit: BoxFit.cover,
        height: 70,
      ),
      errorWidget: (context, error, stackTrace) => Image.asset(
        'images/bg_orange_1.jpg',
        fit: BoxFit.cover,
        height: 200,
      ),
    );
  }

  // Widget imageLogo(LojaModel loja, BuildContext context) {
  //   return ClipRRect(
  //     borderRadius: BorderRadius.circular(50.0),
  //     child: CachedNetworkImage(
  //       height: 60,
  //       width: 60,
  //       imageUrl: GlobalBaseURLNuvem.baseURLNuvem + loja.imgLogo.toString(),
  //       fit: BoxFit.cover,
  //       placeholder: (context, url) => Image.asset(
  //         'assets/images/not-found.png',
  //         fit: BoxFit.cover,
  //       ),
  //       errorWidget: (context, error, stackTrace) => Image.asset(
  //         'assets/images/not-found.png',
  //         fit: BoxFit.cover,
  //       ),
  //     ),
  //   );
  // }

  // Widget backgroundLoja(LojaModel loja, BuildContext context) {
  //   log(loja.imgFundo!);
  //   return ClipRRect(
  //     child: CachedNetworkImage(
  //       imageUrl: GlobalBaseURLNuvem.baseURLNuvem + loja.imgFundo.toString(),
  //       fit: BoxFit.cover,
  //       width: 60,
  //       placeholder: (context, url) => Image.asset(
  //         'images/bg_orange_4.png',
  //         fit: BoxFit.cover,
  //       ),
  //       errorWidget: (context, error, stackTrace) => Image.asset(
  //         'images/bg_orange_4.png',
  //         fit: BoxFit.cover,
  //       ),
  //     ),
  //   );
  // }

  Widget newImageDetalhes(ProdutosModel p, BuildContext context) {
    return CachedNetworkImage(
      imageUrl: /*"http://192.168.1.199:83/api"*/ GlobalBaseURLNuvem
              .baseURLNuvem +
          p.imagem.toString(),
      placeholder: (context, url) => Image.asset(
        'images/bg_orange_1.jpg',
        fit: BoxFit.cover,
        width: MediaQuery.of(context).size.width * 0.25,
      ),
      errorWidget: (context, error, stackTrace) {
        return Image.asset(
          'images/bg_orange_1.jpg',
          fit: BoxFit.cover,
          width: MediaQuery.of(context).size.width * 0.25,
        );
      },
      fit: BoxFit.cover,
      width: MediaQuery.of(context).size.width * 0.25,
    );
  }

  Widget imageLogo(Loja loja, BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(50.0),
      child: CachedNetworkImage(
        height: 60,
        width: 60,
        imageUrl: GlobalBaseURLNuvem.baseURLNuvem + loja.imgLogo.toString(),
        fit: BoxFit.cover,
        placeholder: (context, url) => Image.asset(
          'assets/images/not-found.png',
          fit: BoxFit.cover,
        ),
        errorWidget: (context, error, stackTrace) => Image.asset(
          'assets/images/not-found.png',
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget backgroundLoja(Loja loja, BuildContext context) {
    log(loja.imgFundo!);
    return ClipRRect(
      child: CachedNetworkImage(
        imageUrl: GlobalBaseURLNuvem.baseURLNuvem + loja.imgFundo.toString(),
        fit: BoxFit.cover,
        width: 60,
        placeholder: (context, url) => Image.asset(
          'images/bg_orange_4.png',
          fit: BoxFit.cover,
        ),
        errorWidget: (context, error, stackTrace) => Image.asset(
          'images/bg_orange_4.png',
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  static final logoLojista = Image.asset(
    'assets/images/logo_lojista.jpg',
    height: 80,
  );

  static final lanche = Image.asset(
    'assets/images/lanche.png',
    height: 80,
    width: 80,
  );

  static final porcao = Image.asset(
    'assets/images/batata-frita.png',
    height: 80,
    width: 80,
  );

  static final refrigerante = Image.asset(
    'assets/images/refri.png',
    height: 80,
    width: 80,
  );

  static final pizza = Image.asset(
    'assets/images/pizza.png',
    height: 80,
    width: 80,
  );
}
