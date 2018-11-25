<%@page import="java.util.List"%>
<%@page import="models.Veiculo"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    List<Veiculo> veiculos = (List<Veiculo>) request.getAttribute("veiculos");
%>
<!DOCTYPE html>
<html>
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
        <header>
            <nav class="navbar navbar-expand-sm navbar-dark bg-dark">
                <a class="navbar-brand" href="index.html">VEÍCULOS</a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarText" aria-controls="navbarText"
                        aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarText">
                    <ul class="navbar-nav mr-auto">
                        <li class="nav-item active">
                            <a class="nav-link" href="home">Início</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="anunciar">Anunciar</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="contato">Contato</a>
                        </li>
                    </ul>
                </div>
            </nav>
        </header>

        <main class="container-fluid">
            <div class="conteudo col-sm-12 col-md-11 col-lg-10">

                <div class="row">
                    <div class="menu-esquerdo col-md-auto">
                        <nav>
                            <form>
                                <div class="input-group input-group-sm mb-3">
                                    <input type="text" class="form-control" placeholder="Busca por palavras chave"
                                           aria-label="Busca por palavras chave" nome="buscar-anuncio" aria-describedby="button-search">
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
                            <% 
                                for(Veiculo a : veiculos){
                            %>
                            <tr class="tabela-veiculos-linha" onclick="abrirAnuncio()">
                                <td class="tv-col-imagem">
                                    <img src="C:/sistema/arquivos/<%= a.getImagem() %>">
                                </td>
                                <td class="informacoes-anuncio">
                                    <div class="row">
                                        <div class="col descricao-anuncio">
                                            <h4><%= a.getTitulo() %> - <%= a.getCombustivel()%></h4>
                                            <p><%= a.getAnoFabricacao()%>/<%= a.getAnoModelo()%></p>
                                            <p>KM: <%= a.getKilometragem()%></p>
                                            <p><%= a.getDescricao()%></p>
                                        </div>
                                        <div class="col-sm-auto valor-anuncio">
                                            <p>R$ <%= a.getValor() %></p>
                                        </div>
                                        <div class="col-sm-auto data-hora-anuncio">
                                            <p>
                                                <%= a.getDataCadastro() %><br />
                                            </p>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                            <% 
                                }
                            %>
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
