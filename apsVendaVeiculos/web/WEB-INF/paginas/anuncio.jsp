<%-- 
    Document   : anuncio
    Created on : 24/11/2018, 15:52:28
    Author     : Leonardo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-BR">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Contato</title>

    <link rel="stylesheet" type="text/css" href="css/fontawesome.all.min.css">
    <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="css/style-default.css">
    <link rel="stylesheet" type="text/css" href="css/style-anuncio.css">
</head>

<body>
    <jsp:include page = "../../imports/menu.jsp" />

    <main class="container-fluid">
        <div class="conteudo col-sm-12 col-md-11 col-lg-10">
            <nav aria-label="breadcrumb">
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="index.html">Veículos</a></li>
                    <li class="breadcrumb-item"><a href="index.html?categoria=1">Carros, vans e utilitários</a></li>
                </ol>
            </nav>

            <h3>Passat tsi 211 cv revisado 3º dono</h3>
            <div class="dropdown-divider"></div>

            <div class="row">
                <div class="col-md-6 mb-4">
                    <img src="images/488817006229252-full.jpg" class="rounded float-left veiculo-imagem">
                </div>
                <div class="col-md-6 mb-3">
                    <div class="veiculo-valor rounded mb-2">
                        <span>R$ 119.000</span>
                    </div>
                    <div>
                        <strong>Ano:</strong>
                        <span>2016/2017</span>
                    </div>
                    <div>
                        <strong>Quilometragem:</strong>
                        <span>34.000 Km</span>
                    </div>
                    <div>
                        <strong>Combustível:</strong>
                        <span>Flex</span>
                    </div>
                </div>
            </div>

            <h4>Descrição</h4>

            <div class="row">
                <div class="col">
                    Veículo em ótimas condições...
                </div>
            </div>
    </main>

    <script src="js/jquery-3.3.1.slim.min.js"></script>
    <script src="js/popper.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/scripts-default.js"></script>
</body>

</html>

