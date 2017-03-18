package tallerweb.sangucheto.controladores;

import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import tallerweb.sangucheto.modelo.Ingrediente;
import tallerweb.sangucheto.modelo.Sanguchetto;
import tallerweb.sangucheto.modelo.Stock;
import tallerweb.sangucheto.modelo.TipoIngrediente;

@Controller
public class ControladorHome {

	@RequestMapping(path="/")
	public ModelAndView irAHome(){
		return new ModelAndView("home");
	}
	
	@RequestMapping(value="ingresaringrediente")
	public ModelAndView ingresarIngrediente(){
		Ingrediente ingrediente = new Ingrediente();
		ModelMap model = new ModelMap();
		model.put("ingrediente", ingrediente);
		return new ModelAndView("ingresarIngrediente",model);
	}
	
	@RequestMapping(value="AltaIngrediente", method=RequestMethod.POST)
	public ModelAndView agregarIngrediente(@ModelAttribute("ingrediente") Ingrediente ingrediente){
		ModelMap model = new ModelMap("ingrediente", ingrediente);
		
		if(Stock.getInstance().agregarIngrediente(ingrediente)){
			Stock.getInstance().agregarStock(ingrediente, 1); //MODIFIQUE ESTA LINEA
			model.put("texto","Se ingreso correctamente el siguiente producto:");
		}
		else{
			model.put("texto","No se ha podido ingresar el siguiente producto:");
		}
		return new ModelAndView("AltaIngrediente",model);

	}
	
	@RequestMapping(value="verStockDisponible")
	public ModelAndView verStock(){
		
		ModelMap model = new ModelMap();
		model.put("stock", Stock.getInstance().obtenerStock());
	
		return new ModelAndView("verStockDisponible",model);

	}
				// ARMAR SANGUCHETO PRINCIPAL
	@RequestMapping(value="armarSangucheto")
	public ModelAndView armarSangucheto(){
		ModelMap model = new ModelMap();
		model.put("ingrediente",new Ingrediente());
		model.put("precio",Sanguchetto.getInstance().getPrecio());
		model.put("sanguchetto",Sanguchetto.getInstance().obtenerSanguchetto());
		model.put("stock", Stock.getInstance().obtenerStock());
		return new ModelAndView("armarSangucheto",model);
	}
				//AGREGAR SANGUCHETTO
	@RequestMapping(value="armarSanguchettoAgrega", method=RequestMethod.POST)
	public ModelAndView armarSanguchetoAgrega(@ModelAttribute("ingrediente") Ingrediente ingrediente){
		ModelMap model = new ModelMap();
		if(Sanguchetto.getInstance().agregarIngrediente(ingrediente))
			System.out.println("se agrego :"+ingrediente.getNombre());
		else
			System.out.println("no se cargo");
		model.put("ingrediente", new Ingrediente());
		model.put("precio",Sanguchetto.getInstance().getPrecio());
		model.put("sanguchetto",Sanguchetto.getInstance().obtenerSanguchetto());
		model.put("stock", Stock.getInstance().obtenerStock());
		return new ModelAndView("armarSangucheto",model);
	}
				//VACIAR SANGUCHETTO
	@RequestMapping(value="armarSanguchettoVaciar", method=RequestMethod.POST)
	public ModelAndView armarSanguchetoVaciar(){
		ModelMap model = new ModelMap();
		Sanguchetto.getInstance().vaciar();
		model.put("ingrediente", new Ingrediente());
		model.put("precio",Sanguchetto.getInstance().getPrecio());
		model.put("sanguchetto",Sanguchetto.getInstance().obtenerSanguchetto());
		model.put("stock", Stock.getInstance().obtenerStock());
		return new ModelAndView("armarSangucheto",model);
	}
				//MOSTRAR SANGUCHETTO
	@RequestMapping(value="mostrarSangucheto")
	public ModelAndView armarSanguchetoPost()
	{

		ModelMap model = new ModelMap();
		model.put("sangucheto", Sanguchetto.getInstance().obtenerSanguchetto());
	
		return new ModelAndView("mostrarSanguchetto",model);	
	}

}
