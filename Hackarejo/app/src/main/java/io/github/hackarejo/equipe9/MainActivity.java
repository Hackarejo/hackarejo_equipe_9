package io.github.hackarejo.equipe9;

import android.content.Intent;
import android.os.Handler;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.util.Log;
import android.view.Window;
import android.view.WindowManager;

import io.github.hackarejo.equipe9.util.ConectWifi;
import io.github.hackarejo.equipe9.util.GeneratedAlert;
import io.github.hackarejo.equipe9.util.UserPreferences;

public class MainActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        requestWindowFeature(Window.FEATURE_NO_TITLE);
        getWindow().setFlags(WindowManager.LayoutParams.FLAG_FULLSCREEN,
                WindowManager.LayoutParams.FLAG_FULLSCREEN);

        setContentView(R.layout.activity_main);

        new Handler().postDelayed(new Runnable() {
            @Override
            public void run() {
                redirectTo();
            }
        }, 3000);

        GeneratedAlert alert = new GeneratedAlert(this);
        alert.getAlert();
    }
//        ConectWifi connect = new ConectWifi(this);
//        connect.setConnection();

    public void redirectTo() {
        UserPreferences userPreferences = new UserPreferences(getApplicationContext());
        Intent intent;

        if (userPreferences.isLogged()) {
            intent = new Intent(MainActivity.this, HomeActivity.class);
            Log.i("Splash", "Está logado.");
        } else {
            //TODO: Redirecionar para tela de login
            intent = new Intent(MainActivity.this, HomeActivity.class);
            Log.i("Splash", "Nâo está logado.");
        }
        startActivity(intent);
        finish();
    }
}
