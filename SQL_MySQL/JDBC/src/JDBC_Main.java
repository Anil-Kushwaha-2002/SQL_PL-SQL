import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

class JDBC_Main {

    static String jdbcUrl = "jdbc:mysql://localhost:3306/db1";
    static String username = "root";
    static String password = "Anil@2002";
    public static void main(String[] args) {
        // String jdbcUrl = "jdbc:mysql://localhost:3306/student";
        // String username = "root";
        // String password = "Anil@2002";

        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet resultSet = null;

        try {
            // Load and register JDBC driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Establish the connection
            connection = DriverManager.getConnection(jdbcUrl, username, password);
            System.out.println("Connection established!");

            // Create a SQL query
            String sql = "SELECT * FROM users";

            // Create a Statement
            statement = connection.prepareStatement(sql);

            // Execute the query
            resultSet = statement.executeQuery();

            // Process the result set
            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String name = resultSet.getString("name");
                String email = resultSet.getString("email");

                System.out.println("ID: " + id + ", Name: " + name + ", Email: " + email);
            }
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            // Close the ResultSet, Statement, and Connection
            try {
                if (resultSet != null) {
                    resultSet.close();
                }
                if (statement != null) {
                    statement.close();
                }
                if (connection != null) {
                    connection.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}