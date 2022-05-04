import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;

public class Jugador {
	
	private int codigo;
	private String nombre;
	private String procedencia;
	private String altura;
	private int peso;
	private String posicion;
	private String nombreEquipo;
	
	public Jugador() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Jugador(int codigo, String nombre, String procedencia, String altura, int peso, String posicion,
			String nombreEquipo) {
		super();
		this.codigo = codigo;
		this.nombre = nombre;
		this.procedencia = procedencia;
		this.altura = altura;
		this.peso = peso;
		this.posicion = posicion;
		this.nombreEquipo = nombreEquipo;
	}

	/**
	 * @return the codigo
	 */
	public int getCodigo() {
		return codigo;
	}

	/**
	 * @param codigo the codigo to set
	 */
	public void setCodigo(int codigo) {
		this.codigo = codigo;
	}

	/**
	 * @return the nombre
	 */
	public String getNombre() {
		return nombre;
	}

	/**
	 * @param nombre the nombre to set
	 */
	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	/**
	 * @return the procedencia
	 */
	public String getProcedencia() {
		return procedencia;
	}

	/**
	 * @param procedencia the procedencia to set
	 */
	public void setProcedencia(String procedencia) {
		this.procedencia = procedencia;
	}

	/**
	 * @return the altura
	 */
	public String getAltura() {
		return altura;
	}

	/**
	 * @param altura the altura to set
	 */
	public void setAltura(String altura) {
		this.altura = altura;
	}

	/**
	 * @return the peso
	 */
	public int getPeso() {
		return peso;
	}

	/**
	 * @param peso the peso to set
	 */
	public void setPeso(int peso) {
		this.peso = peso;
	}

	/**
	 * @return the posicion
	 */
	public String getPosicion() {
		return posicion;
	}

	/**
	 * @param posicion the posicion to set
	 */
	public void setPosicion(String posicion) {
		this.posicion = posicion;
	}

	/**
	 * @return the nombreEquipo
	 */
	public String getNombreEquipo() {
		return nombreEquipo;
	}

	/**
	 * @param nombreEquipo the nombreEquipo to set
	 */
	public void setNombreEquipo(String nombreEquipo) {
		this.nombreEquipo = nombreEquipo;
	}

	@Override
	public String toString() {
		return "Código: " + this.codigo + " - Nombre: " + this.nombre 
				+ " - Procedencia: " + this.procedencia + " - Altura: " + this.altura
				+ " - Peso: " + this.peso + " - Posición: " + this.posicion
				+ " - Equipo: " + this.nombreEquipo;
	}
	
	
}
