package it.univaq.mwt.fastmarket.common.spring;

import it.univaq.mwt.fastmarket.business.model.Role;
import it.univaq.mwt.fastmarket.business.model.User;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

public class UserDetailsImpl implements UserDetails {

	private User user;
	
	public UserDetailsImpl(User user) {
		super();
		this.user = user;
	}

	@Override
	public Collection<GrantedAuthority> getAuthorities() {
		List<GrantedAuthority> result = new ArrayList<GrantedAuthority>();
		for (Role role : user.getRoles()) {
			result.add(new GrantedAuthorityImpl(role.getName()));			
		}
		return result;
	}

	@Override
	public String getPassword() {
		return user.getPassword();
	}

	@Override
	public String getUsername() {
		return user.getUsername();
	}

	@Override
	public boolean isAccountNonExpired() {
		return true;
	}

	@Override
	public boolean isAccountNonLocked() {
		return true;
	}

	@Override
	public boolean isCredentialsNonExpired() {
		return true;
	}

	@Override
	public boolean isEnabled() {
		return true;
	}

	@Override
	public String toString() {
		return "UserDetailsImpl [username=" + user.getUsername() + "]";
	}
	
	public User getUser() {
		return user;
	}
	
}
