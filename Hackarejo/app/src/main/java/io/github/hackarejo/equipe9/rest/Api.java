package io.github.hackarejo.equipe9.rest;

import io.github.hackarejo.equipe9.model.User;
import retrofit.Callback;
import retrofit.http.Field;
import retrofit.http.GET;
import retrofit.http.POST;

/**
 * Created by tafarel on 16/04/16.
 */
public interface Api {

    @POST("/users/sign_up")
    public void login(@Field("email") String email, @Field("password") String password, Callback<User> userCallback);
}
