package io.github.hackarejo.equipe9.model;

import com.google.gson.annotations.Expose;
import com.google.gson.annotations.SerializedName;

import java.io.Serializable;

/**
 * Created by tafarel on 16/04/16.
 */
public class Register implements Serializable {
    @Expose
    User user;

    @Expose
    @SerializedName("user_type")
    String userType;

    public Register(User user, String userType){
        this.user = user;
        this.userType = userType;
    }
}
