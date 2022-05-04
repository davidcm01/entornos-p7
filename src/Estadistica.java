
public class Estadistica {
	
	private String temporada;
	private int jugador;
	private double puntosPorPartido;
	private double asistenciasPorPartido;
	private double taponesPorPartido;
	private double rebotesPorPartido;
	private String nombreJugador;
	
	public Estadistica() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Estadistica(String temporada, int jugador, double puntosPorPartido, double asistenciasPorPartido,
			double taponesPorPartido, double rebotesPorPartido) {
		super();
		this.temporada = temporada;
		this.jugador = jugador;
		this.puntosPorPartido = puntosPorPartido;
		this.asistenciasPorPartido = asistenciasPorPartido;
		this.taponesPorPartido = taponesPorPartido;
		this.rebotesPorPartido = rebotesPorPartido;
	}
	
	public Estadistica(String temporada, String nombreJugador, double puntosPorPartido, double asistenciasPorPartido,
			double taponesPorPartido, double rebotesPorPartido) {
		this.temporada = temporada;
		this.nombreJugador = nombreJugador;
		this.puntosPorPartido = puntosPorPartido;
		this.asistenciasPorPartido = asistenciasPorPartido;
		this.taponesPorPartido = taponesPorPartido;
		this.rebotesPorPartido = rebotesPorPartido;
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

	/**
	 * @return the jugador
	 */
	public int getJugador() {
		return jugador;
	}

	/**
	 * @param jugador the jugador to set
	 */
	public void setJugador(int jugador) {
		this.jugador = jugador;
	}

	/**
	 * @return the puntosPorPartido
	 */
	public double getPuntosPorPartido() {
		return puntosPorPartido;
	}

	/**
	 * @param puntosPorPartido the puntosPorPartido to set
	 */
	public void setPuntosPorPartido(double puntosPorPartido) {
		this.puntosPorPartido = puntosPorPartido;
	}

	/**
	 * @return the asistenciasPorPartido
	 */
	public double getAsistenciasPorPartido() {
		return asistenciasPorPartido;
	}

	/**
	 * @param asistenciasPorPartido the asistenciasPorPartido to set
	 */
	public void setAsistenciasPorPartido(double asistenciasPorPartido) {
		this.asistenciasPorPartido = asistenciasPorPartido;
	}

	/**
	 * @return the taponesPorPartido
	 */
	public double getTaponesPorPartido() {
		return taponesPorPartido;
	}

	/**
	 * @param taponesPorPartido the taponesPorPartido to set
	 */
	public void setTaponesPorPartido(double taponesPorPartido) {
		this.taponesPorPartido = taponesPorPartido;
	}

	/**
	 * @return the rebotesPorPartido
	 */
	public double getRebotesPorPartido() {
		return rebotesPorPartido;
	}

	/**
	 * @param rebotesPorPartido the rebotesPorPartido to set
	 */
	public void setRebotesPorPartido(double rebotesPorPartido) {
		this.rebotesPorPartido = rebotesPorPartido;
	}

	@Override
	public String toString() {
		return "Estadistica [temporada=" + temporada + ", jugador=" + nombreJugador + ", puntosPorPartido=" + puntosPorPartido
				+ ", asistenciasPorPartido=" + asistenciasPorPartido + ", taponesPorPartido=" + taponesPorPartido
				+ ", rebotesPorPartido=" + rebotesPorPartido + "]";
	}
	
	
}
