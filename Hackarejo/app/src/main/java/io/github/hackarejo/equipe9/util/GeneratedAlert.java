package io.github.hackarejo.equipe9.util;

import android.app.AlarmManager;
import android.app.PendingIntent;
import android.content.Context;
import android.content.Intent;
import android.util.Log;

import java.util.Calendar;

import io.github.hackarejo.equipe9.MainActivity;

/**
 * Created by paulosilvestre on 16/04/16.
 */
public class GeneratedAlert {

    private Context ct;

    public GeneratedAlert(Context ct){
        this.ct = ct;
    }

    public void getAlert() {

        boolean alarmeAtivo = (PendingIntent.getBroadcast(ct, 0, new Intent("GERA_CONEXAO_SERVIDOR"), PendingIntent.FLAG_NO_CREATE) == null);

        if (alarmeAtivo) {
            Log.i("Script", "Novo alarme");

            Intent intent = new Intent("GERA_CONEXAO_SERVIDOR");
            PendingIntent p = PendingIntent.getBroadcast(ct, 0, intent, 0);

            Calendar c = Calendar.getInstance();
            c.setTimeInMillis(System.currentTimeMillis());
            c.add(Calendar.SECOND, 13);

            AlarmManager alarme = (AlarmManager) ct.getSystemService(Context.ALARM_SERVICE);
            alarme.setRepeating(AlarmManager.RTC_WAKEUP, c.getTimeInMillis(), 60000, p);
        } else {
            Log.i("Script", "Alarme já ativo");
        }
    }

}
