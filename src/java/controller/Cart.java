/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dto.AccountDTO;
import dto.CartDTO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author duy
 */
public class Cart extends HttpServlet {

    private final String loginPage = "LoginPage.jsp";

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {

            String action = request.getParameter("action");
            HttpSession session = request.getSession();
            int accountID = 0;
            if (session.getAttribute("account") == null) {
                String url = loginPage;
                RequestDispatcher rd = request.getRequestDispatcher(url);
                rd.forward(request, response);
            }
            List<CartDTO> listcart = (List<CartDTO>) session.getAttribute("CART");
            if (listcart == null) {
                listcart = new ArrayList<CartDTO>();
            }

            if (action.equals("addcart")) {
                System.out.println("vao cart rui");
                String id = request.getParameter("pid");
                String name = request.getParameter("name");
                String price = request.getParameter("price");
                String instock = request.getParameter("instock");
                String image = request.getParameter("image");
                System.out.println(image);
                AccountDTO accountDTO = (AccountDTO) session.getAttribute("account");
                accountID = accountDTO.getUID();

                CartDTO cartDTO = new CartDTO(accountID, Integer.parseInt(id), name, image, Integer.parseInt(price), 1, Integer.parseInt(instock));
                boolean flag = true;

                for (int i = 0; i < listcart.size(); i++) {
                    if (listcart.get(i).getPID() == cartDTO.getPID()) {
                        listcart.get(i).setWantity(listcart.get(i).getWantity() + 1);
                        flag = false;
                    }
                }
                if (flag) {
                    listcart.add(cartDTO);
                }
                session.setAttribute("CART", listcart);
                System.out.println("add cart thanh cong");
                RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
                rd.forward(request, response);
            } else if (action.equals("Delete")) {
                String id = request.getParameter("pid");
                for (int i = 0; i < listcart.size(); i++) {
                    if (listcart.get(i).getPID() == Integer.parseInt(id)) {
                        listcart.remove(i);
                    }
                }
                RequestDispatcher rd = request.getRequestDispatcher("viewcart.jsp");
                rd.forward(request, response);
            } else if (action.equals("Checkout")) {

                //  String[] id = request.getParameterValues(action);
                System.out.println(listcart.size());                
                session.removeAttribute("CART");
                RequestDispatcher rd = request.getRequestDispatcher("thanksyou.jsp");
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
        processRequest(request, response);
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
        processRequest(request, response);
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
