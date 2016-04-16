package io.github.hackarejo.equipe9.model;

import com.google.gson.annotations.Expose;

import java.io.Serializable;
import java.io.SerializablePermission;

import lombok.Getter;
import lombok.Setter;

/**
 * Created by paulosilvestre on 16/04/16.
 */
public class Client implements Serializable {

@Getter
@Setter
@Expose
private int id;

@Getter
@Setter
@Expose
private String name;

@Getter
@Setter
@Expose
private String cpf;

@Getter
@Setter
@Expose
private String email;

@Getter
@Setter
@Expose
private String password;

@Getter
@Setter
@Expose
private String status;


}
