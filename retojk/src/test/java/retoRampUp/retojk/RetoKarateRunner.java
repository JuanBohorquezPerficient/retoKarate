package retoRampUp.retojk;

import com.intuit.karate.junit5.Karate;

class RetoKarateRunner {
    
    @Karate.Test
    Karate testUsers() {
        return Karate.run("reto_karate").relativeTo(getClass());
    }    

}
