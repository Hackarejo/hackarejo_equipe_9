package io.github.hackarejo.equipe9;

import android.content.Intent;
import android.os.Bundle;
import android.support.v7.app.AppCompatActivity;
import android.util.Log;
import android.view.Window;
import android.view.WindowManager;
import android.widget.TextView;
import android.widget.Toast;

import butterknife.Bind;
import butterknife.ButterKnife;
import butterknife.OnClick;
import io.github.hackarejo.equipe9.model.LoginBuilder;
import io.github.hackarejo.equipe9.model.User;
import io.github.hackarejo.equipe9.rest.RestClient;
import io.github.hackarejo.equipe9.util.UserPreferences;
import retrofit.Callback;
import retrofit.RetrofitError;
import retrofit.client.Response;

public class LoginActivity extends AppCompatActivity {

    @Bind(R.id.txtUser)
    TextView tvUser;

    @Bind(R.id.txtPassword)
    TextView tvPassword;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);

        requestWindowFeature(Window.FEATURE_NO_TITLE);
        getWindow().setFlags(WindowManager.LayoutParams.FLAG_FULLSCREEN,
                WindowManager.LayoutParams.FLAG_FULLSCREEN);

        setContentView(R.layout.activity_login);

        ButterKnife.bind(this);

    }

    @OnClick(R.id.buttonRegister)
    public void getRegister() {
        Intent intent = new Intent(LoginActivity.this, RegisterActivity.class);
        startActivity(intent);
        finish();
    }

    @OnClick(R.id.buttonLogin)
    public void login() {
        User user = new User();
        user.setEmail(tvUser.getText().toString());
        user.setPassword(tvPassword.getText().toString());
        LoginBuilder loginBuilder = new LoginBuilder(user);
        RestClient.api().login(loginBuilder, userCallback);
    }

    Callback<User> userCallback = new Callback<User>() {
        @Override
        public void success(User user, Response response) {
            Toast.makeText(getApplicationContext(), "Usuário registrado com sucesso.", Toast.LENGTH_SHORT).show();
            UserPreferences userPreferences = new UserPreferences(getApplicationContext());

            userPreferences.setUser(user);

            Intent intent = new Intent(LoginActivity.this, HomeActivity.class);
            startActivity(intent);
            finish();
        }

        @Override
        public void failure(RetrofitError error) {
            Log.e("Register", error.getMessage());
            Toast.makeText(getApplicationContext(), "Não foi possível realizar seu cadastro.", Toast.LENGTH_LONG).show();
        }
    };

}
