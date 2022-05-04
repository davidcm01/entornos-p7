import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

public class BDController {
	// Atributo para conectar con la base de datos. Importar siempre desde java.sql
	private Connection conexion;

	// Constructor vac�o que usamos para realizar la conexi�n
	public BDController() {
		super();
		try {
			this.conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/nba", "root", "");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("Error conexi�n del constructor vac�o del BDController");
		}
	}

	/**
	 * @return the conexion
	 */
	public Connection getConexion() {
		return conexion;
	}

	/**
	 * @param conexion the conexion to set
	 */
	public void setConexion(Connection conexion) {
		this.conexion = conexion;
	}

	// M�todos
	public boolean existeJugador(int codigo) {

		boolean existe = false;
		try {
			Statement miStatement = this.conexion.createStatement();
			ResultSet rs = miStatement.executeQuery("Select * from jugadores where codigo like '" + codigo + "'");
			if (rs.next() == true) {
				existe = true;
			}
			rs.close();
			miStatement.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("Error de consulta existe jugador en BDController");
		}
		return existe;
	}

	public Jugador dameJugador(int codigo) {

		Jugador jugador = new Jugador();
		try {
			Statement miStatement = this.conexion.createStatement();
			ResultSet rs = miStatement.executeQuery("Select * from jugadores where codigo like '" + codigo + "'");
			if (rs.next() == true) {
				jugador = new Jugador(rs.getInt("codigo"), rs.getString("Nombre"), rs.getString("Procedencia"),
						rs.getString("Altura"), rs.getInt("Peso"), rs.getString("Posicion"),
						rs.getString("Nombre_equipo"));
			}
			rs.close();
			miStatement.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("Error de consulta dame jugador en BDController");
		}
		return jugador;
	}

public Jugador dameJugadorNombre(String nombre ) {

		Jugador jugador = new Jugador();
		try {
			Statement miStatement = this.conexion.createStatement();
			ResultSet rs = miStatement.executeQuery("Select * from jugadores where nombre like '" + nombre + "'");
			if (rs.next() == true) {
				jugador = new Jugador(rs.getInt("codigo"), rs.getString("Nombre"), rs.getString("Procedencia"),
						rs.getString("Altura"), rs.getInt("Peso"), rs.getString("Posicion"),
						rs.getString("Nombre_equipo"));
			}
			rs.close();
			miStatement.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("Error de consulta dame jugador en BDController");
		}
		return jugador;
	}


	public int dameCodigoJugador(String nombre) {

		int codigo = 0;

		try {
			Statement miStatement = this.conexion.createStatement();
			ResultSet rs = miStatement.executeQuery("Select codigo from jugadores where nombre like '" + nombre + "'");
			if (rs.next() == true) {
				codigo = rs.getInt("codigo");
			}
			rs.close();
			miStatement.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("Error de consulta dame codigo jugador en BDController");
		}
		return codigo;
	}

	public String dameNombreJugador(int codigo) {

		String nombre = "";

		try {
			Statement miStatement = this.conexion.createStatement();
			ResultSet rs = miStatement.executeQuery("Select nombre from jugadores where codigo like '" + codigo + "'");
			if (rs.next() == true) {
				nombre = rs.getString("nombre");
			}
			rs.close();
			miStatement.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("Error de consulta dame codigo jugador en BDController");
		}
		return nombre;
	}

	public ArrayList<Jugador> todosJugadores() {

		ArrayList<Jugador> jugadores = new ArrayList<Jugador>();
		try {
			Statement miStatement = this.conexion.createStatement();
			ResultSet rs = miStatement.executeQuery("Select * from jugadores");
			while (rs.next() == true) {
				Jugador temp = new Jugador(rs.getInt("codigo"), rs.getString("Nombre"), rs.getString("Procedencia"),
						rs.getString("Altura"), rs.getInt("Peso"), rs.getString("Posicion"),
						rs.getString("Nombre_equipo"));
				jugadores.add(temp);
			}
			rs.close();
			miStatement.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("Error de consulta todos jugadores en BDController");
		}
		return jugadores;
	}

	public void altaJugador(int codigo, String nombre, String procedencia, String altura, int peso, String posicion,
			String nombreEquipo) {
		try {
			Statement miStatement = this.conexion.createStatement();
			String cadena = "Insert into jugadores (codigo, Nombre, Procedencia, Altura, Peso, Posicion, Nombre_equipo) "
					+ "values ('" + codigo + "','" + nombre + "','" + procedencia + "' ,'" + altura + "','" + peso
					+ "','" + posicion + "','" + nombreEquipo + "')";
			miStatement.executeUpdate(cadena);
			miStatement.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("Error en consulta insertar Jugador en BDController");
		}
	}

	public void eliminarJugador(int codigo) {

		try {
			Statement miStatement = this.conexion.createStatement();
			String cadena = "Delete from jugadores where codigo = " + codigo + "";
			miStatement.executeUpdate(cadena);
			miStatement.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("Error en consulta eliminar jugador en BDController");
		}
	}

	// Ejercicio1
	public String existeJugador280() {
		String confirmar = "";
		try {
			Statement miStatement = this.conexion.createStatement();
			ResultSet rs = miStatement.executeQuery("Select * from jugadores where Peso >280");
			if (rs.next() == true) {
				confirmar = "Si";
			} else {
				confirmar = "No";
			}
			rs.close();
			miStatement.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("Error de consulta existe jugador en BDController");
		}
		return confirmar;
	}

	// Ejercicio2
	public boolean existenM�s200Libras() {
		boolean existe = false;
		ArrayList<Jugador> jugadores = new ArrayList<Jugador>();
		try {
			Statement miStatement = this.conexion.createStatement();
			ResultSet rs = miStatement.executeQuery("Select * from jugadores where Peso >200");
			while (rs.next() == true) {
				Jugador temp = new Jugador(rs.getInt("codigo"), rs.getString("Nombre"), rs.getString("Procedencia"),
						rs.getString("Altura"), rs.getInt("Peso"), rs.getString("Posicion"),
						rs.getString("Nombre_equipo"));
				jugadores.add(temp);
				if (jugadores.size() > 3) {
					existe = true;
				}
			}
			rs.close();
			miStatement.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("Error de consulta existe jugador en BDController");
		}
		return existe;
	}

	// Ejercicio3
	public File ficherosJugadoresEquipo(String nombre) {
		String ruta = "Jugadores de un equipo.txt";
		File fichero = new File(ruta);
		String linea = "";
		ArrayList<Jugador> jugadores = new ArrayList<Jugador>();
		try {
			Statement miStatement = this.conexion.createStatement();
			ResultSet rs = miStatement
					.executeQuery("Select * from jugadores where Nombre_equipo like '" + nombre + "'");
			while (rs.next() == true) {
				Jugador temp = new Jugador(rs.getInt("codigo"), rs.getString("Nombre"), rs.getString("Procedencia"),
						rs.getString("Altura"), rs.getInt("Peso"), rs.getString("Posicion"),
						rs.getString("Nombre_equipo"));
				jugadores.add(temp);
			}
			rs.close();
			miStatement.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("Error de consulta fichero jugadores por equipo en BDController");
		}

		try {
			fichero.createNewFile();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		try {
			BufferedWriter bw = new BufferedWriter(new FileWriter(ruta, false));
			for (int i = 0; i < jugadores.size(); i++) {
				linea = jugadores.get(i).getNombre() + " - Procedencia: " + jugadores.get(i).getProcedencia()
						+ " - Altura: " + jugadores.get(i).getAltura() + " - Peso: "
						+ Integer.toString(jugadores.get(i).getPeso());
				bw.write(linea);
				bw.newLine();
			}
			bw.close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return fichero;
	}

	// Ejercicio4
	public boolean existenCuatroCiudadesCuatroEquipos() {
		boolean existir = false;
		ArrayList<Equipo> equipos = new ArrayList<Equipo>();
		try {
			Statement miStatement = this.conexion.createStatement();
			ResultSet rs = miStatement.executeQuery("Select * from equipos");
			while (rs.next() == true) {
				Equipo temp = new Equipo(rs.getString("Nombre"), rs.getString("Ciudad"), rs.getString("Conferencia"),
						rs.getString("Division"));
				equipos.add(temp);
			}
			rs.close();
			miStatement.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("Error de consulta existen equipos en ciudad en BDController");
		}
		int cont = 0;
		ArrayList<String> ciudades = new ArrayList<String>();
		for (int i = 0; i < equipos.size(); i++) {
			ciudades.add(equipos.get(i).getCiudad());
		}
		for (int i = 0; i < ciudades.size() - 1; i++) {
			for (int j = ciudades.size() - 1; j > i; j--) {
				if (ciudades.get(i).equalsIgnoreCase(ciudades.get(j))) {
					ciudades.remove(j);
				}
			}
		}
		for (int i = 0; i < equipos.size(); i++) {
			for (int j = 0; j < ciudades.size(); j++) {
				if (equipos.get(i).getCiudad().equalsIgnoreCase(ciudades.get(j))) {
					cont++;
				}
			}
		}
		if (cont > 3) {
			existir = true;
		}

		return existir;
	}

	// Ejercicio5
	public void bajaJugadorFichero(File fichero) {
		String linea = "";
		try {
			BufferedReader br = new BufferedReader(new FileReader(fichero.getName()));
			try {
				linea = br.readLine();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			while (linea != null) {
				String[] parts = linea.split("::");
				altaJugador(Integer.valueOf(parts[0]), parts[1], parts[2], parts[3], Integer.valueOf(parts[4]),
						parts[5], parts[6]);
				try {
					linea = br.readLine();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}

			}
			try {
				br.close();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}
}
