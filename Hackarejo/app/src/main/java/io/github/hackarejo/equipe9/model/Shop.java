package io.github.hackarejo.equipe9.model;

import com.google.gson.annotations.Expose;
import com.google.gson.annotations.SerializedName;

import java.io.Serializable;

import lombok.Getter;
import lombok.Setter;

/**
 * Created by paulosilvestre on 16/04/16.
 */
public class Shop implements Serializable {

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
    private String cnpj;
    @Getter
    @Setter
    @Expose
    private String address;
    @Getter
    @Setter
    @Expose
    private String phone;
    @Getter
    @Setter
    @Expose
    private String email;
    @Getter
    @Setter
    @Expose
    private String info;
    @Getter
    @Setter
    @Expose
    @SerializedName("company_name")
    private String companyName;
    @Getter
    @Setter
    @Expose
    private Integer credits;
}
