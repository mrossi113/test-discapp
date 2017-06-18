package discapp;


import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;

/**
 * Created by cruot on 6/17/2017.
 */
public class PlayerData {
    private HashMap<String, Player> playerMap = new HashMap<String, Player>();
    Player ruoti;

    private static PlayerData ourInstance = new PlayerData();

    public static PlayerData getInstance() {
        return ourInstance;
    }

    private PlayerData() {
        // rounds for cruoti@gmail.com
        Round round1 = new Round(new Date(), "wickham", new ArrayList<Integer>(Arrays.asList(3, 3, 2, 3, 4, 5, 2, 6, 2, 3, 3, 3, 3, 4, 2, 3, 3, 3)));
        Round round2 = new Round(new Date(), "wickham", new ArrayList<Integer>(Arrays.asList(3, 3, 4, 2, 5, 4, 3, 3, 2, 3, 3, 3, 3, 4, 2, 3, 3, 3)));
        Round round3 = new Round(new Date(), "vernon", new ArrayList<Integer>(Arrays.asList(3, 3, 2, 3, 2, 4, 3, 2, 2, 3, 2, 2, 3, 2, 3, 2, 2, 4)));
        Player cruoti = new Player("cruoti@gmail.com", new ArrayList<Round>(Arrays.asList(round1, round2, round3)));

        //rounds for will@gmail.com
        Player will = new Player("will@gmail.com", new ArrayList<Round>(Arrays.asList(
                new Round(new Date(), "wickham", new ArrayList<Integer>(Arrays.asList(3, 3, 3, 3, 3, 4, 3, 3, 3, 3, 3, 3, 3, 4, 2, 3, 3, 3))),
                new Round(new Date(), "vernon", new ArrayList<Integer>(Arrays.asList(2, 3, 3, 4, 2, 3, 2, 3, 3, 3, 2, 2, 3, 2, 2, 2, 3, 4)))
        )));

        // put values in hash
        playerMap.put("cruoti@gmail.com", cruoti);
        playerMap.put("will@gmail.com", will);
    }

    public Player getPlayer(String username) {
        return playerMap.get(username);
    }
}
