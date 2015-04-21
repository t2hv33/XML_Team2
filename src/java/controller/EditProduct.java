/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import blo.ProductBLO;
import generate.jaxb.product.ProductType;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Hashtable;
import java.util.Iterator;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

/**
 *
 * @author duy
 */
public class EditProduct extends HttpServlet {

    private final String manage = "ManageProduct.jsp";

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, FileUploadException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {

            boolean isMultipath = ServletFileUpload.isMultipartContent(request);
            if (!isMultipath) {
                System.out.println("khong co file");
            } else {
                //tao factory cho dung luong luu file
                FileItemFactory factory = new DiskFileItemFactory();
                // tao file upload handler
                ServletFileUpload upload = new ServletFileUpload(factory);
                upload.setHeaderEncoding("UTF-8");  /// cái dòng này nó set coding cho tên file(vai vi utf-8)
                // dua request vao list
                List<FileItem> items = null;
                try {
                    items = upload.parseRequest(request);
                    System.out.println(items);
                } catch (FileUploadException e) {
                    e.printStackTrace();
                }
                Iterator iter = items.iterator();
                Hashtable params = new Hashtable();
                String itemName = null;
                while (iter.hasNext()) {
                    FileItem item = (FileItem) iter.next();

                    if (item.isFormField()) {
                        params.put(item.getFieldName(), item.getString("UTF-8")); // cái dòng này nó parse dữ liệu bằng charset utf-8.
                        //ko có cái utf-8 ở trong nên nó lỗi des
                        //System.out.println( item.getString("UTF-8"));
                        System.out.println(item.getFieldName());

                    } else {
                        try {
                            itemName = item.getName();
                            if (!itemName.isEmpty()) {
                                System.out.println(itemName);
                                String realPath = getServletContext().getRealPath("/") + "images\\" + itemName;
                                File saveFile = new File(realPath);
                                item.write(saveFile);
                            }

                        } catch (Exception e) {
                            e.printStackTrace();
                        }
                    }
                }


                String button = (String) params.get("btAction");
                int pID = Integer.parseInt((String) params.get("txtpID"));
                System.out.println(pID);
                String name = (String) params.get("txtName");
                int price = Integer.parseInt((String) params.get("txtPrice"));
                String oldImage = (String) params.get("txtOldImage");
                String img = null;
                if (itemName.isEmpty()) {
                    img = oldImage;
                } else {
                    img = "images/" + itemName;
                }
                System.out.println(img);
                String description = (String) params.get("txtDescription");
                String categoryname = (String) params.get("txtCategory");
                int instock = Integer.parseInt((String) params.get("txtInstock"));
                System.out.println(description);

                if (button.equals("Update")) {
                    response.setContentType("text/html;charset=UTF-8");
                    ProductType productType = new ProductType();
                    ProductBLO productBLO = new ProductBLO();
                    System.out.println(description);
                    ProductType p = new ProductType();
                    p.setPID(pID);
                    p.setCategory(categoryname);
                    p.setName(name);
                    p.setDescription(description);
                    p.setInstock(instock);
                    p.setPrice(price);
                    p.setImage(img);

                    productBLO.UpdateProduct(p);


                    System.out.println("update thanh cong kekekeke");
                    String url = manage;
                    response.sendRedirect(url);
                }


            }


        } finally {
            out.close();
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (FileUploadException ex) {
            Logger.getLogger(EditProduct.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /** 
     * Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (FileUploadException ex) {
            Logger.getLogger(EditProduct.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
