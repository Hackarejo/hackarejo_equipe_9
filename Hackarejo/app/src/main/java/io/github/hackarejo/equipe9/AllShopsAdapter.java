package io.github.hackarejo.equipe9;

import android.content.Context;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.BaseAdapter;
import android.widget.TextView;

import java.util.List;

import butterknife.Bind;
import io.github.hackarejo.equipe9.model.Shop;

/**
 * Created by tafarel on 16/04/16.
 */

public class AllShopsAdapter extends BaseAdapter {

    Context context;
    List<Shop> stores;

    @Bind(R.id.my_stores_store_name)
    TextView tvStoreName;

    @Bind(R.id.my_stores_store_points)
    TextView tvStorePoints;

    public AllShopsAdapter(Context context, List<Shop> stores) {
        this.context = context;
        this.stores = stores;
    }

    @Override
    public int getCount() {
        return stores.size();
    }

    @Override
    public Object getItem(int position) {
        return stores.get(position);
    }

    @Override
    public long getItemId(int position) {
        return position;
    }

    @Override
    public View getView(final int position, View convertView, ViewGroup parent) {
        final Shop store = stores.get(position);
        LayoutInflater inflater = (LayoutInflater)
                context.getSystemService(Context.LAYOUT_INFLATER_SERVICE);
        View view = inflater.inflate(R.layout.fragment_all_stores_item, null);

        return view;
    }
}
