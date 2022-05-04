package FIFA22;

public class Liga {
	private int cod_liga;
	private String nombre;
	private String pais;
	public Liga() {
		super();
	}
	public Liga(int cod_liga, String nombre, String pais) {
		super();
		this.cod_liga = cod_liga;
		this.nombre = nombre;
		this.pais = pais;
	}
	public int getCod_liga() {
		return cod_liga;
	}
	public String getNombre() {
		return nombre;
	}
	public String getPais() {
		return pais;
	}
	public void setCod_liga(int cod_liga) {
		this.cod_liga = cod_liga;
	}
	public void setNombre(String nombre) {
		this.nombre = nombre;
	}
	public void setPais(String pais) {
		this.pais = pais;
	}
	@Override
	public String toString() {
		return "Código liga=" + cod_liga + ", nombre: " + nombre + ", país: " + pais;
	}
	
}
