package io.github.hackarejo.equipe9.model;

import com.google.gson.annotations.Expose;

import java.io.Serializable;

import lombok.Getter;
import lombok.Setter;

/**
 * Created by paulosilvestre on 16/04/16.
 */
public class StoreConfiguration implements Serializable {

    @Getter
    @Setter
    @Expose
    private int id;

    @Getter
    @Setter
    @Expose
    private String conversion;
    @Getter
    @Setter
    @Expose
    private double pointValue;
    @Getter
    @Setter
    @Expose
    private Store store;

}
