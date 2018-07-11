import java.util.ArrayList;
import java.util.Collection;
class PizzaBuilderPattern {
  public static void main(String[] args) {
    System.out.println("Pizza builder test");

    final Pizza pizza = new PizzaBuilder()
        .withExtraCheese(true)
        .withSauce("marinara")
        .withCrust("pan")
        .withToppings(new ArrayList<String>())
        .build();

    System.out.println(pizza.toString());
  }
}

class Pizza {
  private Collection<String> toppings;
  private String sauce;
  private boolean hasExtraCheese;
  private String crust; // OH NO, NEW THING I DIDN'T PLAN FOR!!! WE'RE DOOMED!

  public void setToppings(Collection<String> toppings) {
    this.toppings = toppings;
  }

  public void setSauce(String sauce) {
    this.sauce = sauce;
  }

  public void setHasExtraCheese(boolean hasExtraCheese) {
    this.hasExtraCheese = hasExtraCheese;
  }

  public void setCrust(String crust) {
    this.crust = crust;
  }

  @java.lang.Override public java.lang.String toString() {
    return "Pizza{" +
        "toppings=" + toppings +
        ", sauce='" + sauce + '\'' +
        ", hasExtraCheese=" + hasExtraCheese +
        ", crust='" + crust + '\'' +
        '}';
  }
}

class PizzaBuilder {
  private Collection<String> toppings;
  private String sauce;
  private boolean hasExtraCheese;
  private String crust;

  // .. create a "with" method for each member you want to set
  public PizzaBuilder withToppings(Collection<String> toppings) {
    this.toppings = toppings;
    return PizzaBuilder.this;
  }

  public PizzaBuilder withExtraCheese(boolean hasExtraCheese) {
    this.hasExtraCheese = hasExtraCheese;
    return this;
q
  }

  public PizzaBuilder withSauce(String sauce) {
    this.sauce = sauce;
    return this;
  }

  public PizzaBuilder withCrust(String crust) {
    this.crust = crust;
    return this;
  }

  public PizzaBuilder withToppings(ArrayList<String> toppings) {
    this.toppings = toppings;
    return this;
  }

  public Pizza build() {
    final Pizza pizza = new Pizza();
    pizza.setCrust(this.crust);
    pizza.setHasExtraCheese(this.hasExtraCheese);
    pizza.setSauce(this.sauce);
    pizza.setToppings(this.toppings);
    return pizza;
  }
}