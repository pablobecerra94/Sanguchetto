package tallerweb.sangucheto.modelo;

import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Set;

public class Sanguchetto {

	private static Sanguchetto instance = new Sanguchetto();
	private HashMap<Ingrediente,Integer> ingredientes = new HashMap<Ingrediente, Integer>();

	private Sanguchetto() {
	}
	
	public Boolean estaVacio()
	{
		return ingredientes.isEmpty();
	}

	public HashMap<Ingrediente,Integer> obtenerSanguchetto() {
		return ingredientes;
	}

	public static Sanguchetto getInstance() {
		return instance;
	}

	/**
	 * Elimina todos los ingredientes del sanguchetto.<br>
	 */
	public void vaciar() {
		Stock stock = Stock.getInstance();
		for (Ingrediente ingrediente : ingredientes.keySet()) {

			if (!stock.agregarStock(ingrediente, ingredientes.get(ingrediente))) {
				stock.agregarIngrediente(ingrediente);
				stock.agregarStock(ingrediente, ingredientes.get(ingrediente));
			}

		}
		ingredientes.clear();
	}

	/**
	 * Agrega un ingrediente al carrito.<br>
	 * 
	 * @param ingrediente
	 */
	public Boolean agregarIngrediente(Ingrediente ingrediente, Integer cantidad) {
		Stock stock = Stock.getInstance();
		if (stock.comprarIngrediente(ingrediente, cantidad)) {
			if(ingredientes.containsKey(ingrediente)){
				ingredientes.put(ingrediente,ingredientes.get(ingrediente) + cantidad);				
			}
			else{
				ingredientes.put(ingrediente, cantidad);
			}
			return true;
		}
		return false;

	}

	/**
	 * Lista todos los ingredientes que forman parte del sanguchetto.<br>
	 * 
	 * @return
	 */
	public List<Ingrediente> verIngredientes() {
		List<Ingrediente> ingredientesADevolver = new LinkedList<>();
		for (Ingrediente ingrediente : ingredientes.keySet()) {
			if (ingrediente.getTipo().equals(TipoIngrediente.INGREDIENTE)) {
				ingredientesADevolver.add(ingrediente);
			}
		}

		return ingredientesADevolver;
	}

	/**
	 * Lista todos los condimentos que forman parte del sanguchetto.<br>
	 * 
	 * @return
	 */
	public List<Ingrediente> verCondimentos() {
		List<Ingrediente> condimentos = new LinkedList<>();
		for (Ingrediente ingrediente : ingredientes.keySet()) {
			if (ingrediente.getTipo().equals(TipoIngrediente.CONDIMENTO)) {
				condimentos.add(ingrediente);
			}
		}

		return condimentos;
	}

	/**
	 * Devuelve el precio total del sanguchetto.<br>
	 * 
	 * @return
	 */
	public Double getPrecio() {
		Double precioTotal = 0.0;
		for (Ingrediente ingrediente : ingredientes.keySet()) {
			precioTotal += ingrediente.getPrecio()*ingredientes.get(ingrediente);
		}

		return precioTotal;

	}

	public void finalizarCompra() {
		ingredientes.clear();
	}

	
}
