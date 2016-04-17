package io.github.hackarejo.equipe9.model;

import com.google.gson.annotations.Expose;
import com.google.gson.annotations.SerializedName;

import java.io.Serializable;

import lombok.Getter;
import lombok.Setter;

/**
 * Created by paulosilvestre on 16/04/16.
 */
public class User implements Serializable {

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
    private String email;
    @Getter
    @Setter
    @Expose
    private String password;
    @Getter
    @Setter
    @Expose
    @SerializedName("password_confirmation")
    private String passwordConfirmation;
    @Getter
    @Setter
    @Expose
    private String status;
    @Getter
    @Setter
    @Expose
    private String role;
    @Getter
    @Setter
    @Expose
    private Store store;
    @Getter
    @Setter
    @Expose
    @SerializedName("access_token")
    private String accessToken;

    public User() {
    }

    public User(Preference preference) {
        this.name = preference.getName();
        this.email = preference.getEmail();
        this.accessToken = preference.getKey();
    }
}
