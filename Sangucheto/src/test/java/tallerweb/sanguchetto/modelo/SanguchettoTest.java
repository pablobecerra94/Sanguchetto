package tallerweb.sanguchetto.modelo;

import static org.junit.Assert.*;

import java.util.List;

import org.junit.Before;
import org.junit.Test;

import tallerweb.sangucheto.modelo.Ingrediente;
import tallerweb.sangucheto.modelo.Sanguchetto;
import tallerweb.sangucheto.modelo.Stock;
import tallerweb.sangucheto.modelo.TipoIngrediente;

public class SanguchettoTest {

	Ingrediente ingrediente;
	Ingrediente condimento;
	Sanguchetto sangucheto;

	@Before
	public void crear() {
		sangucheto = Sanguchetto.getInstance();
		ingrediente = new Ingrediente();
		ingrediente.setNombre("Milanesa");
		ingrediente.setTipo(TipoIngrediente.INGREDIENTE);
		ingrediente.setPrecio(10.25);
		Stock stock = Stock.getInstance();
		stock.agregarIngrediente(ingrediente);
		stock.agregarStock(ingrediente, 10);
		condimento = new Ingrediente();
		condimento.setNombre("Mayonesa");
		condimento.setPrecio(1.25);
		condimento.setTipo(TipoIngrediente.CONDIMENTO);
		stock.agregarIngrediente(condimento);
		stock.agregarStock(condimento, 10);
	}

	@Test
	public void testVaciar() {

		sangucheto.agregarIngrediente(ingrediente,10);
		sangucheto.agregarIngrediente(condimento,10);
		sangucheto.vaciar();
		assertTrue(sangucheto.verIngredientes().isEmpty());
		assertTrue(sangucheto.verCondimentos().isEmpty());
	}

	@Test
	public void testAgregarIngrediente() {
		sangucheto.vaciar();
		sangucheto.agregarIngrediente(ingrediente,10);
		assertEquals(1, sangucheto.verIngredientes().size());

	}

	@Test
	public void testVerIngredientes() {
		sangucheto.vaciar();
		sangucheto.agregarIngrediente(ingrediente,10);
		List<Ingrediente> ingredientes = sangucheto.verIngredientes();
		for (Ingrediente ingredienteAgregado : ingredientes) {
			assertEquals("Milanesa", ingredienteAgregado.getNombre());
			System.out.println(ingredienteAgregado.getNombre());
		}
	}

	@Test
	public void testVerCondimentos() {
		sangucheto.vaciar();
		sangucheto.agregarIngrediente(condimento,10);
		List<Ingrediente> condimentos = sangucheto.verCondimentos();
		for (Ingrediente condimentoAgregado : condimentos) {
			assertEquals("Mayonesa", condimentoAgregado.getNombre());
			System.out.println(condimentoAgregado.getNombre());
		}
	}

	@Test
	public void testGetPrecio() {
		sangucheto.vaciar();
		sangucheto.agregarIngrediente(ingrediente,1);
		sangucheto.agregarIngrediente(condimento,1);
		Double valorEsperado = 11.5;
		assertEquals(valorEsperado, sangucheto.getPrecio());
	}
}
