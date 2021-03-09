import Entity.Cat;
import Entity.Dog;
import Entity.Pet;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

public class RetrieveFromDB {

    private String url = "jdbc:postgresql://localhost/vetDB";

    Properties props;

    public RetrieveFromDB() {
        this.props = new Properties();
        props.setProperty("user", "consumer");
        props.setProperty("password", "1234");
    }

    public List<Pet> getPets() throws SQLException {
        List<Pet> pets = new ArrayList<>();
        try (Connection conn = DriverManager.getConnection(url, props)) {
            String sql = "SELECT * FROM  pets;";
            PreparedStatement statement = conn.prepareStatement(sql);
            try (ResultSet result = statement.executeQuery()) {
                while (result.next()) {
                    int id = result.getInt(1);
                    String name = result.getString(2);
                    int age = result.getInt(3);
                    String vet_cvr = result.getString(4);
                    int lifeCount = result.getInt(5);
                    String barkpitch = result.getString(6);
                    if (lifeCount != 0) {
                        Cat cat = new Cat(id, name, age, vet_cvr, lifeCount);
                        pets.add(cat);
                    } else if (barkpitch != null) {
                        Dog dog = new Dog(id, name, age, vet_cvr, barkpitch);
                        pets.add(dog);
                    } else {
                        Pet pet = new Pet(id, name, age, vet_cvr);
                        pets.add(pet);
                    }
                }
            }
        }
        return pets;
    }

    public void insertCat(String name, int age, int life_count, String vet_cvr) throws SQLException {
        try (Connection conn = DriverManager.getConnection(url, props)) {
            String sql = String.format("call create_cat('%s', %s, %s, '%s');", name, age, life_count, vet_cvr);
            Statement statement = conn.createStatement();
            statement.executeUpdate(sql);
        }
    }

    public void insertDog(String name, int age, String barkpitch, String vet_cvr) throws SQLException {
        try (Connection conn = DriverManager.getConnection(url, props)) {
            String sql = String.format("call create_dog('%s', %s, '%s', '%s');", name, age, barkpitch, vet_cvr);
            Statement statement = conn.createStatement();
            statement.executeUpdate(sql);
        }
    }

}
