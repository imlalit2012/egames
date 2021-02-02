import com.learn.egames.dao.CategoryDao;
import com.learn.egames.dao.ProductDao;
import com.learn.egames.entities.Category;
import com.learn.egames.entities.Product;
import com.learn.egames.helper.FactoryProvider;
import java.io.File;
import java.io.InputStream;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;


@MultipartConfig 
public class ProductOperationServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            String op = request.getParameter("operation");

            if (op.trim().equals("addCategory")) {
                // add Category
                // fetching category details

                String title = request.getParameter("catTitle");
                String description = request.getParameter("catDescription");
                
                Category category = new Category();
                category.setTitle(title);
                category.setDescription(description);

                // save category to database
                CategoryDao categoryDao =  new CategoryDao(FactoryProvider.getFactory());
                int catId = categoryDao.saveCategory(category);
                HttpSession httpSession = request.getSession();
                httpSession.setAttribute("message","Category added successfully: " + catId);
                response.sendRedirect("admin.jsp");
                return;
                
                
            } else if (op.trim().equals("addProduct")) {
                // add product
                
                String Title = request.getParameter("Title");
                String Description = request.getParameter("Description");
                int Price = Integer.parseInt(request.getParameter("Price"));
                int Discount = Integer.parseInt(request.getParameter("Discount"));
                int Quantity = Integer.parseInt(request.getParameter("Quantity"));
                int catId = Integer.parseInt(request.getParameter("catId"));
                Part part = request.getPart("Photo");
                
                
                Product p = new Product();
                p.setTitle(Title);
                p.setDescription(Description);
                p.setPrice(Price);
                p.setDiscount(Discount);
                p.setQuantity(Quantity);
                p.setPhoto(part.getSubmittedFileName());
                    
                // get category by id
                CategoryDao cdao = new CategoryDao(FactoryProvider.getFactory());
                Category category = cdao.getCategoryById(catId);
                
                p.setCategory(category);
                
                // Save Product
                
                ProductDao pdao = new ProductDao(FactoryProvider.getFactory());
                pdao.saveProduct(p);
                
                // pic upload
                String path = request.getRealPath("img")+ File.separator+ "products"+ File.separator+ part.getSubmittedFileName() ;
                
                // upload code
                FileOutputStream  fos =new FileOutputStream(path);
                InputStream is = part.getInputStream();

                // reading data                
                byte [] data= new byte[is.available()];
                is.read(data);
                
                //writing data
                
                fos.write(data);
                fos.close();
                
                HttpSession httpSession = request.getSession();
                httpSession.setAttribute("message","Product is added successfully");
                response.sendRedirect("admin.jsp");
                return;
            }

        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
