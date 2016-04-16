package io.github.hackarejo.equipe9;

import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;

import io.github.hackarejo.equipe9.util.ConectWifi;
import io.github.hackarejo.equipe9.util.GeneratedAlert;

public class MainActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        GeneratedAlert alert = new GeneratedAlert(this);
        alert.getAlert();

//        ConectWifi connect = new ConectWifi(this);
//        connect.setConnection();

    }
}
