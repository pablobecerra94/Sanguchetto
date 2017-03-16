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
			model.put("texto","Se ingreso correctamente el siguiente producto:");
		}
		else{
			model.put("texto","No se ha podido ingresar el siguiente producto:");
		}
		return new ModelAndView("AltaIngrediente",model);

		
		
	}
	
}
