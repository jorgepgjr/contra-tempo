package br.com.contratempo.entity;

import javax.persistence.Entity;
import javax.persistence.Id;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.security.core.GrantedAuthority;

@Entity
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Role implements GrantedAuthority {

    private static final long serialVersionUID = -5638759441805448853L;
    public static final Role ROLE_ADMIN = new Role("ROLE_ADMIN");
    public static final Role ROLE_SECRETARIA = new Role("ROLE_SECRETARIA");

    @Id
    private String name;

    @Override
    public String getAuthority() {
        return name;
    }
}
