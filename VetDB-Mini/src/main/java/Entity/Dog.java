package Entity;

public class Dog extends Pet {

    private String barkpitch;

    public Dog(int id, String name, int age, String vet_cvr, String barkpitch) {
        super(id, name, age, vet_cvr);
        this.barkpitch = barkpitch;
    }

    public String getBarkpitch() {
        return barkpitch;
    }

    public void setBarkpitch(String barkpitch) {
        this.barkpitch = barkpitch;
    }
}
