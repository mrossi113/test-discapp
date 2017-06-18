package discapp;


import java.util.ArrayList;

/**
 * Created by cruot on 6/16/2017.
 */
public class Player {
    private String username;
    private ArrayList<Round> rounds;

    public Player(String username, ArrayList<Round> rounds)
    {
        this.username = username;
        this.rounds = rounds;
    }

    public String get_username()
    {
        return this.username;
    }

    public ArrayList<Round> get_rounds()
    {
        return this.rounds;
    }
}
