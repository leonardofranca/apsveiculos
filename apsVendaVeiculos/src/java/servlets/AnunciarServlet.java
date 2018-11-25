/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import br.grupointegrado.ads.gerenciadorDeProdutos.utils.Validations;
import dao.VeiculoDao;
import java.io.IOException;
import java.sql.Connection;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import models.Veiculo;
import org.apache.tomcat.util.http.fileupload.FileUploadException;

/**
 *
 * @author Leonardo
 */
public class AnunciarServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        
        RequestDispatcher dispatcher
                = req.getRequestDispatcher("/WEB-INF/paginas/anunciar.jsp");
        dispatcher.forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        
        try {
            Veiculo veiculo = VeiculoDao.getProdutoByRequest(req);
            System.out.println(veiculo);
            String mensagemErro = validaCadastro(veiculo);
            System.out.println(mensagemErro);
//
            if (mensagemErro == null) {
                Connection conexao = (Connection) req.getAttribute("conexao");
                // Os dados do produto são válidos
                VeiculoDao dao = new VeiculoDao(conexao);

                try {
                    dao.inserir(veiculo);
                    resp.sendRedirect("/apsVendaVeiculos/anunciar");
                } catch (Exception ex) {
                    ex.printStackTrace();
                    req.setAttribute("mensagem-erro", "Não foi possível salvar o produto.");
                    req.setAttribute("veiculo", veiculo);

                    RequestDispatcher dispatcher
                = req.getRequestDispatcher("/WEB-INF/paginas/anunciar.jsp");
                    dispatcher.forward(req, resp);
                }
            } else {
                // Os dados do produto são inválidos
                req.setAttribute("mensagem-erro", mensagemErro);
                req.setAttribute("veiculo", veiculo);
//
                RequestDispatcher dispatcher
                = req.getRequestDispatcher("/WEB-INF/paginas/anunciar.jsp");
                    dispatcher.forward(req, resp);
            }
        } catch (Exception ex) {
            ex.printStackTrace();
            req.setAttribute("mensagem-erro", "Não foi possível salvar a imagem do produto.");

            RequestDispatcher dispatcher
                = req.getRequestDispatcher("/WEB-INF/paginas/anunciar.jsp");
                    dispatcher.forward(req, resp);
        }
    }
    
    private String validaCadastro(Veiculo veiculo) {
        if (!Validations.validaString(veiculo.getTitulo(), 5)) {
            return "O titulo do veiculo deve possuir ao menos 5 caracteres.";
        }
        if (!Validations.validaInt(veiculo.getAnoFabricacao(), 1900, 3000)) {
            return "O ano de fabricacao é invalido.";
        }
        if (!Validations.validaInt(veiculo.getAnoModelo(), 1900, 3000)) {
            return "O ano de modelo é invalido.";
        }
        if (!Validations.validaInt(veiculo.getKilometragem(), 0, 100000000)) {
            return "O kilometragem é invalida.";
        }
        if (veiculo.getImagem() == null) {
            return "A imagem do veiculo é obrigatória.";
        }
        return null;
    }
}
