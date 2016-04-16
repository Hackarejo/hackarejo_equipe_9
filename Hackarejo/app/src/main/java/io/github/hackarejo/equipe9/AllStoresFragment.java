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

import io.github.hackarejo.equipe9.model.Store;

public class AllStoresFragment extends Fragment {

    ListView listAllStores;

    public AllStoresFragment() {
    }

    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
    }

    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container,
                             Bundle savedInstanceState) {
        return inflater.inflate(R.layout.fragment_my_allstores, container, false);
    }

    @Override
    public void onViewCreated(View view, @Nullable Bundle savedInstanceState) {
        super.onViewCreated(view, savedInstanceState);

        listAllStores = (ListView) view.findViewById(R.id.my_allstores_list);
        List<Store> stores = new ArrayList<>();

        Store store = new Store();
        store.setName("Lojas Lorem Ipsum");

        stores.add(store);

        ListAdapter myStoresAdapter = new MyStoresAdapter(getActivity().getApplicationContext(), stores);

        listAllStores.setAdapter(myStoresAdapter);
    }
}
