<%-- 
    Document   : home
    Created on : 24/11/2018, 15:53:55
    Author     : Leonardo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-BR">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Anúncios de Veículos</title>

    <link rel="stylesheet" type="text/css" href="css/fontawesome.all.min.css">
    <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="css/style-default.css">
    <link rel="stylesheet" type="text/css" href="css/style-index.css">

    <script>
        function abrirAnuncio(anuncioId) {
            window.location = "anuncio.html?anuncio=" + anuncioId;
        }
    </script>
</head>

<body>
    
    <jsp:include page = "../../imports/menu.jsp" />

    <main class="container-fluid">
        <div class="conteudo col-sm-12 col-md-11 col-lg-10">

            <div class="row">
                <div class="menu-esquerdo col-md-auto">
                    <nav>
                        <form>
                            <div class="input-group input-group-sm mb-3">
                                <input type="text" class="form-control" placeholder="Busca por palavras chave"
                                    aria-label="Busca por palavras chave" aria-describedby="button-search">
                                <div class="input-group-append">
                                    <button class="btn btn-outline-primary" title="Buscar" type="submit" id="button-search">
                                        <i class="fas fa-search"></i>
                                    </button>
                                </div>
                            </div>
                        </form>

                        <ul class="list-group list-group-flush">
                            <li class="list-group-item">
                                <a href="?categoria=1">Carros, vans e utilitários</a>
                            </li>
                            <li class="list-group-item">
                                <a href="?categoria=2">Motos</a>
                            </li>
                            <li class="list-group-item">
                                <a href="?categoria=3">Caminhões</a>
                            </li>
                            <li class="list-group-item">
                                <a href="?categoria=4">Barcos e aeronaves</a>
                            </li>
                            <li class="list-group-item">
                                <a href="?categoria=5">Ônibus</a>
                            </li>
                        </ul>
                    </nav>
                </div>

                <div class="col">
                    <h3>Veículos anunciados</h3>
                    <table class="table table-hover">
                        <tr class="tabela-veiculos-linha" onclick="abrirAnuncio(1)">
                            <td class="tv-col-imagem">
                                <img src="images/576814036262839.jpg">
                            </td>
                            <td class="informacoes-anuncio">
                                <div class="row">
                                    <div class="col descricao-anuncio">
                                        <p>
                                            Bmw 320i - 2015 - 34.000 km | Câmbio: automático |
                                            Gasolina
                                        </p>
                                    </div>
                                    <div class="col-sm-auto valor-anuncio">
                                        <p>R$ 119.990</p>
                                    </div>
                                    <div class="col-sm-auto data-hora-anuncio">
                                        <p>
                                            10/09/2018 <br />
                                            17:55
                                        </p>
                                    </div>
                                </div>
                            </td>
                        </tr>
                        <tr class="tabela-veiculos-linha" onclick="abrirAnuncio(2)">
                            <td class="tv-col-imagem">
                                <img src="images/488817006229252.jpg">
                            </td>
                            <td class="informacoes-anuncio">
                                <div class="row">
                                    <div class="col descricao-anuncio">
                                        <p>
                                            Passat tsi 211 cv revisado 3º dono - 34.000 km | Câmbio: automático |
                                            Gasolina
                                        </p>
                                    </div>
                                    <div class="col-sm-auto valor-anuncio">
                                        <div>R$ 119.990</div>
                                    </div>
                                    <div class="col-sm-auto data-hora-anuncio">
                                        <p>
                                            10/09/2018 <br />
                                            17:55
                                        </p>
                                    </div>
                                </div>
                            </td>
                        </tr>
                        <tr class="tabela-veiculos-linha" onclick="abrirAnuncio(3)">
                            <td class="tv-col-imagem">
                                <img src="images/585815038078078.jpg">
                            </td>
                            <td class="informacoes-anuncio">
                                <div class="row">
                                    <div class="col descricao-anuncio">
                                        <p>
                                            Passat Branco - 34.000 km | Câmbio: automático | Gasolina
                                        </p>
                                    </div>
                                    <div class="col-sm-auto valor-anuncio">
                                        <div>R$ 119.990</div>
                                    </div>
                                    <div class="col-sm-auto data-hora-anuncio">
                                        <p>
                                            10/09/2018 <br />
                                            17:55
                                        </p>
                                    </div>
                                </div>
                            </td>
                        </tr>
                        <tr class="tabela-veiculos-linha" onclick="abrirAnuncio(4)">
                            <td class="tv-col-imagem">
                                <img src="images/782804083333935.jpg">
                            </td>
                            <td class="informacoes-anuncio">
                                <div class="row">
                                    <div class="col descricao-anuncio">
                                        <p>
                                            Ford Ranger - 34.000 km | Câmbio: automático | Gasolina
                                        </p>
                                    </div>
                                    <div class="col-sm-auto valor-anuncio">
                                        <p>R$ 119.990</p>
                                    </div>
                                    <div class="col-sm-auto data-hora-anuncio">
                                        <p>
                                            10/09/2018 <br />
                                            17:55
                                        </p>
                                    </div>
                                </div>
                            </td>
                        </tr>
                    </table>

                </div>
            </div>

        </div>
    </main>

    <script src="js/jquery-3.3.1.slim.min.js"></script>
    <script src="js/popper.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/scripts-default.js"></script>
</body>

</html>