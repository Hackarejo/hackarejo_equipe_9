package io.github.hackarejo.equipe9.util;

import android.content.Context;
import android.content.SharedPreferences;

import io.github.hackarejo.equipe9.MainActivity;
import io.github.hackarejo.equipe9.R;
import io.github.hackarejo.equipe9.model.Client;
import io.github.hackarejo.equipe9.model.Preference;
import io.github.hackarejo.equipe9.model.User;

/**
 * Created by paulosilvestre on 16/04/16.
 */
public class UserPreferences {

    private Context context;
    public static final String PREFS_NAME = "fidelis_prefs";

    public UserPreferences(Context context){
        this.context = context;
    }

    private boolean savePreferences(String name, String email, String key){

        SharedPreferences settings = context.getSharedPreferences(PREFS_NAME, Context.MODE_PRIVATE);
        SharedPreferences.Editor editor = settings.edit();
        editor.putString("prefname", name);
        editor.putString("prefemail", email);
        editor.putString("prefkey",key);
        if (editor.commit()){
            return true;
        }
        return false;

    }

    private Preference getPreferences() {

        SharedPreferences settings = context.getSharedPreferences(PREFS_NAME, Context.MODE_PRIVATE);
        Preference pref = new Preference();
        pref.setEmail(settings.getString("prefemail",""));
        pref.setName(settings.getString("prefname",""));
        pref.setKey(settings.getString("prefkey",""));

        return pref;

    }

    public void setUser(User user){
       savePreferences(user.getName(), user.getEmail(), user.getAccessToken());
    }

    public User getUser(){
        return new User(getPreferences());
    }

    public void deleteUser(){
        SharedPreferences settings = context.getSharedPreferences(PREFS_NAME, 0);
        SharedPreferences.Editor editor = settings.edit();
        editor.clear();
    }

    public boolean isLogged(){
        User user = getUser();

        return user.getAccessToken() != null && !user.getAccessToken().isEmpty();
    }


}
