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
import javax.servlet.ServletContext;
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
public class AddProduct extends HttpServlet {

    private final String manage = "index.jsp";

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
        request.setCharacterEncoding("UTF-8");

        PrintWriter out = response.getWriter();
        try {

//            File file;
//            File fileClient;
//            int maxFileSize = 5000 * 1024;
//            int maxMemSize = 5000 * 1024;
//            ServletContext context = getServletContext();
//            System.out.println(context);
//            String filePath = context.getInitParameter("file-upload");
//
//            String filePathClient = context.getInitParameter("file-upload-client");
//            String fileName="";
//
//            // Verify the content type
//            String contentType = request.getContentType();
//            if (contentType == null) {
//                return;
//            }
//            if ((contentType.indexOf("multipart/form-data") >= 0)) {
//                DiskFileItemFactory factory = new DiskFileItemFactory();
//                // maximum size that will be stored in memory
//                factory.setSizeThreshold(maxMemSize);
//                // Location to save data that is larger than maxMemSize.
//                factory.setRepository(new File("c:\\temp"));
//
//                // Create a new file upload handler
//                ServletFileUpload upload = new ServletFileUpload(factory);
//                // maximum file size to be uploaded.
//                upload.setSizeMax(maxFileSize);
//                try {
//                    // Parse the request to get file items.
//                    List fileItems = upload.parseRequest(request);
//
//                    // Process the uploaded file items
//                    Iterator i = fileItems.iterator();
//
//                    while (i.hasNext()) {
//                        FileItem fi = (FileItem) i.next();
//                        if (!fi.isFormField()) {
//                            // Get the uploaded file parameters
//                            String fieldName = fi.getFieldName();
//                            fileName = fi.getName();
//                            boolean isInMemory = fi.isInMemory();
//                            long sizeInBytes = fi.getSize();
//                            // Write the file
//                            if (fileName.lastIndexOf("\\") >= 0) {
//                                file = new File(filePath
//                                        + fileName.substring(fileName.lastIndexOf("\\")));
//                                fileClient = new File(filePathClient
//                                        + fieldName.substring(fieldName.lastIndexOf("\\")));
//                            } else {
//                                file = new File(filePath
//                                        + fileName.substring(fileName.lastIndexOf("\\") + 1));
//                                fileClient = new File(filePathClient
//                                        + fieldName.substring(fieldName.lastIndexOf("\\" + 1)));
//                            }
//                            fi.write(file);
//                            fi.write(fileClient);
//                            System.out.println("Uploaded Filename: " + filePath + fileName + "<br>");
//                        }
//                    }
//
//                } catch (Exception ex) {
//                    System.out.println(ex);
//                }
//            } else {
//                System.out.println("ko co file upload");
//            }
//System.out.println(request.getCharacterEncoding());
            boolean isMultipath = ServletFileUpload.isMultipartContent(request);
            if (!isMultipath) {
                System.out.println("khong co file");
            } else {
                FileItemFactory factory = new DiskFileItemFactory();
                ServletFileUpload upload = new ServletFileUpload(factory);
                upload.setHeaderEncoding("UTF-8");  /// cái dòng này nó set coding(vai vi utf-8)
                List items = null;
                try {
                    items = upload.parseRequest(request);

                } catch (FileUploadException e) {
                    e.printStackTrace();
                }
                Iterator iter = items.iterator();
                Hashtable params = new Hashtable();               
                String itemName = null;
                while (iter.hasNext()) {
                    FileItem item = (FileItem) iter.next();

                    if (item.isFormField()) {
                        params.put(item.getFieldName(), item.getString("UTF-8")); // cái dòng này nó parse dữ liệu bằng charset utf-8.ko có cái utf-8 ở trong nên nó lỗi
                        System.out.println(item.getFieldName());
                        //System.out.println( item.getString("UTF-8"));

                    } else {
                        try {
                            itemName = item.getName();
                            if (itemName.isEmpty()) {
                                itemName = "noimages.jpg";
                            } else {
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
                String name = (String) params.get("txtName");
                int price = Integer.parseInt((String) params.get("txtPrice"));;
                String img = "images/" + itemName;
                String description = (String) params.get("txtDescription");
                String categoryname = (String) params.get("txtCategory");
                int instock = Integer.parseInt((String) params.get("txtInstock"));
                System.out.println(description);

                if (button.equals("Add")) {
                    response.setContentType("text/html;charset=UTF-8");
                    ProductType productType = new ProductType();
                    ProductBLO productBLO = new ProductBLO();
                    System.out.println(description);
                    ProductType p = new ProductType();
                    p.setCategory(categoryname);
                    p.setName(name);
                    p.setDescription(description);
                    p.setInstock(instock);
                    p.setPrice(price);
                    p.setImage(img);

                    int PID = productBLO.addproduct(p);
                    productType.setPID(PID);
                    System.out.println("add thanh cong roi");
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
            Logger.getLogger(AddProduct.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(AddProduct.class.getName()).log(Level.SEVERE, null, ex);
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
