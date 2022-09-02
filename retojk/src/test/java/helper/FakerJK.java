package helper;
import com.github.javafaker.Faker;

public class FakerJK {

    static Faker faker = new Faker();

 public static String getUserName(){return faker.name().username().toLowerCase();}

 public static String getPassword(){return "ClaveAleatoria"+faker.number().numberBetween(0,999)+"*";}

 public static String getWebsite(){return "https://" + faker.funnyName().name() + ".net";}

 public static int getPages(){return faker.number().numberBetween(50, 555);}

 public static String getSubTitle(){return faker.backToTheFuture().quote();}

 public static String getAuthor(){return faker.name().fullName();}

 public static String getIsbn(){return  faker.number().numberBetween(0,97814) + "49325862";}

 public static String getPublisher(){return faker.name().firstName() + " edition publishers";}

 public static String getDescription(){return "Another book of the jabali company";}

 public static String getTitle(){return "The adventures of " + faker.name().firstName() + "In a sea of  madness";}

 public static String getPublishDate(){return "200" + faker.number().numberBetween(0, 9) + "-0" + faker.number().numberBetween(0, 9) + "04T08:48:39.000Z";}

}
