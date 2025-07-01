/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author aan
 */
public class model_session {
    private int user_id;
    private String email;
    private String name;

    public model_session(int user_id, String email, String name) {
        this.user_id = user_id;
        this.email = email;
        this.name = name;
    }

    // Getter
    public int getUserId() { return user_id; }
    public String getEmail() { return email; }
    public String getName() { return name; }
}
