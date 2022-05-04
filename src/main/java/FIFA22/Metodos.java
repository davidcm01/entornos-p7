package FIFA22;

public class Metodos {

	public Metodos() {
		super();
	}
	
	public String claseColor(int media) {
		String clase="";
		
		if(media>0 && media<=49){
			clase = "cuadradito_rojo";
		}else if(media>49 && media<=69){
			clase = "cuadradito_naranja";
		}else if(media>69 && media<=79){
			clase = "cuadradito_amarillo";
		}else if(media>79 && media<=89){
			clase = "cuadradito_verde";
		}else if(media>89 && media<=99){
			clase = "cuadradito_verdeoscuro";
		}
		
		
		return clase;
		
	}
	
	public String colorStats(int media) {
		String color="";
		
		if(media>0 && media<=49){
			color = "#f44336";
		}else if(media>49 && media<=69){
			color = "#fb8c00";
		}else if(media>69 && media<=79){
			color = "#e9bc0b";
		}else if(media>79 && media<=89){
			color = "#4caf50";
		}else if(media>89 && media<=99){
			color = "#007e33";
		}
		
		
		return color;
		
	}
	
	
}
