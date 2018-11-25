/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import utils.Formatter;
import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import models.Arquivo;
import models.Veiculo;
import org.apache.tomcat.util.http.fileupload.FileUploadException;
import utils.ServletUtil;

/**
 *
 * @author Leonardo
 */
public class VeiculoDao {
    
    private final Connection conexao;

    public VeiculoDao(Connection conexao) {
        this.conexao = conexao;
    }

    public void inserir(Veiculo anuncio) throws SQLException {
        // SQL: INSERT INTO anuncioS ...

        String sql = "INSERT INTO veiculo"
                + " (titulo, ano_fabricacao, ano_modelo, kilometragem, valor, combustivel, categoria, imagem, descricao, data_cadastro) "
                + " VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, NOW())";

        PreparedStatement statement = conexao.prepareStatement(sql);
        statement.setString(1, anuncio.getTitulo());
        statement.setInt(2, anuncio.getAnoFabricacao());
        statement.setInt(3, anuncio.getAnoModelo());
        statement.setInt(4, anuncio.getKilometragem());
        statement.setInt(5, anuncio.getValor());
        statement.setString(6, anuncio.getCombustivel());
        statement.setString(7, anuncio.getCategoria());
        statement.setString(8, anuncio.getImagem());
        statement.setString(9, anuncio.getDescricao());

        System.out.println("Insert dao");
        System.out.println(statement);
        statement.execute();
    }
    
    public Veiculo buscaPorId(int id) throws SQLException {
        // SQL: SELECT * FROM PRODUTOS
        String sql = "SELECT * FROM VEICULO "
                + " WHERE ID = ? ";

        PreparedStatement statement = conexao.prepareStatement(sql);
        statement.setLong(1, id);

        ResultSet result = statement.executeQuery();
        if (result.first()) {
            Veiculo anunc = getAnuncioByResultSet(result);
            return anunc;
        }

        return null;
    }

    public List<Veiculo> buscaTodos() throws SQLException {
        try {
            String sql = "SELECT * FROM VEICULO";

            PreparedStatement statement = conexao.prepareStatement(sql);

            List<Veiculo> anuncios = new ArrayList<>();

            ResultSet result = statement.executeQuery();
            if (result.first()) {
                do {
                    Veiculo anunc = getAnuncioByResultSet(result);
                    anuncios.add(anunc);
                } while (result.next());
            }
            System.out.println("busca todos");
            System.out.println(anuncios);
            return anuncios;
        } catch (Exception e) {
            System.out.println("erro" + e);
            return null;
        }
    }

    public static Veiculo getAnuncioByResultSet(ResultSet result) throws SQLException {
        Veiculo anunc = new Veiculo();
        anunc.setIdAnuncio(result.getInt("ID"));
        anunc.setTitulo(result.getString("TITULO"));
        anunc.setAnoFabricacao(result.getInt("ANO_FABRICACAO"));
        anunc.setAnoModelo(result.getInt("ANO_MODELO"));
        anunc.setKilometragem(result.getInt("KILOMETRAGEM"));
        anunc.setValor(result.getInt("VALOR"));
        anunc.setCombustivel(result.getString("COMBUSTIVEL"));
        anunc.setCategoria(result.getString("CATEGORIA"));
        anunc.setImagem(result.getString("IMAGEM"));
        anunc.setDescricao(result.getString("DESCRICAO"));
        anunc.setDataCadastro(result.getDate("DATA_CADASTRO"));
        return anunc;
    }
    
    public static Veiculo getProdutoByRequest(HttpServletRequest req) throws FileUploadException, IOException {
        Map<String, Object> parametters = ServletUtil.recuperaParametrosMultipart(req);
        System.out.println(parametters);

        String titulo = (String) parametters.get("anuncio-titulo");
        String ano_fabricacao = (String) parametters.get("anuncio-ano-fabricacao");
        String ano_modelo = (String) parametters.get("anuncio-ano-modelo");
        String quilometragem = (String) parametters.get("anuncio-quilometragem");
        String valor = (String) parametters.get("anuncio-valor");
        String combustivel = (String) parametters.get("anuncio-combustivel");
        String categoria = (String) parametters.get("anuncio-categoria");
        Arquivo arquivoImagem = (Arquivo) parametters.get("anuncio-imagem");
        String descricao = (String) parametters.get("anuncio-descricao");

        String imagemCaminho = null;
        if (arquivoImagem != null && arquivoImagem.temConteudo()) {
            imagemCaminho = ServletUtil.gravarArquivo(arquivoImagem);
        }

        Veiculo anuncio = new Veiculo();
        anuncio.setTitulo(titulo);
        anuncio.setAnoFabricacao(Formatter.stringParaInt(ano_fabricacao));
        anuncio.setAnoModelo(Formatter.stringParaInt(ano_modelo));
        anuncio.setKilometragem(Formatter.stringParaInt(quilometragem));
        anuncio.setValor(Formatter.stringParaInt(valor));
        anuncio.setCombustivel(combustivel);
        anuncio.setCategoria(categoria);
        anuncio.setImagem(imagemCaminho);
        anuncio.setDescricao(descricao);
        return anuncio;
    }
}
