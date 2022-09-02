package retoUI;

import com.intuit.karate.junit5.Karate;

public class RetoUI {
    @Karate.Test
    Karate testUI() {
        return Karate.run("reto-ui").relativeTo(getClass());
    }

}
