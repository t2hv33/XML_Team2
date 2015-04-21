/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import generate.jaxb.product.Allproduct;
import generate.jaxb.product.ProductType;
import java.io.FileReader;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.stream.XMLEventReader;
import javax.xml.stream.XMLInputFactory;
import javax.xml.stream.XMLStreamException;
import javax.xml.stream.events.Characters;
import javax.xml.stream.events.StartElement;
import javax.xml.stream.events.XMLEvent;
import util.Marshall;

/**
 *
 * @author duy
 */
public class SearchMP extends HttpServlet {
private final String searchPage = "Manage.jsp";
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, XMLStreamException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {

            String action = request.getParameter("action");

            if (action.equals(".")) {

                String searchValue = request.getParameter("txtSearch");
                XMLInputFactory xif = XMLInputFactory.newInstance();
                String fielName = getServletContext().getRealPath("/") + "xml/Duy.xml";
                //cusor API
                FileReader fileReader = new FileReader(fielName);
                XMLEventReader xer = xif.createXMLEventReader(fileReader);

                int PID = 0;
                String Name = null;
                int Price = 0;
                String Description = null;
                String Category = null;
                String Image = null;
                int Instock = 0;
                int Promotion = 0;

                List<ProductType> list = new ArrayList<ProductType>();
                boolean found = false;
                while (xer.hasNext()) {
                    XMLEvent event = xer.nextEvent();  //interator API
                    if (event.isStartElement()) {
                        StartElement start = event.asStartElement();
                        if (start.getName().getLocalPart().equals("PID")) {
                            event = xer.nextEvent();
                            Characters chars = event.asCharacters();
                            //Characters chars = event.asCharacters();
                            PID = new Integer(chars.getData().trim());
                        } else if (start.getName().getLocalPart().equals("Name")) {
                            event = xer.nextEvent();
                            Characters chars = event.asCharacters();
                            Name = chars.getData().trim();
                            if (Name.toLowerCase().indexOf(searchValue.toLowerCase()) > -1) {
                                found = true;
                            }
                        } else if (found && start.getName().getLocalPart().equals("Price")) {
                            event = xer.nextEvent();
                            Characters chars = event.asCharacters();
                            Price = new Integer(chars.getData().trim());
                        } else if (found && start.getName().getLocalPart().equals("Description")) {
                            event = xer.nextEvent();
                            Characters chars = event.asCharacters();
                            Description = chars.getData().trim();
                        } else if (found && start.getName().getLocalPart().equals("Category")) {
                            event = xer.nextEvent();
                            Characters chars = event.asCharacters();
                            Category = chars.getData().trim();
                        } else if (found && start.getName().getLocalPart().equals("Image")) {
                            event = xer.nextEvent();
                            Characters chars = event.asCharacters();
                            Image = chars.getData().trim();
                        } else if (found && start.getName().getLocalPart().equals("Instock")) {
                            event = xer.nextEvent();
                            Characters chars = event.asCharacters();
                            Instock = new Integer(chars.getData().trim());
                            } else if (found && start.getName().getLocalPart().equals("Promotion")) {
                            event = xer.nextEvent();
                            Characters chars = event.asCharacters();
                            Promotion = new Integer(chars.getData().trim());
                        
                            ProductType pro = new ProductType(PID, Name, Price, Description, Category, Image, Instock, Promotion);
                            list.add(pro);
                            found = false;
                        }
                    }
                }

                String xmlFilePath = getServletContext().getRealPath("/") + "xml/Search.xml";
                Marshall.marshall(xmlFilePath, new Allproduct(list));
                System.out.println("tao search thanh cong");
                RequestDispatcher rd = request.getRequestDispatcher(searchPage);
                rd.forward(request, response);


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
        } catch (XMLStreamException ex) {
            Logger.getLogger(SearchMP.class.getName()).log(Level.SEVERE, null, ex);
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
        } catch (XMLStreamException ex) {
            Logger.getLogger(SearchMP.class.getName()).log(Level.SEVERE, null, ex);
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
