/* 
	T�tulo: 			ASTUTO. Aplicaci�n web para solicitar tutor�as online.
	Alumnas: 			Vanesa Gonz�lez P�rez, Ingenier�a T�cnica en Inform�tica de Gesti�n.
			 			Mar�a Josefa Aldea Palacios,Ingenier�a T�cnica en Inform�tica de Gesti�n.
	Director:			Dr. Jos� Ra�l Romero Salguero.
	Fecha creaci�n:		
	�ltima modificaci�n:
	Historial:
		v1.0 Inicial
*/
package uco.interfaz;
import java.util.*;
public class UsuarioBean {
	
	    Vector <Integer> id = new Vector <Integer>();
		Vector <String> login = new Vector <String>();
		Vector <Integer> rol = new Vector <Integer>();
		Vector <String> contrasena = new Vector <String>();
        int contador;

        public void setId(Integer valor, int i){
			id.insertElementAt(valor,i);
		}

		public Integer getid(int i){
			return id.elementAt(i);
		}
        
        public void setLogin(String valor, int i){
			login.insertElementAt(valor,i);
		}

		public String getLogin(int i){
			return login.elementAt(i);
		}

		public void setContrasena(String valor, int i){
			contrasena.insertElementAt(valor,i);
		}

		public String getContrasena(int i){
			return contrasena.elementAt(i);
		}

		public void setRol(Integer valor, int i){
			rol.insertElementAt(valor,i);
		}

		public Integer getRol(int i){
			return rol.elementAt(i);
		}
		public void setContador(int valor){
			this.contador = valor;
		}

		public int getContador(){
			return this.contador;
		}

		
	}


