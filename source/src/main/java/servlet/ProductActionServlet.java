package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import dao.ProductsDAO;

@WebServlet("/productAction")
@MultipartConfig(fileSizeThreshold=1024*1024)
public class ProductActionServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        String action = req.getParameter("actionType");
        ProductsDAO dao = new ProductsDAO();

        try {
            if ("add".equals(action)) {
                String name  = req.getParameter("productName");
                int price    = Integer.parseInt(req.getParameter("productPrice"));
                int soldOut  = req.getParameter("isSoldOut") != null ? 1 : 0;
                String detail= req.getParameter("productDetail");
                // 画像は簡易にファイル名を取得。実運用では保存処理が必要
                Part filePart = req.getPart("datafile");
                String imageUrl = filePart != null ? filePart.getSubmittedFileName() : "";
                dao.insert(name, price, soldOut, 0, detail, imageUrl);

            } else if ("update".equals(action)) {
                int id       = Integer.parseInt(req.getParameter("productId"));
                String name  = req.getParameter("productName");
                int price    = Integer.parseInt(req.getParameter("productPrice"));
                int soldOut  = req.getParameter("isSoldOut") != null ? 1 : 0;
                String detail= req.getParameter("productDetail");
                Part filePart = req.getPart("datafile");
                String imageUrl = filePart != null && filePart.getSize()>0
                                  ? filePart.getSubmittedFileName() : req.getParameter("currentImage");
                dao.updateConfig(id, name, price, soldOut, 0, detail, imageUrl);

            } else if ("delete".equals(action)) {
                int id = Integer.parseInt(req.getParameter("productId"));
                dao.delete(id);
            }
        } catch (Exception e) {
            throw new ServletException(e);
        }

        // 処理後は一覧にリダイレクト
        res.sendRedirect(req.getContextPath() + "/HomeServlet");
    }
}
