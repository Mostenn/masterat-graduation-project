package com.sgatman.taskManager.security;

import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.web.authentication.WebAuthenticationDetailsSource;
import org.springframework.util.StringUtils;
import org.springframework.web.filter.OncePerRequestFilter;

import java.io.IOException;

import javax.annotation.Resource;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class JwtAuthenticationFilter extends OncePerRequestFilter {

  @Resource
  private JwtProvider jwtProvider;

  @Resource
  private UserDetailsService userDetailsService;

  @Override
  protected void doFilterInternal(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse,
                                  FilterChain filterChain) throws ServletException, IOException {
    String jwt = getJwtFromRequest(httpServletRequest);

    if (StringUtils.hasText(jwt) && jwtProvider.validateToken(jwt)) {
      String username = jwtProvider.getUsernameFromJWT(jwt);

      UserDetails userDetails = userDetailsService.loadUserByUsername(username);
      UsernamePasswordAuthenticationToken authenticationToken = new UsernamePasswordAuthenticationToken(userDetails,
                                                                                                        null, userDetails.getAuthorities());
      authenticationToken.setDetails(new WebAuthenticationDetailsSource().buildDetails(httpServletRequest));

      SecurityContextHolder.getContext().setAuthentication(authenticationToken);
    }

    filterChain.doFilter(httpServletRequest, httpServletResponse);
  }

  private String getJwtFromRequest(HttpServletRequest request) {
    String bearerToken = request.getHeader("Authorization");
    if (StringUtils.hasText(bearerToken) && bearerToken.startsWith("Bearer ")) {
      return bearerToken.substring(7);
    }
    return bearerToken;
  }
}
