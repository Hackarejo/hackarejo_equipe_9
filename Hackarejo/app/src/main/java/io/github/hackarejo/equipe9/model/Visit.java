package io.github.hackarejo.equipe9.model;

import com.google.gson.annotations.Expose;
import com.google.gson.annotations.SerializedName;

import java.io.Serializable;
import java.util.Date;

import lombok.Getter;
import lombok.Setter;

/**
 * Created by paulosilvestre on 16/04/16.
 */
public class Visit implements Serializable {

    @Getter
    @Setter
    @Expose
    private int id;
    @Getter
    @Setter
    @Expose
    private Date dateVisit;
    @Getter
    @Setter
    @Expose
    private String process;
    @Getter
    @Setter
    @Expose
    private Shop store;
    @Getter
    @Setter
    @Expose
    private Client client;
    @Getter
    @Setter
    @Expose
    @SerializedName("wireless_name")
    private String wirelessName;

    public Visit(String wirelessName) {
        this.wirelessName = wirelessName;
    }
}
