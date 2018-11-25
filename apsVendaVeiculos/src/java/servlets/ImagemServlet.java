package servlets;

import models.Arquivo;
import utils.ServletUtil;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author mathe
 */
public class ImagemServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // Recebe o parâmetro com o caminho da imagem
        String caminho = req.getParameter("caminho");

        // Faz a leitura dos bytes da imagem
        Arquivo arquivo = ServletUtil.lerArquivo(caminho);

        // Devolve a imagem no response
        resp.setContentType("image/*");
        resp.setHeader("Content-disposition", "filename=" + arquivo.getNome());
        ServletOutputStream out = resp.getOutputStream();
        out.write(arquivo.getBytes());
    }
}
