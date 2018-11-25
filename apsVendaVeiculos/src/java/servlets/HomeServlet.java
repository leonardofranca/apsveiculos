/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import dao.VeiculoDao;
import java.io.IOException;
import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import models.Veiculo;

/**
 *
 * @author Leonardo
 */
public class HomeServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        
        Connection conexao = (Connection) req.getAttribute("conexao");

        VeiculoDao dao = new VeiculoDao(conexao);

        List<Veiculo> veiculos = new ArrayList<>();
        try {
            veiculos = dao.buscaTodos();
        } catch (Exception ex) {
            System.out.println("erro");
            req.setAttribute("mensagem-erro", "Não foi possível comunicar com o banco de dados.");
        }

        req.setAttribute("veiculos", veiculos);

        RequestDispatcher dispatcher
                = req.getRequestDispatcher("/WEB-INF/paginas/home.jsp");
        dispatcher.forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }

}
