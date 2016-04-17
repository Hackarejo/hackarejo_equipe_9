package io.github.hackarejo.equipe9.model;

import com.google.gson.annotations.Expose;

import java.io.Serializable;

/**
 * Created by tafarel on 16/04/16.
 */
public class LoginBuilder implements Serializable {

    public LoginBuilder(User user) {
        this.user = user;
    }

    @Expose
    private User user;
}
