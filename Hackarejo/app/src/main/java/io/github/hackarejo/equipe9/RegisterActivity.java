package io.github.hackarejo.equipe9;

import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.widget.EditText;
import android.widget.Toast;

import butterknife.OnClick;
import io.github.hackarejo.equipe9.model.Client;

public class RegisterActivity extends AppCompatActivity {

    EditText edtName;
    EditText edtEmail;
    EditText edtCpf;
    EditText edtPassword;
    EditText edtConfirmPassword;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_register);

        edtName = (EditText) findViewById(R.id.txtName);
        edtCpf = (EditText) findViewById(R.id.txtCpf);
        edtEmail = (EditText) findViewById(R.id.txtEmail);
        edtPassword = (EditText) findViewById(R.id.txtPassword);
        edtConfirmPassword = (EditText) findViewById(R.id.txtCPassword);

    }


    @OnClick(R.id.buttonSendRegister)
    public void sendRegister(){

        if (edtPassword.getText().toString().equalsIgnoreCase(edtConfirmPassword.getText().toString())){

            Client client = new Client();
            client.setName(edtName.getText().toString());
            client.setEmail(edtEmail.getText().toString());
            client.setCpf(edtCpf.getText().toString());
            client.setPassword(edtPassword.getText().toString());
            client.setStatus("S");

        } else {
            Toast.makeText(RegisterActivity.this,"A Confirmação da Senha está Divergente",Toast.LENGTH_LONG).show();
        }

    }

}
