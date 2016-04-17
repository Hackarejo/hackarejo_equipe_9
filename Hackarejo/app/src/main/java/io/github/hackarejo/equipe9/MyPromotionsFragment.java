package io.github.hackarejo.equipe9;

import android.app.Fragment;
import android.os.Bundle;
import android.support.annotation.Nullable;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ListAdapter;
import android.widget.ListView;

import java.util.ArrayList;
import java.util.List;

import io.github.hackarejo.equipe9.model.Shop;

public class MyPromotionsFragment extends Fragment {

    ListView listMyPromotions;

    public MyPromotionsFragment() {
    }

    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
    }

    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container,
                             Bundle savedInstanceState) {
        return inflater.inflate(R.layout.fragment_my_promotions, container, false);
    }

    @Override
    public void onViewCreated(View view, @Nullable Bundle savedInstanceState) {
        super.onViewCreated(view, savedInstanceState);

        listMyPromotions = (ListView) view.findViewById(R.id.my_promotions_list);
        List<Shop> stores = new ArrayList<>();

        Shop store = new Shop();
        store.setName("LISTA DE PROMOÇÕES");

        stores.add(store);

        ListAdapter myPromotionsAdapter = new PromotionsAdapter(getActivity().getApplicationContext(), stores);

        listMyPromotions.setAdapter(myPromotionsAdapter);
    }
}
