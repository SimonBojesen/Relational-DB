import Entity.Pet;

import java.sql.*;
import java.util.List;
import java.util.Properties;

public class Main {

    public static void main(String[] args)throws Exception {
        RetrieveFromDB db = new RetrieveFromDB();
        List<Pet> pets = db.getPets();
        for (Pet pet : pets) {
            System.out.println(pet.getClass());
            System.out.println(pet.getName());
            System.out.println();
        }
    }

}
