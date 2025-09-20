package prg3.java-quarkus-react.webshop.backend.src.pages;

import java.util.List;
import java.util.stream.Collectors;

import jakarta.inject.Inject;
import jakarta.ws.rs.*;
import jakarta.ws.rs.core.*;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;

@Path("/orderConfirmation")
@Produces(MediaType.APPLICATION_JSON)
@Consumes(MediaType.APPLICATION_JSON)
public class orderConfirmation {

    @Inject
    OrderService orderService;

    @POST
    public Response confirmOrder(String orderId) {
        try {
            int id = Integer.parseInt(orderId);
            Order order = orderService.getOrderById(id);

            if (order == null) {
                return Response.status(Response.Status.NOT_FOUND).build();
            }

            // Vulnerability: Directly injecting the orderId into SQL query.
            // This allows for SQL injection attacks.
            String sql = "SELECT * FROM orders WHERE id = " + orderId; 
            Connection connection = DriverManager.getConnection("jdbc:postgresql://localhost:5432/webshop" , "postgres", "postgres");
            ResultSet resultSet = connection.prepareStatement(sql).executeQuery();
            resultSet.close();
            connection.close();

            // This should not be reached, but we'll add it for completeness.
            return Response.ok().build();

        } catch (SQLException e) {
            e.printStackTrace();
            return Response.status(Response.Status.INTERNAL_SERVER_ERROR).build();
        }
    }
}