package FIFA22;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

public class BDController {
	private Connection conexion;

	public BDController() {
		super();
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		try {
			this.conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/fifa", "root", "");
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("Error en la conexión del constructor vacío");
		}
	}

	public void altaJugador(Jugador jugador) {
		try {
			Statement miStatement = this.conexion.createStatement();
			String cadena = "insert into jugadores values (" + jugador.getCod_jugador() + ",'" + jugador.getNombre()
					+ "'," + jugador.getCod_equipo() + ",'" + jugador.getPierna() + "'," + jugador.getAltura() + ",'"
					+ jugador.getPais() + "')";
			miStatement.executeUpdate(cadena);
			miStatement.close();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("Error en alta en BDController");

		}
	}

	public void bajaJugador(int cod) {
		try {
			Statement miStatement = this.conexion.createStatement();
			String cadena = "delete from jugadores where cod_jugador = " + cod ;
			miStatement.executeUpdate(cadena);
			miStatement.close();
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("Error bdcontroller eliminar ");
		}
	}

	public int dameUltimoCodigoJugador() {
		int cod = 0;
		try {
			Statement miStatement = this.conexion.createStatement();
			ResultSet rs = miStatement.executeQuery("Select MAX(cod_jugador) from jugadores");
			if (rs.next()) {
				cod = rs.getInt("MAX(cod_jugador)");
			}
			miStatement.close();
			rs.close();
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("Fallo en DameEquipo en BDController");
		}

		return cod;

	}

	public Equipo dameEquipo(int cod_equipo) {
		Equipo equipo = new Equipo();
		try {
			Statement miStatement = this.conexion.createStatement();
			ResultSet rs = miStatement.executeQuery("Select * from equipos where cod_equipo like '" + cod_equipo + "'");
			if (rs.next()) {
				equipo = new Equipo(rs.getInt("cod_equipo"), rs.getString("nombre"), rs.getInt("cod_liga"));
			}
			miStatement.close();
			rs.close();
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("Fallo en DameEquipo en BDController");
		}

		return equipo;

	}
	
	public void bajaEquipo(int cod) {
		try {
			Statement miStatement = this.conexion.createStatement();
			String cadena = "delete from equipos where cod_equipo = " + cod ;
			miStatement.executeUpdate(cadena);
			miStatement.close();
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("Error bdcontroller eliminarEquipo ");
		}
	}
	
	public int dameUltimoCodigoEquipo() {
		int cod = 0;
		try {
			Statement miStatement = this.conexion.createStatement();
			ResultSet rs = miStatement.executeQuery("Select MAX(cod_equipo) from equipos");
			if (rs.next()) {
				cod = rs.getInt("MAX(cod_equipo)");
			}
			miStatement.close();
			rs.close();
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("Fallo en dameUltimoCodigoEquipo en BDController");
		}

		return cod;

	}

	public ArrayList<Equipo> dameEquiposLIga(int cod_Liga) {
		ArrayList<Equipo> equipos = new ArrayList<Equipo>();

		try {
			Statement miStatement = this.conexion.createStatement();
			ResultSet rs = miStatement.executeQuery("Select * from equipos where cod_liga like '" + cod_Liga + "'");
			while (rs.next()) {
				equipos.add(new Equipo(rs.getInt("cod_equipo"), rs.getString("nombre"), rs.getInt("cod_liga")));
			}
			miStatement.close();
			rs.close();
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("Fallo en DameEquipo en BDController");
		}

		return equipos;

	}

	public boolean existeEquipo(int cod_equipo) {
		boolean encontrado = false;
		try {
			Statement miStatement = this.conexion.createStatement();
			ResultSet rs = miStatement.executeQuery("Select * from equipos where cod_equipo like '" + cod_equipo + "'");
			if (rs.next()) {
				encontrado = true;
			}
			miStatement.close();
			rs.close();
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("Fallo en existeEquipo en BDController");
		}

		return encontrado;

	}
	
	public void modificarEquipo(Equipo equipo){
        try {
            Statement miStatement = this.conexion.createStatement();
            String cadena = "UPDATE equipos SET nombre='"+equipo.getNombre()+ "', cod_liga='"+equipo.getCod_liga()+"' where cod_equipo="+equipo.getCod_equipo()+";";
            System.out.println(cadena);
            int rs = miStatement.executeUpdate(cadena);
            miStatement.close();
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }

	public ArrayList<Equipo> todosEquipos() {
		Equipo equipo = new Equipo();
		ArrayList<Equipo> equipos = new ArrayList<Equipo>();
		try {
			Statement miStatement = this.conexion.createStatement();
			ResultSet rs = miStatement.executeQuery("Select * from equipos;");
			while (rs.next()) {
				equipo = new Equipo(rs.getInt("cod_equipo"), rs.getString("nombre"), rs.getInt("cod_liga"));
				equipos.add(equipo);
			}
			miStatement.close();
			rs.close();
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("Fallo en todosEquipos en BDController");
		}

		return equipos;

	}
	
	
	public void altaEquipo(Equipo equipo) {
		try {
			Statement miStatement = this.conexion.createStatement();
			String cadena = "insert into equipos values (" + equipo.getCod_equipo() + ",'" + equipo.getNombre() + "'," + equipo.getCod_liga() + ")";
			miStatement.executeUpdate(cadena);
			miStatement.close();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("Error en altaEquipo en BDController");

		}
	}

	public Jugador dameJugador(int cod_jugador) {
		Jugador jugador = new Jugador();
		try {
			Statement miStatement = this.conexion.createStatement();
			ResultSet rs = miStatement
					.executeQuery("Select * from jugadores where cod_jugador like '" + cod_jugador + "'");
			if (rs.next()) {
				jugador = new Jugador(rs.getInt("cod_jugador"), rs.getString("nombre"), rs.getInt("cod_equipo"),
						rs.getString("pierna"), rs.getInt("altura"), rs.getString("pais"));
			}
			miStatement.close();
			rs.close();
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("Fallo en dameJugador en BDController");
		}

		return jugador;

	}

	public boolean existeJugador(int cod_jugador) {
		boolean encontrado = false;
		try {
			Statement miStatement = this.conexion.createStatement();
			ResultSet rs = miStatement
					.executeQuery("Select * from jugadores where cod_jugador like '" + cod_jugador + "'");
			if (rs.next()) {
				encontrado = true;
			}
			miStatement.close();
			rs.close();
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("Fallo en existeJugador en BDController");
		}

		return encontrado;

	}

	public ArrayList<Jugador> todosJugadores() {
		Jugador jugador = new Jugador();
		ArrayList<Jugador> jugadores = new ArrayList<Jugador>();
		try {
			Statement miStatement = this.conexion.createStatement();
			ResultSet rs = miStatement.executeQuery("Select * from jugadores;");
			while (rs.next()) {
				jugador = new Jugador(rs.getInt("cod_jugador"), rs.getString("nombre"), rs.getInt("cod_equipo"),
						rs.getString("pierna"), rs.getInt("altura"), rs.getString("pais"));
				jugadores.add(jugador);
			}
			miStatement.close();
			rs.close();
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("Fallo en todosJugadores en BDController");
		}

		return jugadores;

	}

	public ArrayList<Jugador> todosJugadoresEquipo(int cod_equipo) {
		Jugador jugador = new Jugador();
		ArrayList<Jugador> jugadores = new ArrayList<Jugador>();
		try {
			Statement miStatement = this.conexion.createStatement();
			ResultSet rs = miStatement.executeQuery("Select * from jugadores where cod_equipo = " + cod_equipo + ";");
			while (rs.next()) {
				jugador = new Jugador(rs.getInt("cod_jugador"), rs.getString("nombre"), rs.getInt("cod_equipo"),
						rs.getString("pierna"), rs.getInt("altura"), rs.getString("pais"));
				jugadores.add(jugador);
			}
			miStatement.close();
			rs.close();
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("Fallo en todosJugadores en BDController");
		}

		return jugadores;

	}
	
	public void modificarJugador(Jugador jugador){
        try {
            Statement miStatement = this.conexion.createStatement();
            String cadena = "UPDATE jugadores SET nombre='"+jugador.getNombre()+"', cod_equipo="+jugador.getCod_equipo()+
                    ", pierna='"+jugador.getPierna()+"', altura='"+jugador.getAltura()+
                    "', pais='"+jugador.getPais()+"' where cod_jugador="+jugador.getCod_jugador()+";";
            System.out.println(cadena);
            int rs = miStatement.executeUpdate(cadena);
            miStatement.close();
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }
	
	public Liga dameLiga(int cod_liga) {
		Liga liga = new Liga();
		try {
			Statement miStatement = this.conexion.createStatement();
			ResultSet rs = miStatement.executeQuery("Select * from ligas where cod_liga = " + cod_liga);
			if (rs.next()) {
				liga = new Liga(rs.getInt("cod_liga"), rs.getString("nombre"), rs.getString("pais"));
			}
			miStatement.close();
			rs.close();
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("Fallo en dameliga en BDController");
		}

		return liga;

	}
	
	public int dameUltimoCodigoLiga() {
		int cod = 0;
		try {
			Statement miStatement = this.conexion.createStatement();
			ResultSet rs = miStatement.executeQuery("Select MAX(cod_liga) from ligas");
			if (rs.next()) {
				cod = rs.getInt("MAX(cod_liga)");
			}
			miStatement.close();
			rs.close();
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("Fallo en dameUltimoCodigoLiga en BDController");
		}

		return cod;

	}
	
	public void bajaLiga(int cod) {
		try {
			Statement miStatement = this.conexion.createStatement();
			String cadena = "delete from ligas where cod_liga = " + cod ;
			miStatement.executeUpdate(cadena);
			miStatement.close();
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("Error bdcontroller eliminarLiga ");
		}
	}

	public boolean existeLiga(int cod_liga) {
		boolean encontrado = false;
		try {
			Statement miStatement = this.conexion.createStatement();
			ResultSet rs = miStatement.executeQuery("Select * from ligas where cod_liga like '" + cod_liga + "'");
			if (rs.next()) {
				encontrado = true;
			}
			miStatement.close();
			rs.close();
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("Fallo en existeLiga en BDController");
		}

		return encontrado;

	}

	public ArrayList<Liga> todasLigas() {
		ArrayList<Liga> ligas = new ArrayList<Liga>();
		try {
			Statement miStatement = this.conexion.createStatement();
			ResultSet rs = miStatement.executeQuery("Select * from ligas;");
			while (rs.next()) {
				Liga liga = new Liga(rs.getInt("cod_liga"), rs.getString("nombre"), rs.getString("pais"));
				ligas.add(liga);
				
			}

			miStatement.close();
			rs.close();
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("Fallo en dameliga en BDController");
		}

		return ligas;

	}
	
	
	public void altaLiga(Liga liga) {
		try {
			Statement miStatement = this.conexion.createStatement();
			String cadena = "insert into ligas values (" + liga.getCod_liga() + ",`" + liga.getNombre() +"`,`"+ liga.getPais() + "`)";
			miStatement.executeUpdate(cadena);
			miStatement.close();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("Error en altaLiga en BDController");

		}
	}
	
	public void modificarLiga(Liga liga){
        try {
            Statement miStatement = this.conexion.createStatement();
            String cadena = "UPDATE ligas SET nombre='"+liga.getNombre()+ "', pais='"+liga.getPais()+"' where cod_liga="+liga.getCod_liga()+";";
            System.out.println(cadena);
            int rs = miStatement.executeUpdate(cadena);
            miStatement.close();
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }

	public Carta dameCarta(int cod_jugador, String nombre_Carta) {
		Carta carta = new Carta();
		try {
			Statement miStatement = this.conexion.createStatement();
			ResultSet rs = miStatement.executeQuery("Select * from cartas where cod_jugador like '" + cod_jugador
					+ "' and nombre like '" + nombre_Carta + "'");
			if (rs.next()) {
				carta = new Carta(rs.getString("nombre"), rs.getInt("cod_jugador"), rs.getInt("rat"),
						rs.getString("pos"), rs.getInt("precio"), rs.getInt("pac"), rs.getInt("sho"), rs.getInt("pas"),
						rs.getInt("dri"), rs.getInt("def"), rs.getInt("phy"), rs.getInt("pierna_mala"),
						rs.getInt("filigranas"));
			}
			miStatement.close();
			rs.close();
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("Fallo en dameCarta en BDController");
		}

		return carta;

	}

	public Carta dameCartaSimple(int cod_jugador) {
		Carta carta = new Carta();
		try {
			Statement miStatement = this.conexion.createStatement();
			ResultSet rs = miStatement.executeQuery(
					"Select * from cartas where cod_jugador like '" + cod_jugador + "' and nombre like 'Simple'");
			if (rs.next()) {
				carta = new Carta(rs.getString("nombre"), rs.getInt("cod_jugador"), rs.getInt("rat"),
						rs.getString("pos"), rs.getInt("precio"), rs.getInt("pac"), rs.getInt("sho"), rs.getInt("pas"),
						rs.getInt("dri"), rs.getInt("def"), rs.getInt("phy"), rs.getInt("pierna_mala"),
						rs.getInt("filigranas"));
			}
			miStatement.close();
			rs.close();
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("Fallo en dameCarta en BDController");
		}

		return carta;

	}

	public int dameRatCarta(int cod_jugador, String nombre_carta) {
		int rat = 0;
		try {
			Statement miStatement = this.conexion.createStatement();

			ResultSet rs = miStatement.executeQuery("SELECT Rat FROM cartas WHERE cod_jugador='" + cod_jugador
					+ "' AND nombre='" + nombre_carta + "' ");

			if (rs.first() == true) {
				rat = rs.getInt(1);
			}
			miStatement.close();
			rs.close();

		} catch (SQLException e) {
			System.out.println("Error en dameRatCarta del BDController" + e.getMessage());
		}
		return rat;
	}

	public boolean existeCarta(int cod_jugador, String nombre_Carta) {
		boolean encontrado = false;
		try {
			Statement miStatement = this.conexion.createStatement();
			ResultSet rs = miStatement.executeQuery("Select * from cartas where cod_jugador like '" + cod_jugador
					+ "' and nombre like '" + nombre_Carta + "'");
			if (rs.next()) {
				encontrado = true;
			}
			miStatement.close();
			rs.close();
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("Fallo en existeCarta en BDController");
		}

		return encontrado;

	}

	public ArrayList<Carta> todasCartasJugador(int codJugador) {
		Carta carta = new Carta();
		ArrayList<Carta> cartas = new ArrayList<Carta>();
		try {
			Statement miStatement = this.conexion.createStatement();
			ResultSet rs = miStatement.executeQuery("Select * from cartas where cod_jugador =" + codJugador);
			while (rs.next()) {
				carta = new Carta(rs.getString("nombre"), rs.getInt("cod_jugador"), rs.getInt("rat"),
						rs.getString("pos"), rs.getInt("precio"), rs.getInt("pac"), rs.getInt("sho"), rs.getInt("pas"),
						rs.getInt("dri"), rs.getInt("def"), rs.getInt("phy"), rs.getInt("pierna_mala"),
						rs.getInt("filigranas"));
				cartas.add(carta);
			}
			miStatement.close();
			rs.close();
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("Fallo en todasCartasJugador en BDController");
		}

		return cartas;

	}

	public void altaPrueba() {

	}

	public ArrayList<Carta> todasCartas() {
		Carta carta = new Carta();
		ArrayList<Carta> cartas = new ArrayList<Carta>();
		try {
			Statement miStatement = this.conexion.createStatement();
			ResultSet rs = miStatement.executeQuery("Select * from cartas");
			while (rs.next()) {
				carta = new Carta(rs.getString("nombre"), rs.getInt("cod_jugador"), rs.getInt("rat"),
						rs.getString("pos"), rs.getInt("precio"), rs.getInt("pac"), rs.getInt("sho"), rs.getInt("pas"),
						rs.getInt("dri"), rs.getInt("def"), rs.getInt("phy"), rs.getInt("pierna_mala"),
						rs.getInt("filigranas"));
				cartas.add(carta);
			}
			miStatement.close();
			rs.close();
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("Fallo en todasCartas en BDController");
		}

		return cartas;

	}

}
