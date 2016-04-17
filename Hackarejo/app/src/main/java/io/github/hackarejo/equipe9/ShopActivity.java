package io.github.hackarejo.equipe9;

import android.os.Bundle;
import android.support.design.widget.FloatingActionButton;
import android.support.design.widget.Snackbar;
import android.support.v7.app.AppCompatActivity;
import android.support.v7.widget.Toolbar;
import android.view.MenuItem;
import android.view.View;
import android.widget.LinearLayout;
import android.widget.TextView;

import butterknife.Bind;
import butterknife.ButterKnife;
import io.github.hackarejo.equipe9.model.Shop;
import io.github.hackarejo.equipe9.rest.RestClient;
import io.github.hackarejo.equipe9.util.UserPreferences;
import retrofit.Callback;
import retrofit.RetrofitError;
import retrofit.client.Response;

public class ShopActivity extends AppCompatActivity {

    int shopId;

    @Bind(R.id.shop_name)
    TextView tvShopName;

    @Bind(R.id.shop_info)
    TextView tvShopInfo;

    @Bind(R.id.shop_credits_container)
    LinearLayout containerShopCredits;

    @Bind(R.id.shop_credits)
    TextView tvShopCredits;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_shop);
        ButterKnife.bind(this);
        Toolbar toolbar = (Toolbar) findViewById(R.id.toolbar);
        setSupportActionBar(toolbar);

        getSupportActionBar().setTitle("Loja");
        getSupportActionBar().setDisplayHomeAsUpEnabled(true);

        shopId = getIntent().getIntExtra("shop_id", 0);

        UserPreferences preferences = new UserPreferences(getApplicationContext());

        RestClient.api().getShopBy(preferences.getUser().getAccessToken(), String.valueOf(shopId), shopCallback);
    }

    Callback<Shop> shopCallback = new Callback<Shop>() {
        @Override
        public void success(Shop shop, Response response) {
            tvShopName.setText(shop.getName());
            tvShopInfo.setText(shop.getInfo());
            if (shop.getCredits() != null) {
                containerShopCredits.setVisibility(View.VISIBLE);
                tvShopCredits.setText(String.valueOf(shop.getCredits()));
            }
        }

        @Override
        public void failure(RetrofitError error) {

        }
    };

    @Override
    public boolean onOptionsItemSelected(MenuItem item) {
        switch (item.getItemId()) {
            case android.R.id.home:
                finish();
            default:
                return super.onOptionsItemSelected(item);
        }
    }
}
