package org.example;

import java.sql.*;

import static java.sql.DriverManager.getConnection;
class App
{
    public static void main( String[] args ) {
//step 1--> Register the driver
        try {
            Class.forName("com.mysql.jdbc.Driver");

            // 2- Connection object
        Connection connection;
            connection = getConnection("jdbc:mysql://localhost:3306/sql_store", "root", "pass@word1");

        // 3- Statement object

            Statement statement = connection.createStatement();

       statement = connection.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);

       //menu available in selected restaurant
      ResultSet resultSet = statement.executeQuery("Select m.menu_Name, m.menu_Price \n" +
              "from sql_food_delivery.restaurants r join sql_food_delivery.menu m \n" +
              "on r.restaurant_Id = m.restaurant_Id\n" +
              "where restaurant_Name= 'Aaryas';");
      while(resultSet.next()) {
          System.out.println(resultSet.getString(1) + " ---> " + resultSet.getString(2));
      }
//order summary
            ResultSet resultSet1 = statement.executeQuery("select * from orders where customer_Id=1;");
            while(resultSet1.next()) {
                System.out.println(resultSet1.getInt(1) + " ---> " + resultSet1.getDate(5)+" --> "+resultSet1.getInt(6));
            }

//near by restaurants
            ResultSet nearbyRestaurant = statement.executeQuery("select * from sql_food_delivery.restaurants r \n" +
                    "join sql_food_delivery.customers c \n" +
                    "on r.restaurant_City = c.customer_city \n" +
                    "where  c.customer_name='Akhila';");
            while(nearbyRestaurant.next()){
                System.out.println(nearbyRestaurant.getString(2)+" "+nearbyRestaurant.getString(3)+" "+nearbyRestaurant.getString(4));
            }


            // 5- close connection
            connection.close();


        } catch (SQLException e) {
            throw new RuntimeException(e);
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
    }
}
