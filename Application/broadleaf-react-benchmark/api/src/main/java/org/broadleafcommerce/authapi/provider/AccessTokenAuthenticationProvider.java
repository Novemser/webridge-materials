/*
 * #%L
 * React API Starter
 * %%
 * Copyright (C) 2009 - 2022 Broadleaf Commerce
 * %%
 * Broadleaf Commerce React Starter
 * 
 * Written in 2017 by Broadleaf Commerce info@broadleafcommerce.com
 * 
 * To the extent possible under law, the author(s) have dedicated all copyright and related and neighboring rights to this software to the public domain worldwide. This software is distributed without any warranty.
 * You should have received a copy of the CC0 Public Domain Dedication along with this software. If not, see <http://creativecommons.org/publicdomain/zero/1.0/>.
 * 
 * Please Note - The scope of CC0 Public Domain Dedication extends to Broadleaf Commerce React Starter demo application alone. Linked libraries (including all Broadleaf Commerce Framework libraries) are subject to their respective licenses, including the requirements and restrictions specified therein.
 * #L%
 */
//
// Source code recreated from a .class file by IntelliJ IDEA
// (powered by FernFlower decompiler)
//

package org.broadleafcommerce.authapi.provider;

import java.util.List;

import webridge.storedprocedure.invocation.SPInvokeManager;
import org.broadleafcommerce.authapi.domain.AccessTokenAuthentication;
import org.broadleafcommerce.authapi.domain.ApiUserDTO;
import org.broadleafcommerce.authapi.service.AuthenticationTokenService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationServiceException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.authentication.dao.AbstractUserDetailsAuthenticationProvider;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.AuthorityUtils;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.stereotype.Service;

@Service("blAccessTokenAuthenticationProvider")
public class AccessTokenAuthenticationProvider extends AbstractUserDetailsAuthenticationProvider {
    protected final AuthenticationTokenService authenticationTokenService;
    protected final UserDetailsService userDetailsService;

    @Autowired
    public AccessTokenAuthenticationProvider(AuthenticationTokenService authenticationTokenService, UserDetailsService userDetailsService) {
        this.authenticationTokenService = authenticationTokenService;
        this.userDetailsService = userDetailsService;
    }

    public boolean supports(Class<?> authentication) {
        return AccessTokenAuthentication.class.isAssignableFrom(authentication);
    }

    protected void additionalAuthenticationChecks(UserDetails userDetails, UsernamePasswordAuthenticationToken authentication) throws AuthenticationException {
    }

    protected Authentication createSuccessAuthentication(Object principal, Authentication authentication, UserDetails user) {
        AccessTokenAuthentication accessTokenAuthentication = (AccessTokenAuthentication)authentication;
        AccessTokenAuthentication result = new AccessTokenAuthentication(principal, authentication.getCredentials(), user.getAuthorities(), accessTokenAuthentication.getToken());
        result.setDetails(authentication.getDetails());
        return result;
    }

    protected UserDetails retrieveUser(String username, UsernamePasswordAuthenticationToken authentication) throws AuthenticationException {
        AccessTokenAuthentication accessTokenAuthentication = (AccessTokenAuthentication)authentication;
        String token = accessTokenAuthentication.getToken();
        ApiUserDTO dto = this.authenticationTokenService.parseAccessToken(token);
        if (dto == null) {
            throw new AuthenticationServiceException("INVALID_ACCESS_TOKEN");
        } else if (dto.isCrossAppAuth()) {
            List<GrantedAuthority> authorities = AuthorityUtils.commaSeparatedStringToAuthorityList(dto.getRole());
            return new User(String.valueOf(dto.getUserId()), "", true, true, true, true, authorities);
        } else {
            String uName = dto.getUsername();
            System.symbolize(uName, "user_name");
            return this.userDetailsService.loadUserByUsername(uName);
        }
    }
}
