<%@page import="utils.EnviarEmail"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    String mensagemUsuario=null;

    if (request.getMethod().equals("POST")) {
        EnviarEmail enviar = new EnviarEmail();
        enviar.setEmailDestinatario("renanrodrigueslolava@gmail.com");
        enviar.setAssunto("Contato - Venda de Veiculos");
        //uso StringBuffer para otimizar a concatenação 
        //de string
        StringBuffer texto = new StringBuffer(); 
        texto.append("<h2 align='center'>Maior site de anúncios do Brasil</h2>");
        texto.append("Informações Enviadas:<br/>");
        texto.append("<br/>");
        texto.append("Nome Completo ");
        texto.append(request.getParameter("txtNomeContato"));
        texto.append("<br/>");
        texto.append("Email: ");
        texto.append(request.getParameter("txtEmail"));
        texto.append("<br/>");
        texto.append("Mensagem ");
        texto.append(request.getParameter("txtMensagem"));

        enviar.setMsg(texto.toString());

        boolean enviou = enviar.enviarGmail();
        if (enviou) {

                mensagemUsuario = "Dados enviados com sucesso";

            } else {
                mensagemUsuario = "Não foi enviar as informações";

            }

    }  
%>


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
        <link rel="stylesheet" type="text/css" href="css/style-contato.css">

        <script>
//            function validarFormulario() {
//                var inputNome = document['form-contato']['contato-nome'];
//                var inputEmail = document['form-contato']['contato-email'];
//                var inputMensagem = document['form-contato']['contato-mensagem'];
//
//                inputNome.classList.add('is-invalid');
//                inputEmail.classList.add('is-invalid');
//                inputMensagem.classList.add('is-invalid');
//
//                return false;
//            }
        </script>
    </head>
    <body>
        <header>
            <nav class="navbar navbar-expand-sm navbar-dark bg-dark">
                <a class="navbar-brand" href="home">VEÍCULOS</a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarText" aria-controls="navbarText"
                    aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarText">
                    <ul class="navbar-nav mr-auto">
                        <li class="nav-item">
                            <a class="nav-link" href="home">Início</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="anunciar">Anunciar</a>
                        </li>
                        <li class="nav-item active">
                            <a class="nav-link" href="contato">Contato</a>
                        </li>
                    </ul>
                </div>
            </nav>
        </header>
        <%if (mensagemUsuario != null) {%>
        <div>
            <%=mensagemUsuario%>
        </div>
        <%}%>
        <main class="container-fluid">
            <div class="conteudo col-sm-12 col-md-11 col-lg-10">
                <h3>Preencha o formulário para entrar em contato com o maior site de anúncios do Brasil</h3>
                <div class="dropdown-divider"></div>

                <form name="form-contato" method="POST">

                    <div class="form-row">
                        <div class="col-md-8 col-lg-7 col-xl-6">
                            <div class="form-group">
                                <label for="contato-nome">Nome completo</label>
                                <input type="text" class="form-control" name="txtNomeContato" id="contato-nome" placeholder="Seu nome">
                                <div class="invalid-feedback">
                                    Informe seu nome completo.
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="form-row">
                        <div class="col-md-8 col-lg-7 col-xl-6">
                            <div class="form-group">
                                <label for="contato-email">E-mail</label>
                                <input type="email" class="form-control" name="txtEmail" id="contato-email" placeholder="Seu e-mail">
                                <div class="invalid-feedback">
                                    Informe seu e-mail de contato.
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="form-row">
                        <div class="col-lg-8 col-xl-7">
                            <div class="form-group">
                                <label for="contato-mensagem">Mensagem</label>
                                <textarea class="form-control" id="contato-mensagem" name="txtMensagem" placeholder="Escreva sua mensagem aqui..."></textarea>
                                <div class="invalid-feedback">
                                    Informe sua mensagem.
                                </div>
                            </div>
                        </div>
                    </div>

                    <a href="/home" class="btn">Cancelar</a>
                    <button type="submit" class="btn btn-primary">Enviar</button>

                </form>

            </div>
        </main>

        <script src="js/jquery-3.3.1.slim.min.js"></script>
        <script src="js/popper.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/scripts-default.js"></script>
    </body>
</html>
