package io.github.hackarejo.equipe9;

import android.content.Intent;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.util.Log;
import android.widget.EditText;
import android.widget.Toast;

import butterknife.ButterKnife;
import butterknife.OnClick;
import io.github.hackarejo.equipe9.model.Client;
import io.github.hackarejo.equipe9.model.Register;
import io.github.hackarejo.equipe9.model.User;
import io.github.hackarejo.equipe9.rest.RestClient;
import io.github.hackarejo.equipe9.util.UserPreferences;
import retrofit.Callback;
import retrofit.RetrofitError;
import retrofit.client.Response;

public class RegisterActivity extends AppCompatActivity {

    public EditText edtName;
    public EditText edtEmail;
    public EditText edtCpf;
    public EditText edtPassword;
    public EditText edtConfirmPassword;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_register);

        ButterKnife.bind(this);

        edtName = (EditText) findViewById(R.id.txtName);
        edtCpf = (EditText) findViewById(R.id.txtCpf);
        edtEmail = (EditText) findViewById(R.id.txtEmail);
        edtPassword = (EditText) findViewById(R.id.txtRPassword);
        edtConfirmPassword = (EditText) findViewById(R.id.txtCPassword);

    }


    @OnClick(R.id.buttonSendRegister)
    public void sendRegister() {

        if (edtPassword.getText().toString().equalsIgnoreCase(edtConfirmPassword.getText().toString())) {

            User user = new User();
            user.setName(edtName.getText().toString());
            user.setEmail(edtEmail.getText().toString());
            //user.setCpf(edtCpf.getText().toString());
            user.setPassword(edtPassword.getText().toString());
            user.setStatus("S");

            Register register = new Register(user, "client");

            Callback<User> userCallback = new Callback<User>() {
                @Override
                public void success(User user, Response response) {
                    Toast.makeText(getApplicationContext(), "Usuário registrado com sucesso.", Toast.LENGTH_SHORT).show();
                    UserPreferences userPreferences = new UserPreferences(getApplicationContext());

                    userPreferences.setUser(user);

                    Intent intent = new Intent(RegisterActivity.this, HomeActivity.class);
                    startActivity(intent);
                    finish();
                }

                @Override
                public void failure(RetrofitError error) {
                    Log.e("Register", error.getMessage());
                    Toast.makeText(getApplicationContext(), "Não foi possível realizar seu cadastro.", Toast.LENGTH_LONG).show();
                }
            };

            RestClient.api().register(register, userCallback);

        } else {
            Toast.makeText(RegisterActivity.this, "A Confirmação da Senha está Divergente", Toast.LENGTH_LONG).show();
        }

    }

}
