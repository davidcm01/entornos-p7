
public class Equipo {
	
	private String nombre;
	private String ciudad;
	private String conferencia;
	private String division;
	
	public Equipo() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Equipo(String nombre, String ciudad, String conferencia, String division) {
		super();
		this.nombre = nombre;
		this.ciudad = ciudad;
		this.conferencia = conferencia;
		this.division = division;
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
	 * @return the ciudad
	 */
	public String getCiudad() {
		return ciudad;
	}

	/**
	 * @param ciudad the ciudad to set
	 */
	public void setCiudad(String ciudad) {
		this.ciudad = ciudad;
	}

	/**
	 * @return the conferencia
	 */
	public String getConferencia() {
		return conferencia;
	}

	/**
	 * @param conferencia the conferencia to set
	 */
	public void setConferencia(String conferencia) {
		this.conferencia = conferencia;
	}

	/**
	 * @return the division
	 */
	public String getDivision() {
		return division;
	}

	/**
	 * @param division the division to set
	 */
	public void setDivision(String division) {
		this.division = division;
	}

	@Override
	public String toString() {
		return "Nombre: " + this.nombre + " - Ciudad: " + this.ciudad + " - Conferencia: " + this.conferencia + " - Division: " + this.division;
	}
	
	
}
