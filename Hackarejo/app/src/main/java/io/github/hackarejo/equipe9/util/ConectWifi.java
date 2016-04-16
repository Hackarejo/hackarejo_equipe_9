package io.github.hackarejo.equipe9.util;

import android.content.Context;
import android.content.IntentFilter;
import android.net.wifi.ScanResult;
import android.net.wifi.WifiConfiguration;
import android.net.wifi.WifiManager;
import android.util.Log;

import java.util.List;

/**
 * Created by paulosilvestre on 16/04/16.
 */
public class ConectWifi {

    private Context context;

    public ConectWifi(Context context){
        this.context = context;
    }

    public void setConnection(){

        String ssid = "Ampernet Hackarejo2016";
        String key = "cit@2016";


        WifiManager mainWifiObj;
        mainWifiObj = (WifiManager) context.getSystemService(Context.WIFI_SERVICE);

        boolean statusWifi = mainWifiObj.isWifiEnabled();

        if (!statusWifi){
            mainWifiObj.setWifiEnabled(true);
        }

        boolean connect = false;
        List<ScanResult> wifiScanList = mainWifiObj.getScanResults();
            for (ScanResult lista : wifiScanList){
                Log.i("REDE ", lista.toString());
                String[] data = lista.toString().split(",");

                String rede = data[0].toString().replace("SSID:","").trim();  //SSID:
                if (rede.equalsIgnoreCase(ssid)){
                    Log.i("REDE", "Encontrei a Rede a Conectar");
                    connect = true;
                    break;
                }
            }

            if (connect){

                Log.i("REDE ATIVANDO", "INICIANDO ATIVAÇÃO WIFI");

                WifiConfiguration wifiConfig = new WifiConfiguration();
                wifiConfig.SSID = String.format("\"%s\"", ssid);
                wifiConfig.preSharedKey = String.format("\"%s\"", key);

                WifiManager wifiManager = (WifiManager) context.getSystemService(Context.WIFI_SERVICE);
                int netId = wifiManager.addNetwork(wifiConfig);

                wifiManager.disconnect();
                wifiManager.enableNetwork(netId, true);
                wifiManager.reconnect();

                //EFETUAR O PROCESSO DE ENVIO DE DADOS PARA SABER QUE O CLIENTE CONECTOU NA SUA WIFI
                Log.i("REDE COMUNICANDO", "ENVIANDO COMUNICADO AO LOJISTA");
                //FINAL DO PROCESSO DE ENVIAR COMUNICADO DIZENDO QUE SE CONECTOU A REDE

                if (!statusWifi){
                    //wifiManager.setWifiEnabled(false);
                }

                Log.i("REDE DESATIVANDO", "FINALIZANDO A CONEXÃO COM A WIFI");

            }

        }

    }
