package io.github.hackarejo.equipe9.util;

import android.content.Context;
import android.content.SharedPreferences;

import io.github.hackarejo.equipe9.MainActivity;
import io.github.hackarejo.equipe9.R;
import io.github.hackarejo.equipe9.model.Preference;

/**
 * Created by paulosilvestre on 16/04/16.
 */
public class Preferences {

    private Context context;
    public static final String PREFS_NAME = "preferences";

    public Preferences(Context context){
        this.context = context;
    }

    public boolean savePreferences(String name, String email, String key){

        SharedPreferences settings = context.getSharedPreferences(PREFS_NAME, 0);
        SharedPreferences.Editor editor = settings.edit();
        editor.putString("prefname", name);
        editor.putString("prefemail", email);
        editor.putString("prefkey",key);
        if (editor.commit()){
            return true;
        }
        return false;

    }

    public Preference getPreferences() {

        SharedPreferences settings = context.getSharedPreferences(PREFS_NAME, 0);
        Preference pref = new Preference();
        pref.setEmail(settings.getString("prefemail",""));
        pref.setName(settings.getString("prefname",""));
        pref.setKey(settings.getString("prefkey",""));

        return pref;

    }



}
