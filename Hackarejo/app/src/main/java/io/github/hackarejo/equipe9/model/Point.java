package io.github.hackarejo.equipe9.model;

import com.google.gson.annotations.Expose;

import java.io.Serializable;
import java.util.Date;

import lombok.Getter;
import lombok.Setter;

/**
 * Created by paulosilvestre on 16/04/16.
 */
public class Point implements Serializable {

    @Getter
    @Setter
    @Expose
    private int id;
    @Getter
    @Setter
    @Expose
    private Date dateGeneration;
    @Getter
    @Setter
    @Expose
    private String type;
    @Getter
    @Setter
    @Expose
    private Client client;
    @Getter
    @Setter
    @Expose
    private Shop store;


}
