package tn.enis.controller;

import java.io.IOException;
import java.util.List;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import tn.enis.entity.Client;
import tn.enis.entity.Compte;
import tn.enis.service.CompteService;

@WebServlet("/CompteController")
public class CompteController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @EJB
    private CompteService compteService;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        String clientCin = (String) request.getSession().getAttribute("clientCin");

        if (request.getParameter("clientCin") != null) {
            clientCin = request.getParameter("clientCin");
            request.getSession().setAttribute("clientCin", clientCin);
        }

        if ("LoadEdit".equals(action)) {
            Long rib = Long.parseLong(request.getParameter("rib"));
            Compte compte = this.compteService.findById(rib);
            request.setAttribute("editCompte", compte);
            request.getRequestDispatcher("modifiercompte.jsp").forward(request, response);
        } else {
            List<Compte> comptes = compteService.findByClientCin(clientCin);
            request.setAttribute("comptes", comptes);
            request.getRequestDispatcher("comptes.jsp").forward(request, response);
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        String clientCin = (String) request.getSession().getAttribute("clientCin");

        if (request.getParameter("clientCin") != null) {
            clientCin = request.getParameter("clientCin");
            request.getSession().setAttribute("clientCin", clientCin);
        }

        if ("Add".equals(action)) {
            float solde = Float.parseFloat(request.getParameter("solde"));
            Compte compte = new Compte(solde, new Client(clientCin, "", ""));
            compteService.save(compte);
            
        }if ("Delete".equals(action)) {
            System.out.println("Deleting compte with RIB: " + request.getParameter("rib"));
            Long rib = Long.parseLong(request.getParameter("rib"));
            Compte compte = compteService.findById(rib);
            if (compte != null) {
                compteService.delete(compte);
                System.out.println("Compte deleted successfully");
            } else {
                System.out.println("No compte found with RIB: " + rib);
            }
        

            
            
        } else if ("DoEdit".equals(action)) {
            Long rib = Long.parseLong(request.getParameter("rib"));
            float solde = Float.parseFloat(request.getParameter("solde"));
            Compte compte = compteService.findById(rib);
            compte.setSolde(solde);
            compte.getClient().setCin(clientCin);
            compteService.update(compte);
        }

       
        response.sendRedirect("CompteController?clientCin=" + clientCin);
    }
}
