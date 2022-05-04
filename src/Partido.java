
public class Partido {
	private int codigo;
	private String equipoLocal;
	private String equipoVisitante;
	private int puntosLocal;
	private int puntosVisitante;
	private String temporada;
	
	public Partido() {
		super();
		// TODO Auto-generated constructor stub
	}
	

	public Partido(int codigo, String equipoLocal, String equipoVisitante, int puntosLocal, int puntosVisitante,
			String temporada) {
		super();
		this.codigo = codigo;
		this.equipoLocal = equipoLocal;
		this.equipoVisitante = equipoVisitante;
		this.puntosLocal = puntosLocal;
		this.puntosVisitante = puntosVisitante;
		this.temporada = temporada;
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
	 * @return the equipoLocal
	 */
	public String getEquipoLocal() {
		return equipoLocal;
	}

	/**
	 * @param equipoLocal the equipoLocal to set
	 */
	public void setEquipoLocal(String equipoLocal) {
		this.equipoLocal = equipoLocal;
	}

	/**
	 * @return the equipoVisitante
	 */
	public String getEquipoVisitante() {
		return equipoVisitante;
	}

	/**
	 * @param equipoVisitante the equipoVisitante to set
	 */
	public void setEquipoVisitante(String equipoVisitante) {
		this.equipoVisitante = equipoVisitante;
	}

	/**
	 * @return the puntosLocal
	 */
	public int getPuntosLocal() {
		return puntosLocal;
	}

	/**
	 * @param puntosLocal the puntosLocal to set
	 */
	public void setPuntosLocal(int puntosLocal) {
		this.puntosLocal = puntosLocal;
	}

	/**
	 * @return the puntosVisitante
	 */
	public int getPuntosVisitante() {
		return puntosVisitante;
	}

	/**
	 * @param puntosVisitante the puntosVisitante to set
	 */
	public void setPuntosVisitante(int puntosVisitante) {
		this.puntosVisitante = puntosVisitante;
	}

	/**
	 * @return the temporada
	 */
	public String getTemporada() {
		return temporada;
	}

	/**
	 * @param temporada the temporada to set
	 */
	public void setTemporada(String temporada) {
		this.temporada = temporada;
	}

	@Override
	public String toString() {
		return "Partido [codigo=" + codigo + ", equipoLocal=" + equipoLocal + ", equipoVisitante=" + equipoVisitante
				+ ", puntosLocal=" + puntosLocal + ", puntosVisitante=" + puntosVisitante + ", temporada=" + temporada
				+ "]";
	}
	
	
}
