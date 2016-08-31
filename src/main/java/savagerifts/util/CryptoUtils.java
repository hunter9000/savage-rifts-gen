package savagerifts.util;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;

public class CryptoUtils {

    /** Uncomment this to create an encrypted pw hash. run with the same classpath as the maven project to include
     *  the spring crypto packages. */
    public static void main(String... args) {
        PasswordEncoder encoder = new BCryptPasswordEncoder(10);
        System.out.println(encoder.encode("password"));
    }

}

