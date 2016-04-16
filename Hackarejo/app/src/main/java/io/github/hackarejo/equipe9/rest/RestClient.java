package io.github.hackarejo.equipe9.rest;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import retrofit.RestAdapter;
import retrofit.converter.GsonConverter;

/**
 * Created by tafarel on 16/04/16.
 */
public class RestClient {
    private static Api api;
    public static String ROOT = "http://api.wegorun.com.br";

    static {
        setupRestClient();
    }

    private RestClient() {
    }

    public static Api api() {
        return api;
    }

    private static void setupRestClient() {
        Gson gson = new GsonBuilder()
                .registerTypeAdapterFactory(new ItemTypeAdapterFactory())
                .setDateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'")
                .create();

        RestAdapter restAdapter = new RestAdapter.Builder()
                .setEndpoint(ROOT)
                .setConverter(new GsonConverter(gson))
                .setLogLevel(RestAdapter.LogLevel.FULL)
                .build();

        api = restAdapter.create(Api.class);
    }
}
