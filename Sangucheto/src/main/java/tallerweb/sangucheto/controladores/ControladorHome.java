package tallerweb.sangucheto.controladores;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import tallerweb.sangucheto.modelo.Ingrediente;
import tallerweb.sangucheto.modelo.Sanguchetto;
import tallerweb.sangucheto.modelo.Stock;
import tallerweb.sangucheto.modelo.TipoIngrediente;

@Controller
public class ControladorHome {

	@RequestMapping(path = "/")
	public ModelAndView irAHome() {
		return new ModelAndView("home");
	}
	@RequestMapping(path = "/home")
	public ModelAndView volverAHome() {
		return new ModelAndView("home");
	}

	@RequestMapping(value = "ingresaringrediente")
	public ModelAndView ingresarIngrediente() {
		Ingrediente ingrediente = new Ingrediente();
		ModelMap model = new ModelMap();
		model.put("ingrediente", ingrediente);
		return new ModelAndView("ingresarIngrediente", model);
	}

	@RequestMapping(value = "AltaIngrediente", method = RequestMethod.POST)
	public ModelAndView agregarIngrediente(@ModelAttribute("ingrediente") Ingrediente ingrediente) {
		ModelMap model = new ModelMap("ingrediente", ingrediente);

		if (Stock.getInstance().agregarIngrediente(ingrediente)) {
			model.put("texto", "Se ingreso correctamente el siguiente producto:");
		} else {
			model.put("texto", "No se ha podido ingresar el siguiente producto:");
		}
		return new ModelAndView("AltaIngrediente", model);

	}

	@RequestMapping(value = "verStockDisponible")
	public ModelAndView verStock() {

		ModelMap model = new ModelMap();
		model.put("stock", Stock.getInstance().obtenerStock());

		return new ModelAndView("verStockDisponible", model);

	}

	// ARMAR SANGUCHETO PRINCIPAL
	@RequestMapping(value = "armarSangucheto")
	public ModelAndView armarSangucheto() {
		ModelMap model = new ModelMap();
		model.put("ingrediente", new Ingrediente());
		model.put("precio", String.format("%.2f", Sanguchetto.getInstance().getPrecio()));
		model.put("descuento",String.format("%.2f", Sanguchetto.getInstance().getPrecio() * 0.10 ));
		model.put("sanguchetto", Sanguchetto.getInstance().obtenerSanguchetto());
		model.put("stock", Stock.getInstance().obtenerStock());
		return new ModelAndView("armarSangucheto", model);
	}

	// AGREGAR SANGUCHETTO
	@RequestMapping(value = "armarSanguchettoAgrega", method = RequestMethod.POST)
	public ModelAndView armarSanguchetoAgrega(@ModelAttribute("ingrediente") Ingrediente ingrediente, @RequestParam("cantidad") Integer cantidad) {
		ModelMap model = new ModelMap();
		if(cantidad>0){
			Sanguchetto.getInstance().agregarIngrediente(ingrediente,cantidad);
		}
		
		model.put("ingrediente", new Ingrediente());
		model.put("precio", String.format("%.2f", Sanguchetto.getInstance().getPrecio()));
		model.put("descuento",String.format("%.2f", Sanguchetto.getInstance().getPrecio() * 0.10 ));
		model.put("sanguchetto", Sanguchetto.getInstance().obtenerSanguchetto());
		model.put("stock", Stock.getInstance().obtenerStock());
		return new ModelAndView("armarSangucheto", model);
	}

	// VACIAR SANGUCHETTO
	@RequestMapping(value = "armarSanguchettoVaciar", method = RequestMethod.POST)
	public ModelAndView armarSanguchetoVaciar() {
		ModelMap model = new ModelMap();
		Sanguchetto.getInstance().vaciar();
		model.put("ingrediente", new Ingrediente());
		model.put("precio", String.format("%.2f", Sanguchetto.getInstance().getPrecio()));
		model.put("descuento",String.format("%.2f", Sanguchetto.getInstance().getPrecio() * 0.10 ));
		model.put("sanguchetto", Sanguchetto.getInstance().obtenerSanguchetto());
		model.put("stock", Stock.getInstance().obtenerStock());
		return new ModelAndView("armarSangucheto", model);
	}

	// MOSTRAR SANGUCHETTO
	@RequestMapping(value = "mostrarSangucheto")
	public ModelAndView armarSanguchetoPost() {
		ModelMap model = new ModelMap();
		model.put("sangucheto", Sanguchetto.getInstance().obtenerSanguchetto());
		
		return new ModelAndView("mostrarSanguchetto", model);
	}
	
	@RequestMapping(value = "agregarOQuitarStock")
	public ModelAndView agregarOQuitarStock(){
		ModelMap model = new ModelMap();
		model.put("stock", Stock.getInstance().obtenerStock());
		model.put("cantidadAIngresar", 0);
		model.put("ingrediente",new Ingrediente());
		
		
		return new ModelAndView("agregarOQuitarStock",model);
	}
	
	@RequestMapping(value = "agregarStock", method = RequestMethod.POST)
	public ModelAndView agregarStock(@ModelAttribute("ingrediente") Ingrediente ingrediente, @RequestParam(value="cantidadAIngresar") Integer cantidad){
		ModelMap model = new ModelMap();
		if(cantidad>0){			
			Stock.getInstance().agregarStock(ingrediente, cantidad);
		}
		model.put("stock", Stock.getInstance().obtenerStock());
		model.put("ingrediente",new Ingrediente());
		
		
		return new ModelAndView("agregarOQuitarStock",model);
	}
	
	@RequestMapping(value = "quitarStock", method = RequestMethod.POST)
	public ModelAndView QuitarStock(@ModelAttribute("ingrediente") Ingrediente ingrediente, @RequestParam(value="cantidadAIngresar") Integer cantidad){
		ModelMap model = new ModelMap();
		if(cantidad>0){			
			Stock.getInstance().quitarStock(ingrediente, cantidad);
		}
		model.put("stock", Stock.getInstance().obtenerStock());
		model.put("ingrediente",new Ingrediente());
		
		
		return new ModelAndView("agregarOQuitarStock",model);
	}
	
	@RequestMapping(value = "comprarSangucheto", method = RequestMethod.POST)
	public ModelAndView comprarSangucheto(){
	
		ModelMap model = new ModelMap();
		
		
		if(Sanguchetto.getInstance().estaVacio()){	
			model.put("precio", String.format("%.2f", Sanguchetto.getInstance().getPrecio()));
			model.put("descuento",String.format("%.2f", Sanguchetto.getInstance().getPrecio() * 0.10 ));
			model.put("ingrediente", new Ingrediente());
			model.put("sanguchetto", Sanguchetto.getInstance().obtenerSanguchetto());
			model.put("stock", Stock.getInstance().obtenerStock());
			return new ModelAndView("armarSangucheto");
		}
		model.put("precio", String.format("%.2f", Sanguchetto.getInstance().getPrecio()*0.90));
		model.put("sangucheto",Sanguchetto.getInstance().obtenerSanguchetto());
		return new ModelAndView("comprarSangucheto",model);
	}
	
	@RequestMapping(value="eliminarIngrediente", method = RequestMethod.POST)
	public ModelAndView eliminarIngrediente(@ModelAttribute("ingrediente") Ingrediente ingrediente){
		Stock.getInstance().eliminarIngrediente(ingrediente);
		
		ModelMap model = new ModelMap();
		model.put("stock", Stock.getInstance().obtenerStock());
		model.put("ingrediente",new Ingrediente());
		
		
		return new ModelAndView("agregarOQuitarStock",model);
	}
	

}
