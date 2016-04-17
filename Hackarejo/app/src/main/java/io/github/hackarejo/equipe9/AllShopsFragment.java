package io.github.hackarejo.equipe9;

import android.app.Fragment;
import android.os.Bundle;
import android.support.annotation.Nullable;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ListAdapter;
import android.widget.ListView;

import java.util.List;

import io.github.hackarejo.equipe9.model.Shop;
import io.github.hackarejo.equipe9.rest.RestClient;
import io.github.hackarejo.equipe9.util.UserPreferences;
import retrofit.Callback;
import retrofit.RetrofitError;
import retrofit.client.Response;

public class AllShopsFragment extends Fragment {

    ListView listAllShops;

    public AllShopsFragment() {
    }

    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
    }

    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container,
                             Bundle savedInstanceState) {
        return inflater.inflate(R.layout.fragment_all_shops, container, false);
    }

    @Override
    public void onViewCreated(View view, @Nullable Bundle savedInstanceState) {
        super.onViewCreated(view, savedInstanceState);

        listAllShops = (ListView) view.findViewById(R.id.my_allstores_list);
        UserPreferences preferences = new UserPreferences(getActivity().getApplicationContext());
        String token = preferences.getUser().getAccessToken();
        RestClient.api().getShops(token, "all", shopsCallback);
    }

    Callback<List<Shop>> shopsCallback = new Callback<List<Shop>>() {
        @Override
        public void success(List<Shop> shops, Response response) {
            ListAdapter allShopsAdapter = new AllShopsAdapter(getActivity().getApplicationContext(), shops);

            listAllShops.setAdapter(allShopsAdapter);
        }

        @Override
        public void failure(RetrofitError error) {

        }
    };
}
