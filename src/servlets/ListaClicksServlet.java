package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import modelo.Click;
import modelo.ClickContexto;
import modelo.Contador;

/**
 * Servlet implementation class ListaClicksServlet
 */
//@WebServlet(name="jj", urlPatterns="/Clicks")  -- Mapeo en el archivo
public class ListaClicksServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ListaClicksServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//Acceder a sesion y a contexto
		/*ServletContext contexto = request.getServletContext();
		System.out.println(contexto.getAttribute("contador"));*/
		
		//Sesion
		HttpSession sesion = request.getSession();
		
		//Manejo de la lista en la sesion
		if (sesion.getAttribute("clicks") == null) { //sesion.isNew()
			sesion.setAttribute("contador", new Contador());
			sesion.setAttribute("clicks", new ArrayList<Click>());
		}
		
		//Creacion de array clicks
		ArrayList<Click> clicks = (ArrayList<Click>) sesion.getAttribute("clicks");
		Contador contador = (Contador) sesion.getAttribute("contador");
		
		contador.setContador(contador.getContador()+1);

		Click click = new Click();
		click.setContador(new Contador(contador.getContador()));
		click.setFechaHora(new Date());
		clicks.add(click);
		
		//Contexto
		ServletContext contexto = request.getServletContext();
		
		//Manejo de la lista en el contexto
		if (contexto.getAttribute("clicks") == null) {
			//sesion.setAttribute("contador", new Contador());
			contexto.setAttribute("clicks", new ArrayList<ClickContexto>());
		}
		
		//Creacion de array clicksContexto 
		ArrayList<ClickContexto> clicksContexto = (ArrayList<ClickContexto>) contexto.getAttribute("clicks");
		ClickContexto clickContexto = new ClickContexto(sesion.getId(), click);
		clicksContexto.add(clickContexto);
		
		
		
		//Comprobaciones
		System.out.println(click);
		System.out.println(clickContexto);
		System.out.println("***************");

		//ceder control al JSP (vista)
		request.getRequestDispatcher("/jsp/clicksContexto.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
	
	@Override
	public void init(ServletConfig config) throws ServletException {
		// TODO Auto-generated method stub
		super.init(config);
		ServletContext contexto = this.getServletContext();
		//ServletContext contexto = config.getServletContext();
		
		//System.out.println(this.getInitParameter("driver"));
		//System.out.println(this.getServletContext().getInitParameter("global2"));
		
		//guardando un ATRIBUTO EN CONTEXTO...
		Contador contador = new Contador();
		contador.setContador(123);
		contexto.setAttribute("contador", contador);
		
	}

}
