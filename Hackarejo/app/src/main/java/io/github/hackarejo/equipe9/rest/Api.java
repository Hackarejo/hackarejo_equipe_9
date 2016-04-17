package io.github.hackarejo.equipe9.rest;

import io.github.hackarejo.equipe9.model.LoginBuilder;
import io.github.hackarejo.equipe9.model.Register;
import io.github.hackarejo.equipe9.model.User;
import retrofit.Callback;
import retrofit.http.Body;
import retrofit.http.Field;
import retrofit.http.FormUrlEncoded;
import retrofit.http.GET;
import retrofit.http.POST;

/**
 * Created by tafarel on 16/04/16.
 */
public interface Api {

    @POST("/entrar.json")
    public void login(@Body LoginBuilder loginBuilder, Callback<User> userCallback);

    @POST("/cadastro.json")
    public void register(@Body Register register, Callback<User> userCallback);
}
