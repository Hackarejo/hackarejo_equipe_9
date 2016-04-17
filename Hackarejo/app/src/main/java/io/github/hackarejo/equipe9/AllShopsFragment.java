package io.github.hackarejo.equipe9;

import android.annotation.SuppressLint;
import android.app.Fragment;
import android.content.Intent;
import android.os.Bundle;
import android.support.annotation.Nullable;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.AdapterView;
import android.widget.LinearLayout;
import android.widget.ListAdapter;
import android.widget.ListView;

import java.util.List;

import io.github.hackarejo.equipe9.model.Shop;
import io.github.hackarejo.equipe9.rest.RestClient;
import io.github.hackarejo.equipe9.util.ConectWifi;
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
        public void success(final List<Shop> shops, Response response) {
            ListAdapter allShopsAdapter = new AllShopsAdapter(getActivity().getApplicationContext(), shops);

            listAllShops.setAdapter(allShopsAdapter);

            listAllShops.setOnItemClickListener(new AdapterView.OnItemClickListener() {
                @Override
                public void onItemClick(AdapterView<?> parent, View view, int position, long id) {
                    Intent intent = new Intent(getActivity(), ShopActivity.class);
                    Bundle bundle = new Bundle();
                    bundle.putInt("shop_id", shops.get((int) id).getId());
                    intent.putExtras(bundle);
                    startActivity(intent);
                }
            });
        }

        @Override
        public void failure(RetrofitError error) {

        }
    };
}
