package test;
import java.sql.Connection;
import java.sql.DriverManager;
import org.junit.Test;








public class test {
	private static final String DRIVER = "com.mysql.jdbc.Driver";
	private static final String URL = "jdbc:mysql://localhost:3306/test";
	private static final String USER ="root";
	private static final String PW = "1111";

	

	@Test
	public void testConnection() throws Exception{
		Class.forName(DRIVER);
		try (Connection con = DriverManager.getConnection(URL, USER, PW))	{
			System.out.println(con);

		}catch(Exception e){
			System.err.println(e);
		}

	}

}
