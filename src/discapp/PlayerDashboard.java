package discapp;


import java.lang.reflect.Array;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

/**
 * Created by cruot on 6/16/2017.
 */
public class PlayerDashboard implements java.io.Serializable{
    private Player player;
    private int recent_round_size = 5;
    PlayerData data = PlayerData.getInstance();

    public PlayerDashboard() {
        ArrayList<Round> rounds = new ArrayList<Round>();
        String user = "temp";
        this.player = new Player(user, rounds);
    }

    public Player getPlayer() {
        return this.player;
    }

    public void setPlayer(Player player) {
        this.player = player;
    }

    public void setPlayerString(String username) {
        this.player = data.getPlayer(username);
    }

    public String getMessage() {
        return this.player.get_username() + ", you are awesome!!!" ;
    }

    public ArrayList<Round> getPlayerRounds() {
        return this.player.get_rounds();
    }

    public List<Round> getRecentPlayerRounds() {
        int recent_size = this.recent_round_size;
        if(recent_size > this.player.get_rounds().size())
        {
            recent_size = this.player.get_rounds().size();
        }
        return this.player.get_rounds().subList(0, recent_size);
    }

    public Set<String> getPlayedCourseNames() {
        Set<String> courseNames = new HashSet<String>();

        for(Round round : this.getPlayerRounds())
        {
            courseNames.add(round.getCourse_name());
        }

        return courseNames;
    }
}

