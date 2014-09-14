/*
 * JBILLING CONFIDENTIAL
 * _____________________
 *
 * [2003] - [2012] Enterprise jBilling Software Ltd.
 * All Rights Reserved.
 *
 * NOTICE:  All information contained herein is, and remains
 * the property of Enterprise jBilling Software.
 * The intellectual and technical concepts contained
 * herein are proprietary to Enterprise jBilling Software
 * and are protected by trade secret or copyright law.
 * Dissemination of this information or reproduction of this material
 * is strictly forbidden.
 */

package com.sapienter.jbilling.client.authentication;

import com.sapienter.jbilling.server.user.db.UserDTO;
import org.codehaus.groovy.grails.plugins.springsecurity.GrailsUser;
import org.springframework.security.core.GrantedAuthority;

import java.util.Collection;
import java.util.Locale;

/**
 * A spring security {@link org.springframework.security.core.userdetails.UserDetails}
 * implementation that includes the users company id.
 *
 * The UserDetailsService expects to encounter usernames that also include a company ID token. This
 * class maintains the username in this format. Do not change this behaviour as it will break "remember me"
 * and other advanced security features that use the UserDetailsService!
 *
 * @author Brian Cowdery
 * @since 04-10-2010
 */
public class CompanyUserDetails extends GrailsUser {

    private final UserDTO user;
    private final Locale locale;
    private final Integer mainRoleId;
    private final Integer companyId;
    private final Integer currencyId;
    private final Integer languageId;

    public CompanyUserDetails(String username, String password, boolean enabled, boolean accountNonExpired,
                              boolean credentialsNonExpired, boolean accountNonLocked,
                              Collection<GrantedAuthority> authorities,
                              UserDTO user, Locale locale,
                              Integer id, Integer mainRoleId, Integer companyId, Integer currencyId, Integer languageId) {

        super(username, password, enabled, accountNonExpired, credentialsNonExpired, accountNonLocked, authorities, id);

        this.user = user;
        this.locale = locale;
        this.mainRoleId = mainRoleId;
        this.companyId = companyId;
        this.currencyId = currencyId;
        this.languageId = languageId;
    }

    /**
     * Returns the user.
     *
     * @return user
     */
    public UserDTO getUser() {
        return user;
    }

    /**
     * Returns the username without the company ID token.
     *
     * This class must store the company ID with the username when returned from
     * {@link #getUsername()} for "remember me" and other advanced security features
     * to work with our implementation of the UserDetailsService.
     * 
     * @return raw username
     */
    public String getPlainUsername() {
        return user.getUserName();
    }
    
    /**
     * Returns the users {@link Locale} according to their language and/or country code.
     *
     * @see com.sapienter.jbilling.server.user.UserBL#getLocale() 
     * @return user locale
     */
    public Locale getLocale() {
        return locale;
    }

    /**
     * Returns the users main role ID.
     *
     * @return main role id
     */
    public Integer getMainRoleId() {
        return mainRoleId;
    }

    /**
     * Returns the user ID as an Integer. This is the same as calling {@link #getId()}.
     * 
     * @return user ID
     */
    public Integer getUserId() {
        return (Integer) getId();
    }

    /**
     * Returns the users company ID.
     *
     * @return user company ID
     */
    public Integer getCompanyId() {
        return companyId;
    }

    /**
     * Returns the users currency ID.
     *
     * @return user currency ID
     */
    public Integer getCurrencyId() {
        return currencyId;
    }

    /**
     * Returns the users language ID.
     *
     * @return user language ID
     */
    public Integer getLanguageId() {
        return languageId;
    }

    @Override
    public String toString() {
        final StringBuilder sb = new StringBuilder();
        sb.append("CompanyUserDetails");
        sb.append("{id=").append(getId());
        sb.append(", username=").append("'").append(getUsername()).append("'");
        sb.append(", mainRoleId=").append(getMainRoleId());
        sb.append(", companyId=").append(getCompanyId());
        sb.append(", currencyId=").append(getCurrencyId());
        sb.append(", languageId=").append(getLanguageId());
        sb.append(", enabled=").append(isEnabled());
        sb.append(", accountExpired=").append(!isAccountNonExpired());  
        sb.append(", credentialsExpired=").append(!isCredentialsNonExpired());
        sb.append(", accountLocked=").append(!isAccountNonLocked());
        sb.append('}');
        return sb.toString();
    }
}
