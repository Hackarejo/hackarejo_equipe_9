package io.github.hackarejo.equipe9.model;

import com.google.gson.annotations.Expose;

import java.io.Serializable;

import lombok.Getter;
import lombok.Setter;

/**
 * Created by paulosilvestre on 16/04/16.
 */
public class Preference implements Serializable {

    @Getter
    @Setter
    private String name;

    @Getter
    @Setter
    private String email;

    @Getter
    @Setter
    private String key;


}
