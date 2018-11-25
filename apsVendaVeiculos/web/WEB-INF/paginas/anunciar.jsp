<%-- 
    Document   : anunciar
    Created on : 18/11/2018, 18:22:35
    Author     : Leonardo
--%>

<%@page import="models.Veiculo"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    Veiculo veiculo;
    if (request.getAttribute("veiculo") != null) {
        veiculo = (Veiculo) request.getAttribute("veiculo");
    } else {
        veiculo = new Veiculo();
    }

    Object mensagemErro = request.getAttribute("mensagem-erro");
%>
<!DOCTYPE html>
<html lang="pt-BR">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Anunciar Veículo</title>

    <link rel="stylesheet" type="text/css" href="css/fontawesome.all.min.css">
    <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="css/style-default.css">
    <link rel="stylesheet" type="text/css" href="css/style-anunciar.css">
    <script src="js/validations.js" ></script>

    <script>
        function validarFormulario() {
            var inputTitulo = document['form-anunciar']['anuncio-titulo'];
            var inputAnoFabricacao = document['form-anunciar']['anuncio-ano-fabricacao'];
            var inputAnoModelo = document['form-anunciar']['anuncio-ano-modelo'];
            var inputQuilometragem = document['form-anunciar']['anuncio-quilometragem'];
            var inputValor = document['form-anunciar']['anuncio-valor'];
            var inputCombustivel = document['form-anunciar']['anuncio-combustivel'];
            var inputCategoria = document['form-anunciar']['anuncio-categoria'];
            var inputImagem = document['form-anunciar']['anuncio-imagem'];
//            
            var formValido = true;
//            
            //  Titulo
            if (!validaString(inputTitulo.value, 5)) {
                console.log("Titulo Invalido");
                formValido = false;
                inputTitulo.classList.add('is-invalid');
                inputTitulo.classList.remove('is-valid');
            } else {
                inputTitulo.classList.remove('is-invalid');
                inputTitulo.classList.add('is-valid');
            }

            //  Ano Fabricacao
            if (!validaNumber(inputAnoFabricacao.value, 1900, 2300)) {
                formValido = false;
                inputAnoFabricacao.classList.add('is-invalid');
                inputAnoFabricacao.classList.remove('is-valid');
            } else {
                inputAnoFabricacao.classList.remove('is-invalid');
                inputAnoFabricacao.classList.add('is-valid');
            }
            
            //  Ano Modelo
            if (!validaNumber(inputAnoModelo.value, 1900, 2300)) {
                formValido = false;
                inputAnoModelo.classList.add('is-invalid');
                inputAnoModelo.classList.remove('is-valid');
            } else {
                inputAnoModelo.classList.remove('is-invalid');
                inputAnoModelo.classList.add('is-valid');
            }
            
            //  Kilometragem
            if (!validaNumber(inputQuilometragem.value, 0, Number.MAX_VALUE)) {
                formValido = false;
                inputQuilometragem.classList.add('is-invalid');
                inputQuilometragem.classList.remove('is-valid');
            } else {
                inputQuilometragem.classList.remove('is-invalid');
                inputQuilometragem.classList.add('is-valid');
            }
            
            //  Valor
            if (!validaNumber(inputValor.value, 1, 1000000000)) {
                formValido = false;
                inputValor.classList.add('is-invalid');
                inputValor.classList.remove('is-valid');
            } else {
                inputValor.classList.remove('is-invalid');
                inputValor.classList.add('is-valid');
            }
            
            //  Combustivel
            if (!validaString(inputCombustivel.value, 1)) {
                formValido = false;
                inputCombustivel.classList.add('is-invalid');
                inputCombustivel.classList.remove('is-valid');
            } else {
                inputCombustivel.classList.remove('is-invalid');
                inputCombustivel.classList.add('is-valid');
            }
//            
            //  Categoria
            if (!validaString(inputCategoria.value, 1)) {
                formValido = false;
                inputCategoria.classList.add('is-invalid');
                inputCategoria.classList.remove('is-valid');
            } else {
                inputCategoria.classList.remove('is-invalid');
                inputCategoria.classList.add('is-valid');
            }
            
            if (!imagemInput.value) {
                formValido = false;
                imagemInput.classList.add('is-invalid');
                imagemInput.classList.remove('is-valid');
            } else {
                imagemInput.classList.remove('is-invalid');
                imagemInput.classList.add('is-valid');
            }
            console.log(formValido);
            console.log("teste");

            return false;
        }
    </script>
</head>

<body>
    <jsp:include page = "../../imports/menu.jsp" />
    
    <%
        if (mensagemErro != null) {
    %>
    <div class="alert alert-danger" role="alert">
        <%= mensagemErro%>
    </div>
    <%
        }
    %>
    <main class="container-fluid">
        <div class="conteudo col-sm-12 col-md-11 col-lg-10">
            <h3>Preencha os dados do anúncio</h3>
            <div class="dropdown-divider"></div>

            <form name="form-anunciar" enctype="multipart/form-data" accept-charset="utf-8"
                  method="POST" onsubmit="return validarFormulario()">

                <div class="form-row">
                    <div class="col-md-8 col-lg-7 col-xl-6">
                        <div class="form-group">
                            <label for="anuncio-titulo">Título</label>
                            <input type="text" class="form-control" name="anuncio-titulo" id="anuncio-titulo" placeholder="Passat TSI 211CV Revisado 3º Dono">
                            <div class="invalid-feedback">
                                Informe o título do anúncio.
                            </div>
                        </div>
                    </div>
                </div>

                <div class="form-row">
                    <div class="col-6 col-md-4 col-lg-3 col-xl-2">
                        <div class="form-group">
                            <label for="anuncio-ano-fabricacao">Ano de fabricação</label>
                            <input type="number" step="1" class="form-control" id="anuncio-ano-fabricacao" name="anuncio-ano-fabricacao" placeholder="2016">
                            <div class="invalid-feedback">
                                Informe o ano de fabricação do veículo.
                            </div>
                        </div>
                    </div>
                    <div class="col-6 col-md-4 col-lg-3 col-xl-2">
                        <div class="form-group">
                            <label for="anuncio-ano-modelo">Ano do modelo</label>
                            <input type="number" step="1" class="form-control" id="anuncio-ano-modelo" name="anuncio-ano-modelo" placeholder="2017">
                            <div class="invalid-feedback">
                                Informe o ano do modelo do veículo.
                            </div>
                        </div>
                    </div>
                </div>

                <div class="form-row">
                    <div class="col-6 col-md-4 col-lg-3">
                        <div class="form-group">
                            <label for="anuncio-quilometragem">Quilometragem</label>
                            <div class="input-group">
                                <input type="number" step="1" class="form-control" name="anuncio-quilometragem" id="anuncio-quilometragem"
                                    placeholder="34000">
                                <div class="input-group-append">
                                    <span class="input-group-text">Km</span>
                                </div>
                                <div class="invalid-feedback">
                                    Informe a quilometragem do veículo
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-6 col-md-4 col-lg-3">
                        <div class="form-group">
                            <label for="anuncio-valor">Valor</label>
                            <div class="input-group">
                                <div class="input-group-prepend">
                                    <span class="input-group-text">R$</span>
                                </div>
                                <input type="number" step="1" class="form-control" name="anuncio-valor" id="anuncio-valor" placeholder="119990">
                                <div class="input-group-append">
                                    <span class="input-group-text">,00</span>
                                </div>
                                <div class="invalid-feedback">
                                    Informe o valor do veículo.
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="form-row">
                    <div class="col-md-8 col-lg-7 col-xl-6">
                        <div class="form-group">
                            <!-- Os tipos de combustíveis podem ser fixados no código -->
                            <label for="anuncio-combustivel">Tipo de combustível</label>
                            <select class="form-control" name="anuncio-combustivel" id="anuncio-combustivel">
                                <option value="GASOLINA">Gasolina</option>
                                <option value="ETANOL">Etanol</option>
                                <option value="FLEX">Flex</option>
                                <option value="GAS">Gás</option>
                                <option value="DIESEL">Díesel</option>
                            </select>
                            <div class="invalid-feedback">
                                Selecione o tipo de combustível do veículo.
                            </div>
                        </div>
                    </div>
                </div>

                <div class="form-row">
                    <div class="col-md-8 col-lg-7 col-xl-6">
                        <div class="form-group">
                            <!-- As categorias devem ser carregadas do banco de dados -->
                            <label for="anuncio-categoria">Categoria</label>
                            <select class="form-control" id="anuncio-categoria" name="anuncio-categoria">
                                <option value="1">Carros, vans e utilitários</option>
                                <option value="2">Motos</option>
                                <option value="3">Caminhões</option>
                                <option value="4">Ônibus</option>
                                <option value="5">Barcos e aeronaves</option>
                            </select>
                            <div class="invalid-feedback">
                                Selecione a categoria do veículo.
                            </div>
                        </div>
                    </div>
                </div>

                <div class="form-row">
                    <div class="col-lg-8 col-xl-7">
                        <div class="form-group">
                            <label for="anuncio-imagem">Imagem</label>
                            <div class="custom-file">
                                <input type="file" accept="image/jpg,image/jpeg,image/png" class="custom-file-input" name="anuncio-imagem" id="anuncio-imagem">
                                <label class="custom-file-label" for="anuncio-imagem">Selecionar arquivo</label>
                                <div class="invalid-feedback">
                                    Selecione uma foto do veículo.
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="form-row">
                    <div class="col-lg-8 col-xl-7">
                        <div class="form-group">
                            <label for="anuncio-descricao">Descrição</label>
                            <textarea class="form-control" name="anuncio-descricao" id="anuncio-descricao" placeholder="Carro em ótimas condições..."></textarea>
                            <div class="invalid-feedback">
                                Informe a descrição do anúncio.
                            </div>
                        </div>
                    </div>
                </div>

                <a href="home" class="btn">Cancelar</a>
                <button type="submit" class="btn btn-primary">Anunciar</button>

            </form>

        </div>
    </main>

    <script src="js/jquery-3.3.1.slim.min.js"></script>
    <script src="js/popper.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/scripts-default.js"></script>
</body>

</html>
