package io.github.hackarejo.equipe9.rest;

import java.util.List;

import io.github.hackarejo.equipe9.model.LoginBuilder;
import io.github.hackarejo.equipe9.model.Register;
import io.github.hackarejo.equipe9.model.Shop;
import io.github.hackarejo.equipe9.model.User;
import io.github.hackarejo.equipe9.model.Visit;
import retrofit.Callback;
import retrofit.http.Body;
import retrofit.http.Field;
import retrofit.http.FormUrlEncoded;
import retrofit.http.GET;
import retrofit.http.Header;
import retrofit.http.POST;
import retrofit.http.Path;
import retrofit.http.Query;

/**
 * Created by tafarel on 16/04/16.
 */
public interface Api {

    @POST("/entrar.json")
    public void login(@Body LoginBuilder loginBuilder, Callback<User> userCallback);

    @POST("/cadastro.json")
    public void register(@Body Register register, Callback<User> userCallback);

    @GET("/shops.json")
    public void getShops(@Header("access_token") String token, @Query("context") String context, Callback<List<Shop>> shopsCallback);

    @GET("/shops/{id}.json")
    public void getShopBy(@Header("access_token") String token, @Path("id") String id, Callback<Shop> shopCallback);

    @POST("/visits.json")
    public void registerVisit(@Header("access_token") String token, @Body Visit visit, Callback<Visit> VisitCallback);
}
