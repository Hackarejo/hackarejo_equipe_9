package io.github.hackarejo.equipe9;

import android.content.Context;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.BaseAdapter;
import android.widget.TextView;

import java.util.List;

import io.github.hackarejo.equipe9.model.Shop;

/**
 * Created by tafarel on 16/04/16.
 */

public class MyShopsAdapter extends BaseAdapter {
    Context context;
    List<Shop> shops;

    TextView tvStoreName;
    TextView tvStorePoints;

    public MyShopsAdapter(Context context, List<Shop> shops) {
        this.context = context;
        this.shops = shops;
    }

    @Override
    public int getCount() {
        return shops.size();
    }

    @Override
    public Object getItem(int position) {
        return shops.get(position);
    }

    @Override
    public long getItemId(int position) {
        return position;
    }

    @Override
    public View getView(final int position, View convertView, ViewGroup parent) {
        final Shop shop = shops.get(position);
        LayoutInflater inflater = (LayoutInflater)
                context.getSystemService(Context.LAYOUT_INFLATER_SERVICE);
        View view = inflater.inflate(R.layout.fragment_my_shops_item, null);

        tvStoreName = (TextView) view.findViewById(R.id.my_stores_store_name);
        tvStorePoints = (TextView) view.findViewById(R.id.my_stores_store_points);

        tvStoreName.setText(shop.getName());
        tvStorePoints.setText(shop.getCredits().toString() + " pontos");

        return view;
    }
}
