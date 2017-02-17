package savagerifts.security;

import org.apache.tomcat.jdbc.pool.DataSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.config.annotation.web.servlet.configuration.EnableWebMvcSecurity;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.provisioning.JdbcUserDetailsManager;

@Configuration
@EnableWebMvcSecurity
@EnableGlobalMethodSecurity(prePostEnabled = true)
public class SecurityConfig extends WebSecurityConfigurerAdapter {

	@Autowired
	private DataSource datasource;

	@Autowired
	private PasswordEncoder passwordEncoder;
	
	@Override
	protected void configure(HttpSecurity http) throws Exception {
		http
			.authorizeRequests()
				.antMatchers("/css/**", "/images/**", "/js/**", "/pages/**", "/index", "/").permitAll()
//				.antMatchers("/user/**").hasRole("USER")
			.and()
			.formLogin()
				.loginPage("/login").failureUrl("/login-error");	
	}

	@Autowired
	public void configureGlobal(AuthenticationManagerBuilder auth) throws Exception {
		// auth.inMemoryAuthentication()
				// .withUser("user").password("password").roles("USER");
		
		JdbcUserDetailsManager userDetailsService = new JdbcUserDetailsManager();
        userDetailsService.setDataSource(datasource);
        // PasswordEncoder encoder = new BCryptPasswordEncoder();
        auth.userDetailsService(userDetailsService).passwordEncoder(passwordEncoder);
        auth.jdbcAuthentication().dataSource(datasource);
 
        // if(!userDetailsService.userExists("user")) {
            // List<GrantedAuthority> authorities = new ArrayList<GrantedAuthority>();
            // authorities.add(new SimpleGrantedAuthority("USER"));
            // User userDetails = new User("user", encoder.encode("password"), authorities);
 
            // userDetailsService.createUser(userDetails);
        // }
				
	}
}