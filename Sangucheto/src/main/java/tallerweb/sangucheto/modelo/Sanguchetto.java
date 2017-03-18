package tallerweb.sangucheto.modelo;

import java.util.LinkedList;
import java.util.List;

public class Sanguchetto {

	private static Sanguchetto instance = new Sanguchetto();
	private List<Ingrediente> ingredientes = new LinkedList<Ingrediente>();

	private Sanguchetto() {
	}

	public List<Ingrediente> obtenerSanguchetto() {
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
		for (Ingrediente ingrediente : ingredientes) {

			if (!stock.agregarStock(ingrediente, 1)) {
				stock.agregarIngrediente(ingrediente);
				stock.agregarStock(ingrediente, 1);
			}

		}
		ingredientes.clear();
	}

	/**
	 * Agrega un ingrediente al carrito.<br>
	 * 
	 * @param ingrediente
	 */
	public Boolean agregarIngrediente(Ingrediente ingrediente) {
		Stock stock = Stock.getInstance();
		if (stock.comprarIngrediente(ingrediente, 1)) {
			ingredientes.add(ingrediente);
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
		for (Ingrediente ingrediente : ingredientes) {
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
		for (Ingrediente ingrediente : ingredientes) {
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
		for (Ingrediente ingrediente : ingredientes) {
			precioTotal += ingrediente.getPrecio();
		}

		return precioTotal;

	}

	public void finalizarCompra() {
		ingredientes.clear();
		
	}
}
