import Entity.Pet;

import java.util.List;
import java.util.Properties;

public class Main {

    public static void main(String[] args)throws Exception {
        RetrieveFromDB db = new RetrieveFromDB();
        //change the parameters of the methods to insert a new dog/cat, and run getPets() to see all pets
        db.insertCat("testCat1",5,7,"12345678");
        db.insertDog("testDog1",5,"b4","12345678");
        List<Pet> pets = db.getPets();
        for (Pet pet : pets) {
            System.out.println(pet.getClass());
            System.out.println(pet.getName());
            System.out.println();
        }
    }

}
