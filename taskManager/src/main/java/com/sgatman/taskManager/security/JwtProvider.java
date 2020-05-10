package com.sgatman.taskManager.security;

import com.sgatman.taskManager.exception.TaskException;

import io.jsonwebtoken.Claims;
import io.jsonwebtoken.Jwts;

import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Service;

import java.io.IOException;
import java.io.InputStream;
import java.security.KeyStore;
import java.security.KeyStoreException;
import java.security.NoSuchAlgorithmException;
import java.security.PrivateKey;
import java.security.PublicKey;
import java.security.UnrecoverableKeyException;
import java.security.cert.CertificateException;

import javax.annotation.PostConstruct;


@Service
public class JwtProvider {

  private KeyStore keyStore;

  @PostConstruct
  public void init() {
    try {
      keyStore = KeyStore.getInstance("JKS");
      InputStream resourceAsStream = getClass().getResourceAsStream("/taskManager.jks");
      keyStore.load(resourceAsStream, "secret".toCharArray());
    } catch (KeyStoreException | CertificateException | NoSuchAlgorithmException | IOException e) {
      throw new TaskException("Exception occurred while loading keystore");
    }
  }

  public String generateToken(Authentication authentication) {
    User principal = (User) authentication.getPrincipal();
    return Jwts.builder()
        .setSubject(principal.getUsername())
        .signWith(getPrivateKey())
        .compact();
  }


  private PrivateKey getPrivateKey() {
    try {
      return (PrivateKey) keyStore.getKey("taskManager", "secret".toCharArray());
    } catch (KeyStoreException | NoSuchAlgorithmException | UnrecoverableKeyException e) {
      throw new TaskException("Exception occurred while retrieving public key from keystore");
    }
  }

  public boolean validateToken(String jwt) {
    Jwts.parser().setSigningKey(getPrivateKey()).parseClaimsJws(jwt);
    return true;
  }

  private PublicKey getPublicKey() {
    try {
      return keyStore.getCertificate("taskManager").getPublicKey();
    } catch (KeyStoreException e) {
      throw new TaskException("Exception occurred while retrieving public key from keystore");
    }
  }

  public String getUsernameFromJWT(String token) {
    Claims claims = Jwts.parser()
        .setSigningKey(getPublicKey())
        .parseClaimsJws(token)
        .getBody();
    return claims.getSubject();
  }

}
