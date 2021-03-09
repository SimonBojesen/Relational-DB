package Entity;

public class Cat extends Pet {

    private int life_count;


    public Cat(int id, String name, int age, String vet_cvr, int life_count) {
        super(id, name, age, vet_cvr);
        this.life_count = life_count;
    }

    public int getLife_count() {
        return life_count;
    }
}
